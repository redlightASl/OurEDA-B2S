   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
 115                     ; 64 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 115                     ; 65 {
 117                     .text:	section	.text,new
 118  0000               _RST_GetFlagStatus:
 122                     ; 67   assert_param(IS_RST_FLAG(RST_Flag));
 124                     ; 71   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 126  0000 c450b1        	and	a,20657
 127  0003 2702          	jreq	L01
 128  0005 a601          	ld	a,#1
 129  0007               L01:
 132  0007 81            	ret	
 167                     ; 85 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 167                     ; 86 {
 168                     .text:	section	.text,new
 169  0000               _RST_ClearFlag:
 173                     ; 88   assert_param(IS_RST_FLAG(RST_Flag));
 175                     ; 90   RST->SR = (uint8_t)RST_Flag;
 177  0000 c750b1        	ld	20657,a
 178                     ; 91 }
 181  0003 81            	ret	
 204                     ; 98 void RST_GPOutputEnable(void)
 204                     ; 99 {
 205                     .text:	section	.text,new
 206  0000               _RST_GPOutputEnable:
 210                     ; 101   RST->CR = RST_CR_MASK;
 212  0000 35d050b0      	mov	20656,#208
 213                     ; 102 }
 216  0004 81            	ret	
 229                     	xdef	_RST_GPOutputEnable
 230                     	xdef	_RST_ClearFlag
 231                     	xdef	_RST_GetFlagStatus
 250                     	end
