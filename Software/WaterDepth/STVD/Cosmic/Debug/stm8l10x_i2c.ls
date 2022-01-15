   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 122 void I2C_DeInit(void)
  48                     ; 123 {
  50                     .text:	section	.text,new
  51  0000               _I2C_DeInit:
  55                     ; 124   I2C->CR1 = I2C_CR1_RESET_VALUE;
  57  0000 725f5210      	clr	21008
  58                     ; 125   I2C->CR2 = I2C_CR2_RESET_VALUE;
  60  0004 725f5211      	clr	21009
  61                     ; 126   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  63  0008 725f5212      	clr	21010
  64                     ; 127   I2C->OARL = I2C_OARL_RESET_VALUE;
  66  000c 725f5213      	clr	21011
  67                     ; 128   I2C->OARH = I2C_OARH_RESET_VALUE;
  69  0010 725f5214      	clr	21012
  70                     ; 129   I2C->ITR = I2C_ITR_RESET_VALUE;
  72  0014 725f521a      	clr	21018
  73                     ; 130   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  75  0018 725f521b      	clr	21019
  76                     ; 131   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  78  001c 725f521c      	clr	21020
  79                     ; 132   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  81  0020 3502521d      	mov	21021,#2
  82                     ; 133 }
  85  0024 81            	ret	
 259                     .const:	section	.text
 260  0000               L21:
 261  0000 000f4240      	dc.l	1000000
 262  0004               L41:
 263  0004 000186a1      	dc.l	100001
 264  0008               L61:
 265  0008 00000004      	dc.l	4
 266                     ; 157 void I2C_Init(uint32_t OutputClockFrequency, uint16_t OwnAddress,
 266                     ; 158               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef I2C_Ack,
 266                     ; 159               I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 266                     ; 160 {
 267                     .text:	section	.text,new
 268  0000               _I2C_Init:
 270  0000 520c          	subw	sp,#12
 271       0000000c      OFST:	set	12
 274                     ; 161   uint32_t result = 0x0004;
 276                     ; 162   uint16_t tmpval = 0;
 278                     ; 163   uint8_t tmpccrh = 0;
 280  0002 0f07          	clr	(OFST-5,sp)
 282                     ; 164   uint8_t input_clock = 0;
 284                     ; 167   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 286                     ; 168   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 288                     ; 169   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 290                     ; 170   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 292                     ; 171   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 294                     ; 174   input_clock = (uint8_t)(CLK_GetClockFreq() / 1000000);
 296  0004 cd0000        	call	_CLK_GetClockFreq
 298  0007 ae0000        	ldw	x,#L21
 299  000a cd0000        	call	c_ludv
 301  000d b603          	ld	a,c_lreg+3
 302  000f 6b08          	ld	(OFST-4,sp),a
 304                     ; 178   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 306  0011 c65212        	ld	a,21010
 307  0014 a4c0          	and	a,#192
 308  0016 c75212        	ld	21010,a
 309                     ; 180   I2C->FREQR |= input_clock;
 311  0019 c65212        	ld	a,21010
 312  001c 1a08          	or	a,(OFST-4,sp)
 313  001e c75212        	ld	21010,a
 314                     ; 184   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 316  0021 72115210      	bres	21008,#0
 317                     ; 187   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 319  0025 c6521c        	ld	a,21020
 320  0028 a430          	and	a,#48
 321  002a c7521c        	ld	21020,a
 322                     ; 188   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 324  002d 725f521b      	clr	21019
 325                     ; 191   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 327  0031 96            	ldw	x,sp
 328  0032 1c000f        	addw	x,#OFST+3
 329  0035 cd0000        	call	c_ltor
 331  0038 ae0004        	ldw	x,#L41
 332  003b cd0000        	call	c_lcmp
 334  003e 2576          	jrult	L721
 335                     ; 194     tmpccrh = I2C_CCRH_FS;
 337  0040 a680          	ld	a,#128
 338  0042 6b07          	ld	(OFST-5,sp),a
 340                     ; 196     if (I2C_DutyCycle == I2C_DutyCycle_2)
 342  0044 96            	ldw	x,sp
 343  0045 0d15          	tnz	(OFST+9,sp)
 344  0047 2623          	jrne	L131
 345                     ; 199       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 347  0049 1c000f        	addw	x,#OFST+3
 348  004c cd0000        	call	c_ltor
 350  004f a603          	ld	a,#3
 351  0051 cd0000        	call	c_smul
 353  0054 96            	ldw	x,sp
 354  0055 5c            	incw	x
 355  0056 cd0000        	call	c_rtol
 358  0059 7b08          	ld	a,(OFST-4,sp)
 359  005b cd0135        	call	LC001
 361  005e 96            	ldw	x,sp
 362  005f 5c            	incw	x
 363  0060 cd0000        	call	c_ludv
 365  0063 96            	ldw	x,sp
 366  0064 1c0009        	addw	x,#OFST-3
 367  0067 cd0000        	call	c_rtol
 371  006a 2027          	jra	L331
 372  006c               L131:
 373                     ; 204       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 375  006c 1c000f        	addw	x,#OFST+3
 376  006f cd0000        	call	c_ltor
 378  0072 a619          	ld	a,#25
 379  0074 cd0000        	call	c_smul
 381  0077 96            	ldw	x,sp
 382  0078 5c            	incw	x
 383  0079 cd0000        	call	c_rtol
 386  007c 7b08          	ld	a,(OFST-4,sp)
 387  007e cd0135        	call	LC001
 389  0081 96            	ldw	x,sp
 390  0082 5c            	incw	x
 391  0083 cd0000        	call	c_ludv
 393  0086 96            	ldw	x,sp
 394  0087 1c0009        	addw	x,#OFST-3
 395  008a cd0000        	call	c_rtol
 398                     ; 206       tmpccrh |= I2C_CCRH_DUTY;
 400  008d 7b07          	ld	a,(OFST-5,sp)
 401  008f aa40          	or	a,#64
 402  0091 6b07          	ld	(OFST-5,sp),a
 404  0093               L331:
 405                     ; 210     if (result < (uint16_t)0x0001)
 407  0093 96            	ldw	x,sp
 408  0094 1c0009        	addw	x,#OFST-3
 409  0097 cd0000        	call	c_lzmp
 411  009a 2608          	jrne	L531
 412                     ; 213       result = (uint16_t)0x0001;
 414  009c ae0001        	ldw	x,#1
 415  009f 1f0b          	ldw	(OFST-1,sp),x
 416  00a1 5f            	clrw	x
 417  00a2 1f09          	ldw	(OFST-3,sp),x
 419  00a4               L531:
 420                     ; 219     tmpval = ((input_clock * 3) / 10) + 1;
 422  00a4 7b08          	ld	a,(OFST-4,sp)
 423  00a6 97            	ld	xl,a
 424  00a7 a603          	ld	a,#3
 425  00a9 42            	mul	x,a
 426  00aa a60a          	ld	a,#10
 427  00ac cd0000        	call	c_sdivx
 429  00af 5c            	incw	x
 430  00b0 1f05          	ldw	(OFST-7,sp),x
 432                     ; 220     I2C->TRISER = (uint8_t)tmpval;
 434  00b2 7b06          	ld	a,(OFST-6,sp)
 436  00b4 2046          	jra	L731
 437  00b6               L721:
 438                     ; 226     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 440  00b6 96            	ldw	x,sp
 441  00b7 1c000f        	addw	x,#OFST+3
 442  00ba cd0000        	call	c_ltor
 444  00bd 3803          	sll	c_lreg+3
 445  00bf 3902          	rlc	c_lreg+2
 446  00c1 3901          	rlc	c_lreg+1
 447  00c3 96            	ldw	x,sp
 448  00c4 3900          	rlc	c_lreg
 449  00c6 5c            	incw	x
 450  00c7 cd0000        	call	c_rtol
 453  00ca 7b08          	ld	a,(OFST-4,sp)
 454  00cc ad67          	call	LC001
 456  00ce 96            	ldw	x,sp
 457  00cf 5c            	incw	x
 458  00d0 cd0000        	call	c_ludv
 460  00d3 b602          	ld	a,c_lreg+2
 461  00d5 97            	ld	xl,a
 462  00d6 b603          	ld	a,c_lreg+3
 463  00d8 cd0000        	call	c_uitol
 465  00db 96            	ldw	x,sp
 466  00dc 1c0009        	addw	x,#OFST-3
 467  00df cd0000        	call	c_rtol
 470                     ; 229     if (result < (uint16_t)0x0004)
 472  00e2 96            	ldw	x,sp
 473  00e3 1c0009        	addw	x,#OFST-3
 474  00e6 cd0000        	call	c_ltor
 476  00e9 ae0008        	ldw	x,#L61
 477  00ec cd0000        	call	c_lcmp
 479  00ef 2408          	jruge	L141
 480                     ; 232       result = (uint16_t)0x0004;
 482  00f1 ae0004        	ldw	x,#4
 483  00f4 1f0b          	ldw	(OFST-1,sp),x
 484  00f6 5f            	clrw	x
 485  00f7 1f09          	ldw	(OFST-3,sp),x
 487  00f9               L141:
 488                     ; 238      I2C->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 490  00f9 7b08          	ld	a,(OFST-4,sp)
 491  00fb 4c            	inc	a
 492  00fc               L731:
 493  00fc c7521d        	ld	21021,a
 494                     ; 242   I2C->CCRL = (uint8_t)result;
 496  00ff 7b0c          	ld	a,(OFST+0,sp)
 497  0101 c7521b        	ld	21019,a
 498                     ; 243   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 500  0104 7b07          	ld	a,(OFST-5,sp)
 501  0106 c7521c        	ld	21020,a
 502                     ; 246     I2C->CR1 |= I2C_CR1_PE;
 504  0109 72105210      	bset	21008,#0
 505                     ; 249   I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 507  010d 72155211      	bres	21009,#2
 508                     ; 252   I2C->CR2 |= (uint8_t)I2C_Ack;
 510  0111 c65211        	ld	a,21009
 511  0114 1a16          	or	a,(OFST+10,sp)
 512  0116 c75211        	ld	21009,a
 513                     ; 255     I2C->OARL = (uint8_t)(OwnAddress);
 515  0119 7b14          	ld	a,(OFST+8,sp)
 516  011b c75213        	ld	21011,a
 517                     ; 256     I2C->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF) |
 517                     ; 257                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 519  011e 1e13          	ldw	x,(OFST+7,sp)
 520  0120 4f            	clr	a
 521  0121 01            	rrwa	x,a
 522  0122 48            	sll	a
 523  0123 01            	rrwa	x,a
 524  0124 49            	rlc	a
 525  0125 a406          	and	a,#6
 526  0127 6b04          	ld	(OFST-8,sp),a
 528  0129 7b17          	ld	a,(OFST+11,sp)
 529  012b aa40          	or	a,#64
 530  012d 1a04          	or	a,(OFST-8,sp)
 531  012f c75214        	ld	21012,a
 532                     ; 258 }
 535  0132 5b0c          	addw	sp,#12
 536  0134 81            	ret	
 537  0135               LC001:
 538  0135 b703          	ld	c_lreg+3,a
 539  0137 3f02          	clr	c_lreg+2
 540  0139 3f01          	clr	c_lreg+1
 541  013b 3f00          	clr	c_lreg
 542  013d ae0000        	ldw	x,#L21
 543  0140 cc0000        	jp	c_lmul
 598                     ; 266 void I2C_Cmd(FunctionalState NewState)
 598                     ; 267 {
 599                     .text:	section	.text,new
 600  0000               _I2C_Cmd:
 604                     ; 269   assert_param(IS_FUNCTIONAL_STATE(NewState));
 606                     ; 271   if (NewState != DISABLE)
 608  0000 4d            	tnz	a
 609  0001 2705          	jreq	L171
 610                     ; 274     I2C->CR1 |= I2C_CR1_PE;
 612  0003 72105210      	bset	21008,#0
 615  0007 81            	ret	
 616  0008               L171:
 617                     ; 279     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 619  0008 72115210      	bres	21008,#0
 620                     ; 281 }
 623  000c 81            	ret	
 658                     ; 289 void I2C_GeneralCallCmd(FunctionalState NewState)
 658                     ; 290 {
 659                     .text:	section	.text,new
 660  0000               _I2C_GeneralCallCmd:
 664                     ; 292   assert_param(IS_FUNCTIONAL_STATE(NewState));
 666                     ; 294   if (NewState != DISABLE)
 668  0000 4d            	tnz	a
 669  0001 2705          	jreq	L312
 670                     ; 297     I2C->CR1 |= I2C_CR1_ENGC;
 672  0003 721c5210      	bset	21008,#6
 675  0007 81            	ret	
 676  0008               L312:
 677                     ; 302     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 679  0008 721d5210      	bres	21008,#6
 680                     ; 304 }
 683  000c 81            	ret	
 718                     ; 314 void I2C_GenerateSTART(FunctionalState NewState)
 718                     ; 315 {
 719                     .text:	section	.text,new
 720  0000               _I2C_GenerateSTART:
 724                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 726                     ; 319   if (NewState != DISABLE)
 728  0000 4d            	tnz	a
 729  0001 2705          	jreq	L532
 730                     ; 322     I2C->CR2 |= I2C_CR2_START;
 732  0003 72105211      	bset	21009,#0
 735  0007 81            	ret	
 736  0008               L532:
 737                     ; 327     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 739  0008 72115211      	bres	21009,#0
 740                     ; 329 }
 743  000c 81            	ret	
 778                     ; 337 void I2C_GenerateSTOP(FunctionalState NewState)
 778                     ; 338 {
 779                     .text:	section	.text,new
 780  0000               _I2C_GenerateSTOP:
 784                     ; 340   assert_param(IS_FUNCTIONAL_STATE(NewState));
 786                     ; 342   if (NewState != DISABLE)
 788  0000 4d            	tnz	a
 789  0001 2705          	jreq	L752
 790                     ; 345     I2C->CR2 |= I2C_CR2_STOP;
 792  0003 72125211      	bset	21009,#1
 795  0007 81            	ret	
 796  0008               L752:
 797                     ; 350     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 799  0008 72135211      	bres	21009,#1
 800                     ; 352 }
 803  000c 81            	ret	
 839                     ; 362 void I2C_SoftwareResetCmd(FunctionalState NewState)
 839                     ; 363 {
 840                     .text:	section	.text,new
 841  0000               _I2C_SoftwareResetCmd:
 845                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 847                     ; 367   if (NewState != DISABLE)
 849  0000 4d            	tnz	a
 850  0001 2705          	jreq	L103
 851                     ; 370     I2C->CR2 |= I2C_CR2_SWRST;
 853  0003 721e5211      	bset	21009,#7
 856  0007 81            	ret	
 857  0008               L103:
 858                     ; 375     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 860  0008 721f5211      	bres	21009,#7
 861                     ; 377 }
 864  000c 81            	ret	
 900                     ; 385 void I2C_StretchClockCmd(FunctionalState NewState)
 900                     ; 386 {
 901                     .text:	section	.text,new
 902  0000               _I2C_StretchClockCmd:
 906                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 908                     ; 390   if (NewState != DISABLE)
 910  0000 4d            	tnz	a
 911  0001 2705          	jreq	L323
 912                     ; 393     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 914  0003 721f5210      	bres	21008,#7
 917  0007 81            	ret	
 918  0008               L323:
 919                     ; 398     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 921  0008 721e5210      	bset	21008,#7
 922                     ; 400 }
 925  000c 81            	ret	
 961                     ; 408 void I2C_AcknowledgeConfig(FunctionalState NewState)
 961                     ; 409 {
 962                     .text:	section	.text,new
 963  0000               _I2C_AcknowledgeConfig:
 967                     ; 411   assert_param(IS_FUNCTIONAL_STATE(NewState));
 969                     ; 413   if (NewState != DISABLE)
 971  0000 4d            	tnz	a
 972  0001 2705          	jreq	L543
 973                     ; 416     I2C->CR2 |= I2C_CR2_ACK;
 975  0003 72145211      	bset	21009,#2
 978  0007 81            	ret	
 979  0008               L543:
 980                     ; 421     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 982  0008 72155211      	bres	21009,#2
 983                     ; 423 }
 986  000c 81            	ret	
