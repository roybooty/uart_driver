#include <stdint.h>

#define RCC_APB2ENR (*(volatile uint32_t*)(0x40021000+0x18))
#define USART_SR_TXE (1U << 7)
#define USART_SR_RXNE (1u << 5)
#define NVIC (*(volatile uint32_t*)(0xe000e100))
#define NVIC_ISER1 (*((volatile unsigned long *)0xe000e104))
#define NVIC_ICPR1       (*((volatile unsigned int *)0xE000E284))
#define NVIC_IPR9 (*((volatile unsigned long *)0xE000E424))

struct usart {
    volatile uint32_t SR,DR,BRR,CR1,CR2,CR3,GTPR;
};
struct gpio {
    volatile uint32_t CRL, CRH, IDR, ODR, BSRR, BRR, LCKR;
};

#define GPIOA ((struct gpio*)0x40010800)
#define USART1 ((struct usart*)0x40013800)

void USART1_putc(char c){
    while(!(USART1->SR & USART_SR_TXE));
    USART1->DR = 0x000000ff&c;
}

void USART1_puts(const char *ch) {
    while(*ch) {
        USART1_putc(*ch);
        ch++;
    }
}

void USART1_IRQHandler(void) {
    if(USART1->SR & USART_SR_RXNE){
        USART1_putc(USART1->DR & 0xff);
    }
}

int main(void) {
    RCC_APB2ENR |= (1 << 14);
    RCC_APB2ENR |= (1 << 2);

    GPIOA->CRH &= ~(0xFU << 4);
    GPIOA->CRH &= ~(0xFU << 8);

    GPIOA->CRH |= (0b1110 << 4);
    GPIOA->CRH |= (0b0100 << 8);

    USART1->CR1 |= (1 << 3);
    USART1->CR1 |= (1 << 2);
    USART1->CR1 |= (1 << 5);
    USART1->CR1 |= (1 << 13);
    USART1->BRR = 8000000 / 9600;

    // NVIC_ICPR1 |= (1 << 5);
    // NVIC_ISER1 |= (1 << 5);
    // NVIC_IPR9 |= (0x05 << (4+8));

    __asm volatile ("cpsie i" : : : "memory");
    while(1){
        // __asm volatile ("wfi");
    USART1_puts("System Ready!\r\n");
    }

    return 0;
}

__attribute__((naked, noreturn)) void _reset(void) {
    extern long _sbss, _ebss, _sdata, _edata, _sidata;
    for (long *dst = &_sbss;dst < &_ebss;dst++) *dst = 0;
    for (long *dst = &_sdata, *src=&_sidata;dst<&_edata;) *dst++ = *src++;
    main();
    for (;;)(void) 0;
}

extern void _estack(void);
__attribute__((section(".vectors"))) void (*const tab[16 + 43])(void) = {
    _estack, _reset,[2 ... 52] = 0,[53] = USART1_IRQHandler
};
