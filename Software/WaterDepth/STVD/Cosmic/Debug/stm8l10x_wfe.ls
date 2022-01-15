   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 55 void WFE_DeInit(void)
  48                     ; 56 {
  50                     .text:	section	.text,new
  51  0000               _WFE_DeInit:
  55                     ; 57   WFE->CR1 = WFE_CR1_RESET_VALUE;
  57  0000 725f50a6      	clr	20646
  58                     ; 58   WFE->CR2 = WFE_CR2_RESET_VALUE;
  60  0004 725f50a7      	clr	20647
  61                     ; 59 }
  64  0008 81            	ret	
 241                     ; 80 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 241                     ; 81 {
 242                     .text:	section	.text,new
 243  0000               _WFE_WakeUpSourceEventCmd:
 245  0000 89            	pushw	x
 246  0001 88            	push	a
 247       00000001      OFST:	set	1
 250                     ; 82   uint8_t register_index = 0;
 252                     ; 84   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 254                     ; 85   assert_param(IS_FUNCTIONAL_STATE(NewState));
 256                     ; 88   register_index = (uint8_t)((uint16_t)WFE_Source >> (uint8_t)0x08);
 258  0002 9e            	ld	a,xh
 259  0003 6b01          	ld	(OFST+0,sp),a
 261                     ; 90   if (NewState != DISABLE)
 263  0005 0d06          	tnz	(OFST+5,sp)
 264  0007 2719          	jreq	L721
 265                     ; 92     switch (register_index)
 268                     ; 102       default:
 268                     ; 103         break;
 269  0009 4a            	dec	a
 270  000a 2705          	jreq	L12
 271  000c 4a            	dec	a
 272  000d 2709          	jreq	L32
 273  000f 2022          	jra	L531
 274  0011               L12:
 275                     ; 94       case 1:
 275                     ; 95         WFE->CR1 |= (uint8_t)WFE_Source;
 277  0011 c650a6        	ld	a,20646
 278  0014 1a03          	or	a,(OFST+2,sp)
 279                     ; 96         break;
 281  0016 2018          	jp	LC001
 282  0018               L32:
 283                     ; 98       case 2:
 283                     ; 99         WFE->CR2 |= (uint8_t)WFE_Source;
 285  0018 c650a7        	ld	a,20647
 286  001b 1a03          	or	a,(OFST+2,sp)
 287  001d               LC002:
 288  001d c750a7        	ld	20647,a
 289                     ; 100         break;
 291  0020 2011          	jra	L531
 292                     ; 102       default:
 292                     ; 103         break;
 295  0022               L721:
 296                     ; 108     switch (register_index)
 299                     ; 118       default:
 299                     ; 119         break;
 300  0022 4a            	dec	a
 301  0023 2705          	jreq	L72
 302  0025 4a            	dec	a
 303  0026 270e          	jreq	L13
 304  0028 2009          	jra	L531
 305  002a               L72:
 306                     ; 110       case 1:
 306                     ; 111         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 308  002a 7b03          	ld	a,(OFST+2,sp)
 309  002c 43            	cpl	a
 310  002d c450a6        	and	a,20646
 311  0030               LC001:
 312  0030 c750a6        	ld	20646,a
 313                     ; 112         break;
 314  0033               L531:
 315                     ; 122 }
 318  0033 5b03          	addw	sp,#3
 319  0035 81            	ret	
 320  0036               L13:
 321                     ; 114       case 2:
 321                     ; 115         WFE->CR2 &= (uint8_t)(~(uint8_t)WFE_Source);
 323  0036 7b03          	ld	a,(OFST+2,sp)
 324  0038 43            	cpl	a
 325  0039 c450a7        	and	a,20647
 326                     ; 116         break;
 328  003c 20df          	jp	LC002
 329                     ; 118       default:
 329                     ; 119         break;
 377                     ; 142 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 377                     ; 143 {
 378                     .text:	section	.text,new
 379  0000               _WFE_GetWakeUpSourceEventStatus:
 381  0000 89            	pushw	x
 382  0001 88            	push	a
 383       00000001      OFST:	set	1
 386                     ; 144   FunctionalState status = DISABLE;
 388  0002 0f01          	clr	(OFST+0,sp)
 390                     ; 146   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 392                     ; 148   switch (WFE_Source)
 395                     ; 187     default:
 395                     ; 188       break;
 396  0004 1d0101        	subw	x,#257
 397  0007 2735          	jreq	L341
 398  0009 5a            	decw	x
 399  000a 2732          	jreq	L341
 400  000c 1d000e        	subw	x,#14
 401  000f 272d          	jreq	L341
 402  0011 1d0010        	subw	x,#16
 403  0014 2728          	jreq	L341
 404  0016 1d0020        	subw	x,#32
 405  0019 2723          	jreq	L341
 406  001b 1d0040        	subw	x,#64
 407  001e 271e          	jreq	L341
 408  0020 1d0081        	subw	x,#129
 409  0023 2722          	jreq	L541
 410  0025 5a            	decw	x
 411  0026 271f          	jreq	L541
 412  0028 1d0002        	subw	x,#2
 413  002b 271a          	jreq	L541
 414  002d 1d0004        	subw	x,#4
 415  0030 2715          	jreq	L541
 416  0032 1d0008        	subw	x,#8
 417  0035 2710          	jreq	L541
 418  0037 1d0010        	subw	x,#16
 419  003a 270b          	jreq	L541
 420  003c 2018          	jra	L571
 421  003e               L341:
 422                     ; 150     case WFE_Source_TIM2_EV0:
 422                     ; 151     case WFE_Source_TIM2_EV1:
 422                     ; 152     case WFE_Source_EXTI_EV0:
 422                     ; 153     case WFE_Source_EXTI_EV1:
 422                     ; 154     case WFE_Source_EXTI_EV2:
 422                     ; 155     case WFE_Source_EXTI_EV3:
 422                     ; 156 
 422                     ; 157       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 424  003e c650a6        	ld	a,20646
 425  0041 1503          	bcp	a,(OFST+2,sp)
 426  0043 270f          	jreq	L302
 427                     ; 160         status = ENABLE;
 429  0045 2007          	jp	LC004
 430                     ; 165         status = DISABLE;
 431  0047               L541:
 432                     ; 169     case WFE_Source_EXTI_EV4:
 432                     ; 170     case WFE_Source_EXTI_EV5:
 432                     ; 171     case WFE_Source_EXTI_EV6:
 432                     ; 172     case WFE_Source_EXTI_EV7:
 432                     ; 173     case WFE_Source_EXTI_EVB:
 432                     ; 174     case WFE_Source_EXTI_EVD:
 432                     ; 175 
 432                     ; 176       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 434  0047 c650a7        	ld	a,20647
 435  004a 1503          	bcp	a,(OFST+2,sp)
 436  004c 2706          	jreq	L302
 437                     ; 179         status = ENABLE;
 439  004e               LC004:
 441  004e a601          	ld	a,#1
 442  0050 6b01          	ld	(OFST+0,sp),a
 445  0052 2002          	jra	L571
 446  0054               L302:
 447                     ; 184         status = DISABLE;
 450  0054 0f01          	clr	(OFST+0,sp)
 452                     ; 187     default:
 452                     ; 188       break;
 454  0056               L571:
 455                     ; 190   return status;
 457  0056 7b01          	ld	a,(OFST+0,sp)
 460  0058 5b03          	addw	sp,#3
 461  005a 81            	ret	
 474                     	xdef	_WFE_GetWakeUpSourceEventStatus
 475                     	xdef	_WFE_WakeUpSourceEventCmd
 476                     	xdef	_WFE_DeInit
 495                     	end