1044                     ; 434 void I2C_AckPositionConfig(I2C_AckPosition_TypeDef I2C_AckPosition)
1044                     ; 435 {
1045                     .text:	section	.text,new
1046  0000               _I2C_AckPositionConfig:
1050                     ; 437   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1052                     ; 440   I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1054  0000 72175211      	bres	21009,#3
1055                     ; 443   I2C->CR2 |= (uint8_t)I2C_AckPosition;
1057  0004 ca5211        	or	a,21009
1058  0007 c75211        	ld	21009,a
1059                     ; 444 }
1062  000a 81            	ret	
1098                     ; 454 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1098                     ; 455 {
1099                     .text:	section	.text,new
1100  0000               _I2C_FastModeDutyCycleConfig:
1104                     ; 457   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1106                     ; 459   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1108  0000 a140          	cp	a,#64
1109  0002 2605          	jrne	L514
1110                     ; 462     I2C->CCRH |= I2C_CCRH_DUTY;
1112  0004 721c521c      	bset	21020,#6
1115  0008 81            	ret	
1116  0009               L514:
1117                     ; 467     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1119  0009 721d521c      	bres	21020,#6
1120                     ; 469 }
1123  000d 81            	ret	
1190                     ; 481 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1190                     ; 482 {
1191                     .text:	section	.text,new
1192  0000               _I2C_Send7bitAddress:
1194  0000 89            	pushw	x
1195       00000000      OFST:	set	0
1198                     ; 484   assert_param(IS_I2C_ADDRESS(Address));
1200                     ; 485   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1202                     ; 488   if (I2C_Direction != I2C_Direction_Transmitter)
1204  0001 9f            	ld	a,xl
1205  0002 4d            	tnz	a
1206  0003 2706          	jreq	L354
1207                     ; 491     Address |= OAR1_ADD0_Set;
1209  0005 7b01          	ld	a,(OFST+1,sp)
1210  0007 aa01          	or	a,#1
1212  0009 2004          	jra	L554
1213  000b               L354:
1214                     ; 496     Address &= OAR1_ADD0_Reset;
1216  000b 7b01          	ld	a,(OFST+1,sp)
1217  000d a4fe          	and	a,#254
1218  000f               L554:
1219                     ; 499   I2C->DR = Address;
1221  000f c75216        	ld	21014,a
1222                     ; 500 }
1225  0012 85            	popw	x
1226  0013 81            	ret	
1260                     ; 523 void I2C_SendData(uint8_t Data)
1260                     ; 524 {
1261                     .text:	section	.text,new
1262  0000               _I2C_SendData:
1266                     ; 526   I2C->DR = Data;
1268  0000 c75216        	ld	21014,a
1269                     ; 527 }
1272  0003 81            	ret	
1295                     ; 534 uint8_t I2C_ReceiveData(void)
1295                     ; 535 {
1296                     .text:	section	.text,new
1297  0000               _I2C_ReceiveData:
1301                     ; 537   return ((uint8_t)I2C->DR);
1303  0000 c65216        	ld	a,21014
1306  0003 81            	ret	
1462                     ; 648 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1462                     ; 649 {
1463                     .text:	section	.text,new
1464  0000               _I2C_ITConfig:
1466  0000 89            	pushw	x
1467       00000000      OFST:	set	0
1470                     ; 651   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1472                     ; 652   assert_param(IS_FUNCTIONAL_STATE(NewState));
1474                     ; 654   if (NewState != DISABLE)
1476  0001 7b05          	ld	a,(OFST+5,sp)
1477  0003 2706          	jreq	L175
1478                     ; 657     I2C->ITR |= (uint8_t)I2C_IT;
1480  0005 9f            	ld	a,xl
1481  0006 ca521a        	or	a,21018
1483  0009 2006          	jra	L375
1484  000b               L175:
1485                     ; 662     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1487  000b 7b02          	ld	a,(OFST+2,sp)
1488  000d 43            	cpl	a
1489  000e c4521a        	and	a,21018
1490  0011               L375:
1491  0011 c7521a        	ld	21018,a
1492                     ; 664 }
1495  0014 85            	popw	x
1496  0015 81            	ret	
1720                     ; 700 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1720                     ; 701 {
1721                     .text:	section	.text,new
1722  0000               _I2C_CheckEvent:
1724  0000 89            	pushw	x
1725  0001 5206          	subw	sp,#6
1726       00000006      OFST:	set	6
1729                     ; 702   uint16_t lastevent = 0;
1731                     ; 703   uint8_t flag1= 0;
1733                     ; 704   uint8_t flag2= 0;
1735                     ; 705   ErrorStatus status = ERROR;
1737                     ; 708   assert_param(IS_I2C_EVENT(I2C_Event));
1739                     ; 710   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1741  0003 a30004        	cpw	x,#4
1742  0006 260e          	jrne	L507
1743                     ; 713       lastevent = (uint16_t)(I2C->SR2& I2C_SR2_AF);
1745  0008 c65218        	ld	a,21016
1746  000b a404          	and	a,#4
1747  000d 5f            	clrw	x
1748  000e 02            	rlwa	x,a
1749  000f 1f04          	ldw	(OFST-2,sp),x
1750  0011 01            	rrwa	x,a
1753  0012 1e04          	ldw	x,(OFST-2,sp)
1754  0014 201c          	jra	L707
1755  0016               L507:
1756                     ; 718     flag1 = I2C->SR1;
1758  0016 c65217        	ld	a,21015
1759  0019 6b03          	ld	(OFST-3,sp),a
1761                     ; 719     flag2 = I2C->SR3;
1763  001b c65219        	ld	a,21017
1764  001e 6b06          	ld	(OFST+0,sp),a
1766                     ; 720     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1768  0020 5f            	clrw	x
1769  0021 7b03          	ld	a,(OFST-3,sp)
1770  0023 97            	ld	xl,a
1771  0024 1f01          	ldw	(OFST-5,sp),x
1773  0026 5f            	clrw	x
1774  0027 7b06          	ld	a,(OFST+0,sp)
1775  0029 97            	ld	xl,a
1776  002a 7b02          	ld	a,(OFST-4,sp)
1777  002c 01            	rrwa	x,a
1778  002d 1a01          	or	a,(OFST-5,sp)
1779  002f 01            	rrwa	x,a
1780  0030 1f04          	ldw	(OFST-2,sp),x
1782  0032               L707:
1783                     ; 724   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1785  0032 01            	rrwa	x,a
1786  0033 1408          	and	a,(OFST+2,sp)
1787  0035 01            	rrwa	x,a
1788  0036 1407          	and	a,(OFST+1,sp)
1789  0038 01            	rrwa	x,a
1790  0039 1307          	cpw	x,(OFST+1,sp)
1791  003b 2604          	jrne	L117
1792                     ; 727     status = SUCCESS;
1794  003d a601          	ld	a,#1
1797  003f 2001          	jra	L317
1798  0041               L117:
1799                     ; 732     status = ERROR;
1801  0041 4f            	clr	a
1803  0042               L317:
1804                     ; 736   return status;
1808  0042 5b08          	addw	sp,#8
1809  0044 81            	ret	
1862                     ; 754 I2C_Event_TypeDef I2C_GetLastEvent(void)
1862                     ; 755 {
1863                     .text:	section	.text,new
1864  0000               _I2C_GetLastEvent:
1866  0000 5206          	subw	sp,#6
1867       00000006      OFST:	set	6
1870                     ; 756   __IO uint16_t lastevent = 0;
1872  0002 5f            	clrw	x
1873  0003 1f05          	ldw	(OFST-1,sp),x
1875                     ; 757   uint16_t flag1 = 0;
1877                     ; 758   uint16_t flag2 = 0;
1879                     ; 760   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1881  0005 7205521805    	btjf	21016,#2,L347
1882                     ; 762     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1884  000a ae0004        	ldw	x,#4
1886  000d 2013          	jra	L547
1887  000f               L347:
1888                     ; 767     flag1 = I2C->SR1;
1890  000f c65217        	ld	a,21015
1891  0012 97            	ld	xl,a
1892  0013 1f01          	ldw	(OFST-5,sp),x
1894                     ; 768     flag2 = I2C->SR3;
1896  0015 c65219        	ld	a,21017
1897  0018 5f            	clrw	x
1898  0019 97            	ld	xl,a
1899  001a 1f03          	ldw	(OFST-3,sp),x
1901                     ; 771     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1903  001c 7b02          	ld	a,(OFST-4,sp)
1904  001e 01            	rrwa	x,a
1905  001f 1a01          	or	a,(OFST-5,sp)
1906  0021 01            	rrwa	x,a
1907  0022               L547:
1908  0022 1f05          	ldw	(OFST-1,sp),x
1910                     ; 774   return (I2C_Event_TypeDef)lastevent;
1912  0024 1e05          	ldw	x,(OFST-1,sp)
1915  0026 5b06          	addw	sp,#6
1916  0028 81            	ret	
2118                     ; 805 FlagStatus I2C_GetFlagStatus(I2C_FLAG_TypeDef I2C_FLAG)
2118                     ; 806 {
2119                     .text:	section	.text,new
2120  0000               _I2C_GetFlagStatus:
2122  0000 89            	pushw	x
2123  0001 89            	pushw	x
2124       00000002      OFST:	set	2
2127                     ; 807   uint8_t tempreg = 0;
2129  0002 0f02          	clr	(OFST+0,sp)
2131                     ; 808   uint8_t regindex = 0;
2133                     ; 809   FlagStatus bitstatus = RESET;
2135                     ; 812   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
2137                     ; 815   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
2139  0004 9e            	ld	a,xh
2140  0005 6b01          	ld	(OFST-1,sp),a
2142                     ; 818   switch (regindex)
2145                     ; 834     default:
2145                     ; 835       break;
2146  0007 4a            	dec	a
2147  0008 2708          	jreq	L747
2148  000a 4a            	dec	a
2149  000b 270a          	jreq	L157
2150  000d 4a            	dec	a
2151  000e 270c          	jreq	L357
2152  0010 200f          	jra	L7601
2153  0012               L747:
2154                     ; 821     case 0x01:
2154                     ; 822       tempreg = (uint8_t)I2C->SR1;
2156  0012 c65217        	ld	a,21015
2157                     ; 823       break;
2159  0015 2008          	jp	LC002
2160  0017               L157:
2161                     ; 826     case 0x02:
2161                     ; 827       tempreg = (uint8_t)I2C->SR2;
2163  0017 c65218        	ld	a,21016
2164                     ; 828       break;
2166  001a 2003          	jp	LC002
2167  001c               L357:
2168                     ; 831     case 0x03:
2168                     ; 832       tempreg = (uint8_t)I2C->SR3;
2170  001c c65219        	ld	a,21017
2171  001f               LC002:
2172  001f 6b02          	ld	(OFST+0,sp),a
2174                     ; 833       break;
2176                     ; 834     default:
2176                     ; 835       break;
2178  0021               L7601:
2179                     ; 839   if ((tempreg & (uint8_t)I2C_FLAG) != 0)
2181  0021 7b04          	ld	a,(OFST+2,sp)
2182  0023 1502          	bcp	a,(OFST+0,sp)
2183  0025 2704          	jreq	L1701
2184                     ; 842     bitstatus = SET;
2186  0027 a601          	ld	a,#1
2189  0029 2001          	jra	L3701
2190  002b               L1701:
2191                     ; 847     bitstatus = RESET;
2193  002b 4f            	clr	a
2195  002c               L3701:
2196                     ; 850   return bitstatus;
2200  002c 5b04          	addw	sp,#4
2201  002e 81            	ret	
2245                     ; 879 void I2C_ClearFlag(I2C_FLAG_TypeDef I2C_FLAG)
2245                     ; 880 {
2246                     .text:	section	.text,new
2247  0000               _I2C_ClearFlag:
2249  0000 89            	pushw	x
2250       00000002      OFST:	set	2
2253                     ; 881   uint16_t flagpos = 0;
2255                     ; 883   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
2257                     ; 886   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2259  0001 01            	rrwa	x,a
2260  0002 5f            	clrw	x
2261  0003 02            	rlwa	x,a
2262  0004 1f01          	ldw	(OFST-1,sp),x
2264                     ; 888   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2266  0006 7b02          	ld	a,(OFST+0,sp)
2267  0008 43            	cpl	a
2268  0009 c75218        	ld	21016,a
2269                     ; 889 }
2272  000c 85            	popw	x
2273  000d 81            	ret	
2337                     ; 910 ITStatus I2C_GetITStatus(I2C_IT_TypeDef I2C_IT)
2337                     ; 911 {
2338                     .text:	section	.text,new
2339  0000               _I2C_GetITStatus:
2341  0000 89            	pushw	x
2342  0001 5204          	subw	sp,#4
2343       00000004      OFST:	set	4
2346                     ; 912   ITStatus bitstatus = RESET;
2348                     ; 913   __IO uint8_t enablestatus = 0;
2350  0003 0f03          	clr	(OFST-1,sp)
2352                     ; 914   uint16_t tempregister = 0;
2354                     ; 917   assert_param(IS_I2C_GET_IT(I2C_IT));
2356                     ; 919   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
2358  0005 9e            	ld	a,xh
2359  0006 a407          	and	a,#7
2360  0008 5f            	clrw	x
2361  0009 97            	ld	xl,a
2362  000a 1f01          	ldw	(OFST-3,sp),x
2364                     ; 922   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2366  000c c6521a        	ld	a,21018
2367  000f 1402          	and	a,(OFST-2,sp)
2368  0011 6b03          	ld	(OFST-1,sp),a
2370                     ; 924   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
2372  0013 7b05          	ld	a,(OFST+1,sp)
2373  0015 a430          	and	a,#48
2374  0017 97            	ld	xl,a
2375  0018 4f            	clr	a
2376  0019 02            	rlwa	x,a
2377  001a a30100        	cpw	x,#256
2378  001d 260d          	jrne	L1511
2379                     ; 927     if (((I2C->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2381  001f c65217        	ld	a,21015
2382  0022 1506          	bcp	a,(OFST+2,sp)
2383  0024 2715          	jreq	L1611
2385  0026 0d03          	tnz	(OFST-1,sp)
2386  0028 2711          	jreq	L1611
2387                     ; 930       bitstatus = SET;
2389  002a 200b          	jp	LC004
2390                     ; 935       bitstatus = RESET;
2391  002c               L1511:
2392                     ; 941     if (((I2C->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2394  002c c65218        	ld	a,21016
2395  002f 1506          	bcp	a,(OFST+2,sp)
2396  0031 2708          	jreq	L1611
2398  0033 0d03          	tnz	(OFST-1,sp)
2399  0035 2704          	jreq	L1611
2400                     ; 944       bitstatus = SET;
2402  0037               LC004:
2404  0037 a601          	ld	a,#1
2407  0039 2001          	jra	L7511
2408  003b               L1611:
2409                     ; 949       bitstatus = RESET;
2412  003b 4f            	clr	a
2414  003c               L7511:
2415                     ; 953   return  bitstatus;
2419  003c 5b06          	addw	sp,#6
2420  003e 81            	ret	
2465                     ; 982 void I2C_ClearITPendingBit(I2C_IT_TypeDef I2C_IT)
2465                     ; 983 {
2466                     .text:	section	.text,new
2467  0000               _I2C_ClearITPendingBit:
2469  0000 89            	pushw	x
2470       00000002      OFST:	set	2
2473                     ; 984   uint16_t flagpos = 0;
2475                     ; 987   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
2477                     ; 990   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
2479  0001 01            	rrwa	x,a
2480  0002 5f            	clrw	x
2481  0003 02            	rlwa	x,a
2482  0004 1f01          	ldw	(OFST-1,sp),x
2484                     ; 993   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2486  0006 7b02          	ld	a,(OFST+0,sp)
2487  0008 43            	cpl	a
2488  0009 c75218        	ld	21016,a
2489                     ; 994 }
2492  000c 85            	popw	x
2493  000d 81            	ret	
2506                     	xdef	_I2C_ClearITPendingBit
2507                     	xdef	_I2C_GetITStatus
2508                     	xdef	_I2C_ClearFlag
2509                     	xdef	_I2C_GetFlagStatus
2510                     	xdef	_I2C_GetLastEvent
2511                     	xdef	_I2C_CheckEvent
2512                     	xdef	_I2C_ITConfig
2513                     	xdef	_I2C_ReceiveData
2514                     	xdef	_I2C_SendData
2515                     	xdef	_I2C_Send7bitAddress
2516                     	xdef	_I2C_FastModeDutyCycleConfig
2517                     	xdef	_I2C_AckPositionConfig
2518                     	xdef	_I2C_AcknowledgeConfig
2519                     	xdef	_I2C_GenerateSTOP
2520                     	xdef	_I2C_GenerateSTART
2521                     	xdef	_I2C_StretchClockCmd
2522                     	xdef	_I2C_SoftwareResetCmd
2523                     	xdef	_I2C_GeneralCallCmd
2524                     	xdef	_I2C_Cmd
2525                     	xdef	_I2C_Init
2526                     	xdef	_I2C_DeInit
2527                     	xref	_CLK_GetClockFreq
2528                     	xref.b	c_lreg
2529                     	xref.b	c_x
2548                     	xref	c_uitol
2549                     	xref	c_sdivx
2550                     	xref	c_lzmp
2551                     	xref	c_rtol
2552                     	xref	c_smul
2553                     	xref	c_lmul
2554                     	xref	c_lcmp
2555                     	xref	c_ltor
2556                     	xref	c_ludv
2557                     	end
