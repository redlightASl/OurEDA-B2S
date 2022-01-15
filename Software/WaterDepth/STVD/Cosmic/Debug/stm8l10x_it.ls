   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  49                     ; 48 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  49                     ; 49 {
  50                     .text:	section	.text,new
  51  0000               f_NonHandledInterrupt:
  55                     ; 53 }
  58  0000 80            	iret	
  80                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  80                     ; 62 {
  81                     .text:	section	.text,new
  82  0000               f_TRAP_IRQHandler:
  86                     ; 66 }
  89  0000 80            	iret	
 111                     ; 73 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 111                     ; 74 {
 112                     .text:	section	.text,new
 113  0000               f_FLASH_IRQHandler:
 117                     ; 78 }
 120  0000 80            	iret	
 142                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 142                     ; 86 {
 143                     .text:	section	.text,new
 144  0000               f_AWU_IRQHandler:
 148                     ; 90 }
 151  0000 80            	iret	
 173                     ; 97 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 173                     ; 98 {
 174                     .text:	section	.text,new
 175  0000               f_EXTIB_IRQHandler:
 179                     ; 102 }
 182  0000 80            	iret	
 204                     ; 109 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 204                     ; 110 {
 205                     .text:	section	.text,new
 206  0000               f_EXTID_IRQHandler:
 210                     ; 114 }
 213  0000 80            	iret	
 236                     ; 121 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 236                     ; 122 {
 237                     .text:	section	.text,new
 238  0000               f_EXTI0_IRQHandler:
 240  0000 8a            	push	cc
 241  0001 84            	pop	a
 242  0002 a4bf          	and	a,#191
 243  0004 88            	push	a
 244  0005 86            	pop	cc
 245  0006 3b0002        	push	c_x+2
 246  0009 be00          	ldw	x,c_x
 247  000b 89            	pushw	x
 248  000c 3b0002        	push	c_y+2
 249  000f be00          	ldw	x,c_y
 250  0011 89            	pushw	x
 253                     ; 129 		EXTI_ClearITPendingBit(EXTI_IT_Pin0);
 255  0012 a601          	ld	a,#1
 256  0014 cd0000        	call	_EXTI_ClearITPendingBit
 258                     ; 130 }
 261  0017 85            	popw	x
 262  0018 bf00          	ldw	c_y,x
 263  001a 320002        	pop	c_y+2
 264  001d 85            	popw	x
 265  001e bf00          	ldw	c_x,x
 266  0020 320002        	pop	c_x+2
 267  0023 80            	iret	
 289                     ; 137 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 289                     ; 138 {
 290                     .text:	section	.text,new
 291  0000               f_EXTI1_IRQHandler:
 295                     ; 142 }
 298  0000 80            	iret	
 320                     ; 149 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 320                     ; 150 {
 321                     .text:	section	.text,new
 322  0000               f_EXTI2_IRQHandler:
 326                     ; 154 }
 329  0000 80            	iret	
 351                     ; 161 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 351                     ; 162 {
 352                     .text:	section	.text,new
 353  0000               f_EXTI3_IRQHandler:
 357                     ; 166 }
 360  0000 80            	iret	
 382                     ; 173 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 382                     ; 174 {
 383                     .text:	section	.text,new
 384  0000               f_EXTI4_IRQHandler:
 388                     ; 178 }
 391  0000 80            	iret	
 413                     ; 185 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 413                     ; 186 {
 414                     .text:	section	.text,new
 415  0000               f_EXTI5_IRQHandler:
 419                     ; 190 }
 422  0000 80            	iret	
 444                     ; 197 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 444                     ; 198 
 444                     ; 199 {
 445                     .text:	section	.text,new
 446  0000               f_EXTI6_IRQHandler:
 450                     ; 203 }
 453  0000 80            	iret	
 475                     ; 210 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 475                     ; 211 {
 476                     .text:	section	.text,new
 477  0000               f_EXTI7_IRQHandler:
 481                     ; 215 }
 484  0000 80            	iret	
 506                     ; 222 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 506                     ; 223 {
 507                     .text:	section	.text,new
 508  0000               f_COMP_IRQHandler:
 512                     ; 227 }
 515  0000 80            	iret	
 538                     ; 234 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 538                     ; 235 {
 539                     .text:	section	.text,new
 540  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 544                     ; 239 }
 547  0000 80            	iret	
 570                     ; 246 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 570                     ; 247 {
 571                     .text:	section	.text,new
 572  0000               f_TIM2_CAP_IRQHandler:
 576                     ; 251 }
 579  0000 80            	iret	
 602                     ; 259 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 602                     ; 260 {
 603                     .text:	section	.text,new
 604  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 608                     ; 264 }
 611  0000 80            	iret	
 634                     ; 270 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 634                     ; 271 {
 635                     .text:	section	.text,new
 636  0000               f_TIM3_CAP_IRQHandler:
 640                     ; 275 }
 643  0000 80            	iret	
 666                     ; 281 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 666                     ; 282 {
 667                     .text:	section	.text,new
 668  0000               f_TIM4_UPD_OVF_IRQHandler:
 672                     ; 286 }
 675  0000 80            	iret	
 697                     ; 293 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
 697                     ; 294 {
 698                     .text:	section	.text,new
 699  0000               f_SPI_IRQHandler:
 703                     ; 298 }
 706  0000 80            	iret	
 729                     ; 304 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
 729                     ; 305 {
 730                     .text:	section	.text,new
 731  0000               f_USART_TX_IRQHandler:
 735                     ; 309 }
 738  0000 80            	iret	
 761                     ; 316 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
 761                     ; 317 {
 762                     .text:	section	.text,new
 763  0000               f_USART_RX_IRQHandler:
 767                     ; 321 }
 770  0000 80            	iret	
 792                     ; 329 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
 792                     ; 330 {
 793                     .text:	section	.text,new
 794  0000               f_I2C_IRQHandler:
 798                     ; 334 }
 801  0000 80            	iret	
 813                     	xdef	f_I2C_IRQHandler
 814                     	xdef	f_USART_RX_IRQHandler
 815                     	xdef	f_USART_TX_IRQHandler
 816                     	xdef	f_SPI_IRQHandler
 817                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 818                     	xdef	f_TIM3_CAP_IRQHandler
 819                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 820                     	xdef	f_TIM2_CAP_IRQHandler
 821                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 822                     	xdef	f_COMP_IRQHandler
 823                     	xdef	f_EXTI7_IRQHandler
 824                     	xdef	f_EXTI6_IRQHandler
 825                     	xdef	f_EXTI5_IRQHandler
 826                     	xdef	f_EXTI4_IRQHandler
 827                     	xdef	f_EXTI3_IRQHandler
 828                     	xdef	f_EXTI2_IRQHandler
 829                     	xdef	f_EXTI1_IRQHandler
 830                     	xdef	f_EXTI0_IRQHandler
 831                     	xdef	f_EXTID_IRQHandler
 832                     	xdef	f_EXTIB_IRQHandler
 833                     	xdef	f_AWU_IRQHandler
 834                     	xdef	f_FLASH_IRQHandler
 835                     	xdef	f_TRAP_IRQHandler
 836                     	xdef	f_NonHandledInterrupt
 837                     	xref	_EXTI_ClearITPendingBit
 838                     	xref.b	c_x
 839                     	xref.b	c_y
 858                     	end
