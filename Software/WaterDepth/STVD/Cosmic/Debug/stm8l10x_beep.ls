   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 92 void BEEP_DeInit(void)
  48                     ; 93 {
  50                     .text:	section	.text,new
  51  0000               _BEEP_DeInit:
  55                     ; 94   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  57  0000 351f50f3      	mov	20723,#31
  58                     ; 95 }
  61  0004 81            	ret	
 126                     ; 104 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 126                     ; 105 {
 127                     .text:	section	.text,new
 128  0000               _BEEP_Init:
 130  0000 88            	push	a
 131       00000000      OFST:	set	0
 134                     ; 108   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 136                     ; 111   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 138  0001 c650f3        	ld	a,20723
 139  0004 a41f          	and	a,#31
 140  0006 a11f          	cp	a,#31
 141  0008 260c          	jrne	L15
 142                     ; 113     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 144  000a c650f3        	ld	a,20723
 145  000d a4e0          	and	a,#224
 146  000f c750f3        	ld	20723,a
 147                     ; 114     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 149  0012 721050f3      	bset	20723,#0
 150  0016               L15:
 151                     ; 118   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 153  0016 c650f3        	ld	a,20723
 154  0019 a43f          	and	a,#63
 155  001b c750f3        	ld	20723,a
 156                     ; 119   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 158  001e c650f3        	ld	a,20723
 159  0021 1a01          	or	a,(OFST+1,sp)
 160  0023 c750f3        	ld	20723,a
 161                     ; 121 }
 164  0026 84            	pop	a
 165  0027 81            	ret	
 220                     ; 129 void BEEP_Cmd(FunctionalState NewState)
 220                     ; 130 {
 221                     .text:	section	.text,new
 222  0000               _BEEP_Cmd:
 226                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 228                     ; 134   if (NewState != DISABLE)
 230  0000 4d            	tnz	a
 231  0001 2705          	jreq	L101
 232                     ; 137     BEEP->CSR |= BEEP_CSR_BEEPEN;
 234  0003 721a50f3      	bset	20723,#5
 237  0007 81            	ret	
 238  0008               L101:
 239                     ; 142     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 241  0008 721b50f3      	bres	20723,#5
 242                     ; 144 }
 245  000c 81            	ret	
 298                     .const:	section	.text
 299  0000               L41:
 300  0000 000003e8      	dc.l	1000
 301                     ; 185 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 301                     ; 186 {
 302                     .text:	section	.text,new
 303  0000               _BEEP_LSICalibrationConfig:
 305  0000 5206          	subw	sp,#6
 306       00000006      OFST:	set	6
 309                     ; 192   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 311                     ; 194   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 313  0002 96            	ldw	x,sp
 314  0003 1c0009        	addw	x,#OFST+3
 315  0006 cd0000        	call	c_ltor
 317  0009 ae0000        	ldw	x,#L41
 318  000c cd0000        	call	c_ludv
 320  000f be02          	ldw	x,c_lreg+2
 321  0011 1f03          	ldw	(OFST-3,sp),x
 323                     ; 198   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 325  0013 c650f3        	ld	a,20723
 326  0016 a4e0          	and	a,#224
 327  0018 c750f3        	ld	20723,a
 328                     ; 200   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 330  001b 54            	srlw	x
 331  001c 54            	srlw	x
 332  001d 54            	srlw	x
 333  001e 1f05          	ldw	(OFST-1,sp),x
 335                     ; 202   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 337  0020 58            	sllw	x
 338  0021 58            	sllw	x
 339  0022 58            	sllw	x
 340  0023 1f01          	ldw	(OFST-5,sp),x
 342  0025 1e03          	ldw	x,(OFST-3,sp)
 343  0027 72f001        	subw	x,(OFST-5,sp)
 344  002a 1605          	ldw	y,(OFST-1,sp)
 345  002c 9058          	sllw	y
 346  002e 905c          	incw	y
 347  0030 cd0000        	call	c_imul
 349  0033 1605          	ldw	y,(OFST-1,sp)
 350  0035 9058          	sllw	y
 351  0037 9058          	sllw	y
 352  0039 bf00          	ldw	c_x,x
 353  003b 9058          	sllw	y
 354  003d 90b300        	cpw	y,c_x
 355  0040 7b06          	ld	a,(OFST+0,sp)
 356  0042 2504          	jrult	L331
 357                     ; 204     BEEP->CSR |= (uint8_t)(A - 2U);
 359  0044 a002          	sub	a,#2
 361  0046 2001          	jra	L531
 362  0048               L331:
 363                     ; 208     BEEP->CSR |= (uint8_t)(A - 1U);
 365  0048 4a            	dec	a
 366  0049               L531:
 367  0049 ca50f3        	or	a,20723
 368  004c c750f3        	ld	20723,a
 369                     ; 211 }
 372  004f 5b06          	addw	sp,#6
 373  0051 81            	ret	
 386                     	xdef	_BEEP_LSICalibrationConfig
 387                     	xdef	_BEEP_Cmd
 388                     	xdef	_BEEP_Init
 389                     	xdef	_BEEP_DeInit
 390                     	xref.b	c_lreg
 391                     	xref.b	c_x
 410                     	xref	c_imul
 411                     	xref	c_ludv
 412                     	xref	c_ltor
 413                     	end
