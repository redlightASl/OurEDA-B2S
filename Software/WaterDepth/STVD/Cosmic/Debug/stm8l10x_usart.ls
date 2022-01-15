   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 59 void USART_DeInit(void)
  48                     ; 60 {
  50                     .text:	section	.text,new
  51  0000               _USART_DeInit:
  55                     ; 63   (void)USART->SR;
  57  0000 c65230        	ld	a,21040
  58                     ; 64   (void)USART->DR;
  60  0003 c65231        	ld	a,21041
  61                     ; 66   USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  63  0006 725f5233      	clr	21043
  64                     ; 67   USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  66  000a 725f5232      	clr	21042
  67                     ; 69   USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  69  000e 725f5234      	clr	21044
  70                     ; 70   USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  72  0012 725f5235      	clr	21045
  73                     ; 71   USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  75  0016 725f5236      	clr	21046
  76                     ; 72   USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  78  001a 725f5237      	clr	21047
  79                     ; 73 }
  82  001e 81            	ret	
 255                     ; 100 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 255                     ; 101                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 255                     ; 102                 USART_Parity, USART_Mode_TypeDef USART_Mode)
 255                     ; 103 {
 256                     .text:	section	.text,new
 257  0000               _USART_Init:
 259  0000 5204          	subw	sp,#4
 260       00000004      OFST:	set	4
 263                     ; 104   uint32_t BaudRate_Mantissa = 0;
 265                     ; 107   assert_param(IS_USART_BAUDRATE(BaudRate));
 267                     ; 109   assert_param(IS_USART_WordLength(USART_WordLength));
 269                     ; 111   assert_param(IS_USART_STOPBITS(USART_StopBits));
 271                     ; 113   assert_param(IS_USART_PARITY(USART_Parity));
 273                     ; 115   assert_param(IS_USART_MODE(USART_Mode));
 275                     ; 118   USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 277  0002 c65234        	ld	a,21044
 278  0005 a4e9          	and	a,#233
 279  0007 c75234        	ld	21044,a
 280                     ; 121   USART->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 282  000a 7b0b          	ld	a,(OFST+7,sp)
 283  000c 1a0d          	or	a,(OFST+9,sp)
 284  000e ca5234        	or	a,21044
 285  0011 c75234        	ld	21044,a
 286                     ; 124   USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 288  0014 c65236        	ld	a,21046
 289  0017 a4cf          	and	a,#207
 290  0019 c75236        	ld	21046,a
 291                     ; 126   USART->CR3 |= (uint8_t)USART_StopBits;
 293  001c c65236        	ld	a,21046
 294  001f 1a0c          	or	a,(OFST+8,sp)
 295  0021 c75236        	ld	21046,a
 296                     ; 129   USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 298  0024 725f5232      	clr	21042
 299                     ; 131   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 301  0028 c65233        	ld	a,21043
 302  002b a40f          	and	a,#15
 303  002d c75233        	ld	21043,a
 304                     ; 133   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 306  0030 c65233        	ld	a,21043
 307  0033 a4f0          	and	a,#240
 308  0035 c75233        	ld	21043,a
 309                     ; 135   BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq() / BaudRate);
 311  0038 cd0000        	call	_CLK_GetClockFreq
 313  003b 96            	ldw	x,sp
 314  003c 1c0007        	addw	x,#OFST+3
 315  003f cd0000        	call	c_ludv
 317  0042 96            	ldw	x,sp
 318  0043 5c            	incw	x
 319  0044 cd0000        	call	c_rtol
 322                     ; 137   USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 324  0047 7b03          	ld	a,(OFST-1,sp)
 325  0049 a4f0          	and	a,#240
 326  004b c75233        	ld	21043,a
 327                     ; 139   USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 329  004e 7b04          	ld	a,(OFST+0,sp)
 330  0050 a40f          	and	a,#15
 331  0052 ca5233        	or	a,21043
 332  0055 c75233        	ld	21043,a
 333                     ; 141   USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 335  0058 96            	ldw	x,sp
 336  0059 5c            	incw	x
 337  005a cd0000        	call	c_ltor
 339  005d a604          	ld	a,#4
 340  005f cd0000        	call	c_lursh
 342  0062 5500035232    	mov	21042,c_lreg+3
 343                     ; 144   USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 345  0067 c65235        	ld	a,21045
 346  006a a4f3          	and	a,#243
 347  006c c75235        	ld	21045,a
 348                     ; 146   USART->CR2 |= (uint8_t)USART_Mode;
 350  006f c65235        	ld	a,21045
 351  0072 1a0e          	or	a,(OFST+10,sp)
 352  0074 c75235        	ld	21045,a
 353                     ; 147 }
 356  0077 5b04          	addw	sp,#4
 357  0079 81            	ret	
 505                     ; 171 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 505                     ; 172                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 505                     ; 173 {
 506                     .text:	section	.text,new
 507  0000               _USART_ClockInit:
 509  0000 89            	pushw	x
 510       00000000      OFST:	set	0
 513                     ; 175   assert_param(IS_USART_CLOCK(USART_Clock));
 515                     ; 176   assert_param(IS_USART_CPOL(USART_CPOL));
 517                     ; 177   assert_param(IS_USART_CPHA(USART_CPHA));
 519                     ; 178   assert_param(IS_USART_LASTBIT(USART_LastBit));
 521                     ; 181   USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 523  0001 c65236        	ld	a,21046
 524  0004 a4f8          	and	a,#248
 525  0006 c75236        	ld	21046,a
 526                     ; 183   USART->CR3 |= (uint8_t)((uint8_t)USART_CPOL | (uint8_t)USART_CPHA | (uint8_t)USART_LastBit);
 528  0009 9f            	ld	a,xl
 529  000a 1a05          	or	a,(OFST+5,sp)
 530  000c 1a06          	or	a,(OFST+6,sp)
 531  000e ca5236        	or	a,21046
 532  0011 c75236        	ld	21046,a
 533                     ; 185   if (USART_Clock != USART_Clock_Disable)
 535  0014 7b01          	ld	a,(OFST+1,sp)
 536  0016 2706          	jreq	L712
 537                     ; 187     USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 539  0018 72165236      	bset	21046,#3
 541  001c 2004          	jra	L122
 542  001e               L712:
 543                     ; 191     USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 545  001e 72175236      	bres	21046,#3
 546  0022               L122:
 547                     ; 193 }
 550  0022 85            	popw	x
 551  0023 81            	ret	
 606                     ; 201 void USART_Cmd(FunctionalState NewState)
 606                     ; 202 {
 607                     .text:	section	.text,new
 608  0000               _USART_Cmd:
 612                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 614                     ; 205   if (NewState != DISABLE)
 616  0000 4d            	tnz	a
 617  0001 2705          	jreq	L152
 618                     ; 207     USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 620  0003 721b5234      	bres	21044,#5
 623  0007 81            	ret	
 624  0008               L152:
 625                     ; 211     USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 627  0008 721a5234      	bset	21044,#5
 628                     ; 213 }
 631  000c 81            	ret	
 742                     ; 229 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 742                     ; 230 {
 743                     .text:	section	.text,new
 744  0000               _USART_ITConfig:
 746  0000 89            	pushw	x
 747  0001 89            	pushw	x
 748       00000002      OFST:	set	2
 751                     ; 231   uint8_t uartreg, itpos = 0x00;
 753                     ; 232   assert_param(IS_USART_CONFIG_IT(USART_IT));
 755                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 757                     ; 236   uartreg = (uint8_t)((uint16_t)USART_IT >> (uint8_t)0x08);
 759  0002 9e            	ld	a,xh
 760  0003 6b01          	ld	(OFST-1,sp),a
 762                     ; 238   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 764  0005 9f            	ld	a,xl
 765  0006 a40f          	and	a,#15
 766  0008 5f            	clrw	x
 767  0009 97            	ld	xl,a
 768  000a a601          	ld	a,#1
 769  000c 5d            	tnzw	x
 770  000d 2704          	jreq	L02
 771  000f               L22:
 772  000f 48            	sll	a
 773  0010 5a            	decw	x
 774  0011 26fc          	jrne	L22
 775  0013               L02:
 776  0013 6b02          	ld	(OFST+0,sp),a
 778                     ; 240   if (NewState != DISABLE)
 780  0015 7b07          	ld	a,(OFST+5,sp)
 781  0017 2713          	jreq	L723
 782                     ; 243     if (uartreg == 0x01)
 784  0019 7b01          	ld	a,(OFST-1,sp)
 785  001b 4a            	dec	a
 786  001c 2607          	jrne	L133
 787                     ; 245       USART->CR1 |= itpos;
 789  001e c65234        	ld	a,21044
 790  0021 1a02          	or	a,(OFST+0,sp)
 792  0023 2012          	jp	LC002
 793  0025               L133:
 794                     ; 250       USART->CR2 |= itpos;
 796  0025 c65235        	ld	a,21045
 797  0028 1a02          	or	a,(OFST+0,sp)
 798  002a 2016          	jp	LC001
 799  002c               L723:
 800                     ; 256     if (uartreg == 0x01)
 802  002c 7b01          	ld	a,(OFST-1,sp)
 803  002e 4a            	dec	a
 804  002f 260b          	jrne	L733
 805                     ; 258       USART->CR1 &= (uint8_t)(~itpos);
 807  0031 7b02          	ld	a,(OFST+0,sp)
 808  0033 43            	cpl	a
 809  0034 c45234        	and	a,21044
 810  0037               LC002:
 811  0037 c75234        	ld	21044,a
 813  003a 2009          	jra	L533
 814  003c               L733:
 815                     ; 263       USART->CR2 &= (uint8_t)(~itpos);
 817  003c 7b02          	ld	a,(OFST+0,sp)
 818  003e 43            	cpl	a
 819  003f c45235        	and	a,21045
 820  0042               LC001:
 821  0042 c75235        	ld	21045,a
 822  0045               L533:
 823                     ; 267 }
 826  0045 5b04          	addw	sp,#4
 827  0047 81            	ret	
 850                     ; 275 uint8_t USART_ReceiveData8(void)
 850                     ; 276 {
 851                     .text:	section	.text,new
 852  0000               _USART_ReceiveData8:
 856                     ; 277   return USART->DR;
 858  0000 c65231        	ld	a,21041
 861  0003 81            	ret	
 895                     ; 287 uint16_t USART_ReceiveData9(void)
 895                     ; 288 {
 896                     .text:	section	.text,new
 897  0000               _USART_ReceiveData9:
 899  0000 89            	pushw	x
 900       00000002      OFST:	set	2
 903                     ; 289   uint16_t temp = 0;
 905                     ; 291   temp = ((uint16_t)(((uint16_t)((uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 907  0001 c65234        	ld	a,21044
 908  0004 a480          	and	a,#128
 909  0006 5f            	clrw	x
 910  0007 02            	rlwa	x,a
 911  0008 58            	sllw	x
 912  0009 1f01          	ldw	(OFST-1,sp),x
 914                     ; 292   return (uint16_t)( ((uint16_t)((uint16_t)USART->DR) | temp) & ((uint16_t)0x01FF));
 916  000b c65231        	ld	a,21041
 917  000e 5f            	clrw	x
 918  000f 97            	ld	xl,a
 919  0010 01            	rrwa	x,a
 920  0011 1a02          	or	a,(OFST+0,sp)
 921  0013 01            	rrwa	x,a
 922  0014 1a01          	or	a,(OFST-1,sp)
 923  0016 a401          	and	a,#1
 924  0018 01            	rrwa	x,a
 927  0019 5b02          	addw	sp,#2
 928  001b 81            	ret	
 964                     ; 301 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 964                     ; 302 {
 965                     .text:	section	.text,new
 966  0000               _USART_ReceiverWakeUpCmd:
 970                     ; 303   assert_param(IS_FUNCTIONAL_STATE(NewState));
 972                     ; 305   if (NewState != DISABLE)
 974  0000 4d            	tnz	a
 975  0001 2705          	jreq	L704
 976                     ; 308     USART->CR2 |= USART_CR2_RWU;
 978  0003 72125235      	bset	21045,#1
 981  0007 81            	ret	
 982  0008               L704:
 983                     ; 313     USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 985  0008 72135235      	bres	21045,#1
 986                     ; 315 }
 989  000c 81            	ret	
1012                     ; 322 void USART_SendBreak(void)
1012                     ; 323 {
1013                     .text:	section	.text,new
1014  0000               _USART_SendBreak:
1018                     ; 324   USART->CR2 |= USART_CR2_SBK;
1020  0000 72105235      	bset	21045,#0
1021                     ; 325 }
1024  0004 81            	ret	
1058                     ; 332 void USART_SendData8(uint8_t Data)
1058                     ; 333 {
1059                     .text:	section	.text,new
1060  0000               _USART_SendData8:
1064                     ; 335   USART->DR = Data;
1066  0000 c75231        	ld	21041,a
1067                     ; 336 }
1070  0003 81            	ret	
1104                     ; 344 void USART_SendData9(uint16_t Data)
1104                     ; 345 {
1105                     .text:	section	.text,new
1106  0000               _USART_SendData9:
1108  0000 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 346   assert_param(IS_USART_DATA_9BITS(Data));
1114                     ; 348   USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1116  0001 721d5234      	bres	21044,#6
1117                     ; 349   USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1119  0005 54            	srlw	x
1120  0006 54            	srlw	x
1121  0007 9f            	ld	a,xl
1122  0008 a440          	and	a,#64
1123  000a ca5234        	or	a,21044
1124  000d c75234        	ld	21044,a
1125                     ; 350   USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1127  0010 7b02          	ld	a,(OFST+2,sp)
1128  0012 c75231        	ld	21041,a
1129                     ; 352 }
1132  0015 85            	popw	x
1133  0016 81            	ret	
1167                     ; 360 void USART_SetAddress(uint8_t Address)
1167                     ; 361 {
1168                     .text:	section	.text,new
1169  0000               _USART_SetAddress:
1171  0000 88            	push	a
1172       00000000      OFST:	set	0
1175                     ; 363   assert_param(IS_USART_ADDRESS(Address));
1177                     ; 366   USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1179  0001 c65237        	ld	a,21047
1180  0004 a4f0          	and	a,#240
1181  0006 c75237        	ld	21047,a
1182                     ; 368   USART->CR4 |= Address;
1184  0009 c65237        	ld	a,21047
1185  000c 1a01          	or	a,(OFST+1,sp)
1186  000e c75237        	ld	21047,a
1187                     ; 369 }
1190  0011 84            	pop	a
1191  0012 81            	ret	
1248                     ; 379 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1248                     ; 380 {
1249                     .text:	section	.text,new
1250  0000               _USART_WakeUpConfig:
1254                     ; 381   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1256                     ; 383   USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1258  0000 72175234      	bres	21044,#3
1259                     ; 384   USART->CR1 |= (uint8_t)USART_WakeUp;
1261  0004 ca5234        	or	a,21044
1262  0007 c75234        	ld	21044,a
1263                     ; 385 }
1266  000a 81            	ret	
1402                     ; 400 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1402                     ; 401 {
1403                     .text:	section	.text,new
1404  0000               _USART_GetFlagStatus:
1406  0000 89            	pushw	x
1407  0001 88            	push	a
1408       00000001      OFST:	set	1
1411                     ; 402   FlagStatus status = RESET;
1413                     ; 405   assert_param(IS_USART_FLAG(USART_FLAG));
1415                     ; 407   if (USART_FLAG == USART_FLAG_SBK)
1417  0002 a30101        	cpw	x,#257
1418  0005 2608          	jrne	L306
1419                     ; 409     if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1421  0007 9f            	ld	a,xl
1422  0008 c45235        	and	a,21045
1423  000b 270e          	jreq	L116
1424                     ; 412       status = SET;
1426  000d 2007          	jp	LC004
1427                     ; 417       status = RESET;
1428  000f               L306:
1429                     ; 422     if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1431  000f c65230        	ld	a,21040
1432  0012 1503          	bcp	a,(OFST+2,sp)
1433  0014 2704          	jreq	L316
1434                     ; 425       status = SET;
1436  0016               LC004:
1438  0016 a601          	ld	a,#1
1442  0018 2001          	jra	L116
1443  001a               L316:
1444                     ; 430       status = RESET;
1446  001a 4f            	clr	a
1448  001b               L116:
1449                     ; 434   return status;
1453  001b 5b03          	addw	sp,#3
1454  001d 81            	ret	
1477                     ; 454 void USART_ClearFlag(void)
1477                     ; 455 {
1478                     .text:	section	.text,new
1479  0000               _USART_ClearFlag:
1483                     ; 457   USART->SR = (uint8_t)~(USART_SR_RXNE);
1485  0000 35df5230      	mov	21040,#223
1486                     ; 458 }
1489  0004 81            	ret	
1571                     ; 472 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1571                     ; 473 {
1572                     .text:	section	.text,new
1573  0000               _USART_GetITStatus:
1575  0000 89            	pushw	x
1576  0001 89            	pushw	x
1577       00000002      OFST:	set	2
1580                     ; 474   ITStatus pendingbitstatus = RESET;
1582                     ; 475   uint8_t itpos = 0;
1584                     ; 476   uint8_t itmask1 = 0;
1586                     ; 477   uint8_t itmask2 = 0;
1588                     ; 478   uint8_t enablestatus = 0;
1590                     ; 481   assert_param(IS_USART_GET_IT(USART_IT));
1592                     ; 484   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1594  0002 9f            	ld	a,xl
1595  0003 a40f          	and	a,#15
1596  0005 5f            	clrw	x
1597  0006 97            	ld	xl,a
1598  0007 a601          	ld	a,#1
1599  0009 5d            	tnzw	x
1600  000a 2704          	jreq	L25
1601  000c               L45:
1602  000c 48            	sll	a
1603  000d 5a            	decw	x
1604  000e 26fc          	jrne	L45
1605  0010               L25:
1606  0010 6b01          	ld	(OFST-1,sp),a
1608                     ; 486   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1610  0012 7b04          	ld	a,(OFST+2,sp)
1611  0014 4e            	swap	a
1612  0015 a40f          	and	a,#15
1613  0017 6b02          	ld	(OFST+0,sp),a
1615                     ; 488   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1617  0019 5f            	clrw	x
1618  001a 97            	ld	xl,a
1619  001b a601          	ld	a,#1
1620  001d 5d            	tnzw	x
1621  001e 2704          	jreq	L65
1622  0020               L06:
1623  0020 48            	sll	a
1624  0021 5a            	decw	x
1625  0022 26fc          	jrne	L06
1626  0024               L65:
1627  0024 6b02          	ld	(OFST+0,sp),a
1629                     ; 492   if (USART_IT == USART_IT_PE)
1631  0026 1e03          	ldw	x,(OFST+1,sp)
1632  0028 a30100        	cpw	x,#256
1633  002b 2614          	jrne	L176
1634                     ; 495     enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1636  002d c65234        	ld	a,21044
1637  0030 1402          	and	a,(OFST+0,sp)
1638  0032 6b02          	ld	(OFST+0,sp),a
1640                     ; 498     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1642  0034 c65230        	ld	a,21040
1643  0037 1501          	bcp	a,(OFST-1,sp)
1644  0039 271c          	jreq	L107
1646  003b 7b02          	ld	a,(OFST+0,sp)
1647  003d 2718          	jreq	L107
1648                     ; 501       pendingbitstatus = SET;
1650  003f 2012          	jp	LC006
1651                     ; 506       pendingbitstatus = RESET;
1652  0041               L176:
1653                     ; 512     enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1655  0041 c65235        	ld	a,21045
1656  0044 1402          	and	a,(OFST+0,sp)
1657  0046 6b02          	ld	(OFST+0,sp),a
1659                     ; 514     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1661  0048 c65230        	ld	a,21040
1662  004b 1501          	bcp	a,(OFST-1,sp)
1663  004d 2708          	jreq	L107
1665  004f 7b02          	ld	a,(OFST+0,sp)
1666  0051 2704          	jreq	L107
1667                     ; 517       pendingbitstatus = SET;
1669  0053               LC006:
1671  0053 a601          	ld	a,#1
1674  0055 2001          	jra	L776
1675  0057               L107:
1676                     ; 522       pendingbitstatus = RESET;
1679  0057 4f            	clr	a
1681  0058               L776:
1682                     ; 527   return  pendingbitstatus;
1686  0058 5b04          	addw	sp,#4
1687  005a 81            	ret	
1711                     ; 546 void USART_ClearITPendingBit(void)
1711                     ; 547 {
1712                     .text:	section	.text,new
1713  0000               _USART_ClearITPendingBit:
1717                     ; 549   USART->SR = (uint8_t)~(USART_SR_RXNE);
1719  0000 35df5230      	mov	21040,#223
1720                     ; 550 }
1723  0004 81            	ret	
1736                     	xdef	_USART_ClearITPendingBit
1737                     	xdef	_USART_GetITStatus
1738                     	xdef	_USART_ClearFlag
1739                     	xdef	_USART_GetFlagStatus
1740                     	xdef	_USART_WakeUpConfig
1741                     	xdef	_USART_SetAddress
1742                     	xdef	_USART_SendData9
1743                     	xdef	_USART_SendData8
1744                     	xdef	_USART_SendBreak
1745                     	xdef	_USART_ReceiverWakeUpCmd
1746                     	xdef	_USART_ReceiveData9
1747                     	xdef	_USART_ReceiveData8
1748                     	xdef	_USART_ITConfig
1749                     	xdef	_USART_Cmd
1750                     	xdef	_USART_ClockInit
1751                     	xdef	_USART_Init
1752                     	xdef	_USART_DeInit
1753                     	xref	_CLK_GetClockFreq
1754                     	xref.b	c_lreg
1755                     	xref.b	c_x
1774                     	xref	c_lursh
1775                     	xref	c_ltor
1776                     	xref	c_rtol
1777                     	xref	c_ludv
1778                     	end
