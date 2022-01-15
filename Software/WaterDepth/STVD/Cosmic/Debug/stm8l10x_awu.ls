   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  20                     .const:	section	.text
  21  0000               _APR_Array:
  22  0000 00            	dc.b	0
  23  0001 08            	dc.b	8
  24  0002 10            	dc.b	16
  25  0003 20            	dc.b	32
  26  0004 3e            	dc.b	62
  27  0005 3e            	dc.b	62
  28  0006 3e            	dc.b	62
  29  0007 3e            	dc.b	62
  30  0008 3e            	dc.b	62
  31  0009 3e            	dc.b	62
  32  000a 3e            	dc.b	62
  33  000b 3e            	dc.b	62
  34  000c 3e            	dc.b	62
  35  000d 3d            	dc.b	61
  36  000e 3d            	dc.b	61
  37  000f 24            	dc.b	36
  38  0010 0e            	dc.b	14
  39  0011               _TBR_Array:
  40  0011 00            	dc.b	0
  41  0012 01            	dc.b	1
  42  0013 01            	dc.b	1
  43  0014 01            	dc.b	1
  44  0015 01            	dc.b	1
  45  0016 02            	dc.b	2
  46  0017 03            	dc.b	3
  47  0018 04            	dc.b	4
  48  0019 05            	dc.b	5
  49  001a 06            	dc.b	6
  50  001b 07            	dc.b	7
  51  001c 08            	dc.b	8
  52  001d 09            	dc.b	9
  53  001e 0a            	dc.b	10
  54  001f 0b            	dc.b	11
  55  0020 0e            	dc.b	14
  56  0021 0f            	dc.b	15
  85                     ; 73 void AWU_DeInit(void)
  85                     ; 74 {
  87                     .text:	section	.text,new
  88  0000               _AWU_DeInit:
  92                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  94  0000 725f50f0      	clr	20720
  95                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  97  0004 353f50f1      	mov	20721,#63
  98                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
 100  0008 725f50f2      	clr	20722
 101                     ; 78 }
 104  000c 81            	ret	
 266                     ; 86 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 266                     ; 87 {
 267                     .text:	section	.text,new
 268  0000               _AWU_Init:
 270  0000 88            	push	a
 271       00000000      OFST:	set	0
 274                     ; 89   assert_param(IS_AWU_TIMEBASE(AWU_TimeBase));
 276                     ; 92   AWU->CSR |= AWU_CSR_AWUEN;
 278  0001 721850f0      	bset	20720,#4
 279                     ; 95   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 281  0005 c650f2        	ld	a,20722
 282  0008 a4f0          	and	a,#240
 283  000a c750f2        	ld	20722,a
 284                     ; 96   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 286  000d 7b01          	ld	a,(OFST+1,sp)
 287  000f 5f            	clrw	x
 288  0010 97            	ld	xl,a
 289  0011 c650f2        	ld	a,20722
 290  0014 da0011        	or	a,(_TBR_Array,x)
 291  0017 c750f2        	ld	20722,a
 292                     ; 99   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 294  001a c650f1        	ld	a,20721
 295  001d a4c0          	and	a,#192
 296  001f c750f1        	ld	20721,a
 297                     ; 100   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 299  0022 7b01          	ld	a,(OFST+1,sp)
 300  0024 5f            	clrw	x
 301  0025 97            	ld	xl,a
 302  0026 c650f1        	ld	a,20721
 303  0029 da0000        	or	a,(_APR_Array,x)
 304  002c c750f1        	ld	20721,a
 305                     ; 102 }
 308  002f 84            	pop	a
 309  0030 81            	ret	
 364                     ; 110 void AWU_Cmd(FunctionalState NewState)
 364                     ; 111 {
 365                     .text:	section	.text,new
 366  0000               _AWU_Cmd:
 370                     ; 112   assert_param(IS_FUNCTIONAL_STATE(NewState));
 372                     ; 114   if (NewState != DISABLE)
 374  0000 4d            	tnz	a
 375  0001 2705          	jreq	L331
 376                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 378  0003 721850f0      	bset	20720,#4
 381  0007 81            	ret	
 382  0008               L331:
 383                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 385  0008 721950f0      	bres	20720,#4
 386                     ; 124 }
 389  000c 81            	ret	
 442                     	switch	.const
 443  0022               L41:
 444  0022 000003e8      	dc.l	1000
 445                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 445                     ; 140 {
 446                     .text:	section	.text,new
 447  0000               _AWU_LSICalibrationConfig:
 449  0000 5206          	subw	sp,#6
 450       00000006      OFST:	set	6
 453                     ; 142   uint16_t lsifreqkhz = 0x0;
 455                     ; 143   uint16_t A = 0x0;
 457                     ; 146   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 459                     ; 148   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 461  0002 96            	ldw	x,sp
 462  0003 1c0009        	addw	x,#OFST+3
 463  0006 cd0000        	call	c_ltor
 465  0009 ae0022        	ldw	x,#L41
 466  000c cd0000        	call	c_ludv
 468  000f be02          	ldw	x,c_lreg+2
 469  0011 1f03          	ldw	(OFST-3,sp),x
 471                     ; 152   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 473  0013 54            	srlw	x
 474  0014 54            	srlw	x
 475  0015 1f05          	ldw	(OFST-1,sp),x
 477                     ; 154   if ((4U * A) >= ((lsifreqkhz - (4U * A)) *(1U + (2U * A))))
 479  0017 58            	sllw	x
 480  0018 58            	sllw	x
 481  0019 1f01          	ldw	(OFST-5,sp),x
 483  001b 1e03          	ldw	x,(OFST-3,sp)
 484  001d 72f001        	subw	x,(OFST-5,sp)
 485  0020 1605          	ldw	y,(OFST-1,sp)
 486  0022 9058          	sllw	y
 487  0024 905c          	incw	y
 488  0026 cd0000        	call	c_imul
 490  0029 1605          	ldw	y,(OFST-1,sp)
 491  002b 9058          	sllw	y
 492  002d bf00          	ldw	c_x,x
 493  002f 9058          	sllw	y
 494  0031 90b300        	cpw	y,c_x
 495  0034 7b06          	ld	a,(OFST+0,sp)
 496  0036 2504          	jrult	L561
 497                     ; 156     AWU->APR = (uint8_t)(A - 2U);
 499  0038 a002          	sub	a,#2
 501  003a 2001          	jra	L761
 502  003c               L561:
 503                     ; 160     AWU->APR = (uint8_t)(A - 1U);
 505  003c 4a            	dec	a
 506  003d               L761:
 507  003d c750f1        	ld	20721,a
 508                     ; 163 }
 511  0040 5b06          	addw	sp,#6
 512  0042 81            	ret	
 535                     ; 170 void AWU_IdleModeEnable(void)
 535                     ; 171 {
 536                     .text:	section	.text,new
 537  0000               _AWU_IdleModeEnable:
 541                     ; 174   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 543  0000 721950f0      	bres	20720,#4
 544                     ; 177   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 546  0004 35f050f2      	mov	20722,#240
 547                     ; 179 }
 550  0008 81            	ret	
 594                     ; 186 FlagStatus AWU_GetFlagStatus(void)
 594                     ; 187 {
 595                     .text:	section	.text,new
 596  0000               _AWU_GetFlagStatus:
 600                     ; 188   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 602  0000 720a50f002    	btjt	20720,#5,L22
 603  0005 4f            	clr	a
 605  0006 81            	ret	
 606  0007               L22:
 607  0007 a601          	ld	a,#1
 610  0009 81            	ret	
 645                     	xdef	_TBR_Array
 646                     	xdef	_APR_Array
 647                     	xdef	_AWU_GetFlagStatus
 648                     	xdef	_AWU_IdleModeEnable
 649                     	xdef	_AWU_LSICalibrationConfig
 650                     	xdef	_AWU_Cmd
 651                     	xdef	_AWU_Init
 652                     	xdef	_AWU_DeInit
 653                     	xref.b	c_lreg
 654                     	xref.b	c_x
 673                     	xref	c_imul
 674                     	xref	c_ludv
 675                     	xref	c_ltor
 676                     	end
