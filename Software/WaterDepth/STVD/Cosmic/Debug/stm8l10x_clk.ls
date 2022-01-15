   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  54                     ; 68 void CLK_DeInit(void)
  54                     ; 69 {
  56                     .text:	section	.text,new
  57  0000               _CLK_DeInit:
  61                     ; 70   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  63  0000 350350c0      	mov	20672,#3
  64                     ; 71   CLK->PCKENR = CLK_PCKENR_RESET_VALUE;
  66  0004 725f50c3      	clr	20675
  67                     ; 72   CLK->CCOR  = CLK_CCOR_RESET_VALUE;
  69  0008 725f50c5      	clr	20677
  70                     ; 73 }
  73  000c 81            	ret	
 128                     ; 80 void CLK_CCOCmd(FunctionalState NewState)
 128                     ; 81 {
 129                     .text:	section	.text,new
 130  0000               _CLK_CCOCmd:
 134                     ; 83   assert_param(IS_FUNCTIONAL_STATE(NewState));
 136                     ; 85   if (NewState != DISABLE)
 138  0000 4d            	tnz	a
 139  0001 2705          	jreq	L74
 140                     ; 88     CLK->CCOR |= CLK_CCOR_CCOEN;
 142  0003 721050c5      	bset	20677,#0
 145  0007 81            	ret	
 146  0008               L74:
 147                     ; 93     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 149  0008 721150c5      	bres	20677,#0
 150                     ; 96 }
 153  000c 81            	ret	
 258                     ; 113 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 258                     ; 114 {
 259                     .text:	section	.text,new
 260  0000               _CLK_PeripheralClockConfig:
 262  0000 89            	pushw	x
 263       00000000      OFST:	set	0
 266                     ; 116     assert_param(IS_FUNCTIONAL_STATE(NewState));
 268                     ; 117     assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 270                     ; 119     if (NewState != DISABLE)
 272  0001 9f            	ld	a,xl
 273  0002 4d            	tnz	a
 274  0003 2706          	jreq	L711
 275                     ; 122       CLK->PCKENR |= ((uint8_t)CLK_Peripheral);
 277  0005 9e            	ld	a,xh
 278  0006 ca50c3        	or	a,20675
 280  0009 2006          	jra	L121
 281  000b               L711:
 282                     ; 127       CLK->PCKENR &= (uint8_t)(~(uint8_t)CLK_Peripheral);
 284  000b 7b01          	ld	a,(OFST+1,sp)
 285  000d 43            	cpl	a
 286  000e c450c3        	and	a,20675
 287  0011               L121:
 288  0011 c750c3        	ld	20675,a
 289                     ; 129 }
 292  0014 85            	popw	x
 293  0015 81            	ret	
 368                     ; 141 void CLK_MasterPrescalerConfig(CLK_MasterPrescaler_TypeDef CLK_MasterPrescaler)
 368                     ; 142 {
 369                     .text:	section	.text,new
 370  0000               _CLK_MasterPrescalerConfig:
 372  0000 88            	push	a
 373       00000000      OFST:	set	0
 376                     ; 144   assert_param(IS_CLK_MASTER_PRESCALER(CLK_MasterPrescaler));
 378                     ; 146   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 380  0001 c650c0        	ld	a,20672
 381  0004 a4fc          	and	a,#252
 382  0006 c750c0        	ld	20672,a
 383                     ; 147   CLK->CKDIVR = (uint8_t)CLK_MasterPrescaler;
 385  0009 7b01          	ld	a,(OFST+1,sp)
 386  000b c750c0        	ld	20672,a
 387                     ; 148 }
 390  000e 84            	pop	a
 391  000f 81            	ret	
 464                     ; 161 void CLK_CCOConfig(CLK_Output_TypeDef CLK_Output)
 464                     ; 162 {
 465                     .text:	section	.text,new
 466  0000               _CLK_CCOConfig:
 468  0000 88            	push	a
 469       00000000      OFST:	set	0
 472                     ; 164   assert_param(IS_CLK_OUTPUT(CLK_Output));
 474                     ; 167   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 476  0001 c650c5        	ld	a,20677
 477  0004 a4f9          	and	a,#249
 478  0006 c750c5        	ld	20677,a
 479                     ; 170   CLK->CCOR |= ((uint8_t)CLK_Output);
 481  0009 c650c5        	ld	a,20677
 482  000c 1a01          	or	a,(OFST+1,sp)
 483  000e c750c5        	ld	20677,a
 484                     ; 173   CLK->CCOR |= CLK_CCOR_CCOEN;
 486  0011 721050c5      	bset	20677,#0
 487                     ; 174 }
 490  0015 84            	pop	a
 491  0016 81            	ret	
 544                     ; 181 uint32_t CLK_GetClockFreq(void)
 544                     ; 182 {
 545                     .text:	section	.text,new
 546  0000               _CLK_GetClockFreq:
 548  0000 5209          	subw	sp,#9
 549       00000009      OFST:	set	9
 552                     ; 183   uint32_t clockfrequency = 0;
 554                     ; 184   uint8_t tmp = 0, presc = 0;
 558                     ; 186   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 560  0002 c650c0        	ld	a,20672
 561  0005 a403          	and	a,#3
 563                     ; 187   presc = HSIDivFactor[tmp];
 565  0007 5f            	clrw	x
 566  0008 97            	ld	xl,a
 567  0009 d60000        	ld	a,(_HSIDivFactor,x)
 568  000c 6b09          	ld	(OFST+0,sp),a
 570                     ; 188   clockfrequency = HSI_VALUE / presc;
 572  000e b703          	ld	c_lreg+3,a
 573  0010 3f02          	clr	c_lreg+2
 574  0012 3f01          	clr	c_lreg+1
 575  0014 3f00          	clr	c_lreg
 576  0016 96            	ldw	x,sp
 577  0017 5c            	incw	x
 578  0018 cd0000        	call	c_rtol
 581  001b ae2400        	ldw	x,#9216
 582  001e bf02          	ldw	c_lreg+2,x
 583  0020 ae00f4        	ldw	x,#244
 584  0023 bf00          	ldw	c_lreg,x
 585  0025 96            	ldw	x,sp
 586  0026 5c            	incw	x
 587  0027 cd0000        	call	c_ludv
 589  002a 96            	ldw	x,sp
 590  002b 1c0005        	addw	x,#OFST-4
 591  002e cd0000        	call	c_rtol
 594                     ; 190   return((uint32_t)clockfrequency);
 596  0031 96            	ldw	x,sp
 597  0032 1c0005        	addw	x,#OFST-4
 598  0035 cd0000        	call	c_ltor
 602  0038 5b09          	addw	sp,#9
 603  003a 81            	ret	
 628                     	xdef	_HSIDivFactor
 629                     	xdef	_CLK_GetClockFreq
 630                     	xdef	_CLK_CCOConfig
 631                     	xdef	_CLK_MasterPrescalerConfig
 632                     	xdef	_CLK_PeripheralClockConfig
 633                     	xdef	_CLK_CCOCmd
 634                     	xdef	_CLK_DeInit
 635                     	xref.b	c_lreg
 636                     	xref.b	c_x
 655                     	xref	c_ltor
 656                     	xref	c_ludv
 657                     	xref	c_rtol
 658                     	end
