   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  20                     .const:	section	.text
  21  0000               __vectab:
  22  0000 82            	dc.b	130
  24  0001 00            	dc.b	page(__stext)
  25  0002 0000          	dc.w	__stext
  26  0004 82            	dc.b	130
  28  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  29  0006 0000          	dc.w	f_TRAP_IRQHandler
  30  0008 82            	dc.b	130
  32  0009 00            	dc.b	page(f_NonHandledInterrupt)
  33  000a 0000          	dc.w	f_NonHandledInterrupt
  34  000c 82            	dc.b	130
  36  000d 00            	dc.b	page(f_FLASH_IRQHandler)
  37  000e 0000          	dc.w	f_FLASH_IRQHandler
  38  0010 82            	dc.b	130
  40  0011 00            	dc.b	page(f_NonHandledInterrupt)
  41  0012 0000          	dc.w	f_NonHandledInterrupt
  42  0014 82            	dc.b	130
  44  0015 00            	dc.b	page(f_NonHandledInterrupt)
  45  0016 0000          	dc.w	f_NonHandledInterrupt
  46  0018 82            	dc.b	130
  48  0019 00            	dc.b	page(f_AWU_IRQHandler)
  49  001a 0000          	dc.w	f_AWU_IRQHandler
  50  001c 82            	dc.b	130
  52  001d 00            	dc.b	page(f_NonHandledInterrupt)
  53  001e 0000          	dc.w	f_NonHandledInterrupt
  54  0020 82            	dc.b	130
  56  0021 00            	dc.b	page(f_EXTIB_IRQHandler)
  57  0022 0000          	dc.w	f_EXTIB_IRQHandler
  58  0024 82            	dc.b	130
  60  0025 00            	dc.b	page(f_EXTID_IRQHandler)
  61  0026 0000          	dc.w	f_EXTID_IRQHandler
  62  0028 82            	dc.b	130
  64  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  65  002a 0000          	dc.w	f_EXTI0_IRQHandler
  66  002c 82            	dc.b	130
  68  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
  69  002e 0000          	dc.w	f_EXTI1_IRQHandler
  70  0030 82            	dc.b	130
  72  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  73  0032 0000          	dc.w	f_EXTI2_IRQHandler
  74  0034 82            	dc.b	130
  76  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
  77  0036 0000          	dc.w	f_EXTI3_IRQHandler
  78  0038 82            	dc.b	130
  80  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  81  003a 0000          	dc.w	f_EXTI4_IRQHandler
  82  003c 82            	dc.b	130
  84  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
  85  003e 0000          	dc.w	f_EXTI5_IRQHandler
  86  0040 82            	dc.b	130
  88  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
  89  0042 0000          	dc.w	f_EXTI6_IRQHandler
  90  0044 82            	dc.b	130
  92  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
  93  0046 0000          	dc.w	f_EXTI7_IRQHandler
  94  0048 82            	dc.b	130
  96  0049 00            	dc.b	page(f_NonHandledInterrupt)
  97  004a 0000          	dc.w	f_NonHandledInterrupt
  98  004c 82            	dc.b	130
 100  004d 00            	dc.b	page(f_NonHandledInterrupt)
 101  004e 0000          	dc.w	f_NonHandledInterrupt
 102  0050 82            	dc.b	130
 104  0051 00            	dc.b	page(f_COMP_IRQHandler)
 105  0052 0000          	dc.w	f_COMP_IRQHandler
 106  0054 82            	dc.b	130
 108  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_IRQHandler)
 109  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 110  0058 82            	dc.b	130
 112  0059 00            	dc.b	page(f_TIM2_CAP_IRQHandler)
 113  005a 0000          	dc.w	f_TIM2_CAP_IRQHandler
 114  005c 82            	dc.b	130
 116  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_IRQHandler)
 117  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 118  0060 82            	dc.b	130
 120  0061 00            	dc.b	page(f_TIM3_CAP_IRQHandler)
 121  0062 0000          	dc.w	f_TIM3_CAP_IRQHandler
 122  0064 82            	dc.b	130
 124  0065 00            	dc.b	page(f_NonHandledInterrupt)
 125  0066 0000          	dc.w	f_NonHandledInterrupt
 126  0068 82            	dc.b	130
 128  0069 00            	dc.b	page(f_NonHandledInterrupt)
 129  006a 0000          	dc.w	f_NonHandledInterrupt
 130  006c 82            	dc.b	130
 132  006d 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
 133  006e 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
 134  0070 82            	dc.b	130
 136  0071 00            	dc.b	page(f_SPI_IRQHandler)
 137  0072 0000          	dc.w	f_SPI_IRQHandler
 138  0074 82            	dc.b	130
 140  0075 00            	dc.b	page(f_USART_TX_IRQHandler)
 141  0076 0000          	dc.w	f_USART_TX_IRQHandler
 142  0078 82            	dc.b	130
 144  0079 00            	dc.b	page(f_USART_RX_IRQHandler)
 145  007a 0000          	dc.w	f_USART_RX_IRQHandler
 146  007c 82            	dc.b	130
 148  007d 00            	dc.b	page(f_I2C_IRQHandler)
 149  007e 0000          	dc.w	f_I2C_IRQHandler
 209                     	xdef	__vectab
 210                     	xref	f_I2C_IRQHandler
 211                     	xref	f_USART_RX_IRQHandler
 212                     	xref	f_USART_TX_IRQHandler
 213                     	xref	f_SPI_IRQHandler
 214                     	xref	f_TIM4_UPD_OVF_IRQHandler
 215                     	xref	f_TIM3_CAP_IRQHandler
 216                     	xref	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 217                     	xref	f_TIM2_CAP_IRQHandler
 218                     	xref	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 219                     	xref	f_COMP_IRQHandler
 220                     	xref	f_EXTI7_IRQHandler
 221                     	xref	f_EXTI6_IRQHandler
 222                     	xref	f_EXTI5_IRQHandler
 223                     	xref	f_EXTI4_IRQHandler
 224                     	xref	f_EXTI3_IRQHandler
 225                     	xref	f_EXTI2_IRQHandler
 226                     	xref	f_EXTI1_IRQHandler
 227                     	xref	f_EXTI0_IRQHandler
 228                     	xref	f_EXTID_IRQHandler
 229                     	xref	f_EXTIB_IRQHandler
 230                     	xref	f_AWU_IRQHandler
 231                     	xref	f_FLASH_IRQHandler
 232                     	xref	f_TRAP_IRQHandler
 233                     	xref	f_NonHandledInterrupt
 234                     	xref	__stext
 253                     	end
