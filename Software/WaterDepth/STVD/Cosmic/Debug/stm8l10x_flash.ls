   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  83                     ; 157 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
  83                     ; 158 {
  85                     .text:	section	.text,new
  86  0000               _FLASH_SetProgrammingTime:
  90                     ; 160   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
  92                     ; 162   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  94  0000 72115050      	bres	20560,#0
  95                     ; 163   FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
  97  0004 ca5050        	or	a,20560
  98  0007 c75050        	ld	20560,a
  99                     ; 164 }
 102  000a 81            	ret	
 127                     ; 171 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 127                     ; 172 {
 128                     .text:	section	.text,new
 129  0000               _FLASH_GetProgrammingTime:
 133                     ; 173   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 135  0000 c65050        	ld	a,20560
 136  0003 a401          	and	a,#1
 139  0005 81            	ret	
 162                     ; 215 void FLASH_DeInit(void)
 162                     ; 216 {
 163                     .text:	section	.text,new
 164  0000               _FLASH_DeInit:
 168                     ; 217   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 170  0000 725f5050      	clr	20560
 171                     ; 218   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 173  0004 725f5051      	clr	20561
 174                     ; 219   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 176  0008 35405054      	mov	20564,#64
 177                     ; 220   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 179  000c c65054        	ld	a,20564
 180                     ; 221 }
 183  000f 81            	ret	
 239                     ; 231 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 239                     ; 232 {
 240                     .text:	section	.text,new
 241  0000               _FLASH_Unlock:
 243       00000000      OFST:	set	0
 246                     ; 234   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 248                     ; 237   if (FLASH_MemType == FLASH_MemType_Program)
 250  0000 a1fd          	cp	a,#253
 251  0002 2608          	jrne	L501
 252                     ; 239     FLASH->PUKR = FLASH_RASS_KEY1;
 254  0004 35565052      	mov	20562,#86
 255                     ; 240     FLASH->PUKR = FLASH_RASS_KEY2;
 257  0008 35ae5052      	mov	20562,#174
 258  000c               L501:
 259                     ; 243   if (FLASH_MemType == FLASH_MemType_Data)
 261  000c a1f7          	cp	a,#247
 262  000e 2608          	jrne	L701
 263                     ; 245     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 265  0010 35ae5053      	mov	20563,#174
 266                     ; 246     FLASH->DUKR = FLASH_RASS_KEY1;
 268  0014 35565053      	mov	20563,#86
 269  0018               L701:
 270                     ; 248 }
 273  0018 81            	ret	
 308                     ; 258 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 308                     ; 259 {
 309                     .text:	section	.text,new
 310  0000               _FLASH_Lock:
 314                     ; 261   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 316                     ; 263   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 318  0000 c45054        	and	a,20564
 319  0003 c75054        	ld	20564,a
 320                     ; 264 }
 323  0006 81            	ret	
 366                     ; 272 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 366                     ; 273 {
 367                     .text:	section	.text,new
 368  0000               _FLASH_ProgramByte:
 370       fffffffe      OFST: set -2
 373                     ; 275   assert_param(IS_FLASH_ADDRESS(Address));
 375                     ; 277   *(PointerAttr uint8_t*) (uint16_t)Address = Data;  
 377  0000 7b03          	ld	a,(OFST+5,sp)
 378  0002 f7            	ld	(x),a
 379                     ; 278 }
 382  0003 81            	ret	
 416                     ; 285 void FLASH_EraseByte(uint16_t Address)
 416                     ; 286 {
 417                     .text:	section	.text,new
 418  0000               _FLASH_EraseByte:
 422                     ; 288   assert_param(IS_FLASH_ADDRESS(Address));
 424                     ; 290   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 426  0000 7f            	clr	(x)
 427                     ; 291 }
 431  0001 81            	ret	
 474                     ; 299 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 474                     ; 300 {
 475                     .text:	section	.text,new
 476  0000               _FLASH_ProgramWord:
 478       fffffffe      OFST: set -2
 481                     ; 302   assert_param(IS_FLASH_ADDRESS(Address));
 483                     ; 305   FLASH->CR2 |= FLASH_CR2_WPRG;
 485  0000 721c5051      	bset	20561,#6
 486                     ; 308   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 488  0004 7b03          	ld	a,(OFST+5,sp)
 489  0006 f7            	ld	(x),a
 490                     ; 310   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 492  0007 7b04          	ld	a,(OFST+6,sp)
 493  0009 e701          	ld	(1,x),a
 494                     ; 312   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 496  000b 7b05          	ld	a,(OFST+7,sp)
 497  000d e702          	ld	(2,x),a
 498                     ; 314   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 500  000f 7b06          	ld	a,(OFST+8,sp)
 501  0011 e703          	ld	(3,x),a
 502                     ; 315 }
 505  0013 81            	ret	
 539                     ; 322 uint8_t FLASH_ReadByte(uint16_t Address)
 539                     ; 323 {
 540                     .text:	section	.text,new
 541  0000               _FLASH_ReadByte:
 545                     ; 325   assert_param(IS_FLASH_ADDRESS(Address));
 547                     ; 328   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 549  0000 f6            	ld	a,(x)
 552  0001 81            	ret	
 609                     ; 358 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 609                     ; 359 {
 610                     .text:	section	.text,new
 611  0000               _FLASH_GetReadOutProtectionStatus:
 613       00000001      OFST:	set	1
 616                     ; 360   FunctionalState state = DISABLE;
 618                     ; 362   if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 620  0000 c64800        	ld	a,18432
 621  0003 a1aa          	cp	a,#170
 622  0005 2603          	jrne	L552
 623                     ; 365     state = ENABLE;
 625  0007 a601          	ld	a,#1
 629  0009 81            	ret	
 630  000a               L552:
 631                     ; 370     state = DISABLE;
 633  000a 4f            	clr	a
 635                     ; 373     return state;
 639  000b 81            	ret	
 673                     ; 381 uint16_t FLASH_GetBootSize(void)
 673                     ; 382 {
 674                     .text:	section	.text,new
 675  0000               _FLASH_GetBootSize:
 677       00000002      OFST:	set	2
 680                     ; 383   uint16_t temp = 0;
 682                     ; 386   temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 684  0000 c64802        	ld	a,18434
 685  0003 97            	ld	xl,a
 686  0004 a640          	ld	a,#64
 687  0006 42            	mul	x,a
 689                     ; 389   if (OPT->OPT2_BOOTSIZE > 0x7F)
 691  0007 c64802        	ld	a,18434
 692  000a a180          	cp	a,#128
 693  000c 2503          	jrult	L772
 694                     ; 391     temp = 8192;
 696  000e ae2000        	ldw	x,#8192
 698  0011               L772:
 699                     ; 395   return(temp);
 703  0011 81            	ret	
 737                     ; 403 uint16_t FLASH_GetDataSize(void)
 737                     ; 404 {
 738                     .text:	section	.text,new
 739  0000               _FLASH_GetDataSize:
 741       00000002      OFST:	set	2
 744                     ; 405   uint16_t temp = 0;
 746                     ; 408   temp = (uint16_t)((uint16_t)OPT->OPT3_DATASIZE * (uint16_t)64);
 748  0000 c64803        	ld	a,18435
 749  0003 5f            	clrw	x
 750  0004 97            	ld	xl,a
 751  0005 58            	sllw	x
 752  0006 58            	sllw	x
 753  0007 58            	sllw	x
 754  0008 58            	sllw	x
 755  0009 58            	sllw	x
 756  000a 58            	sllw	x
 758                     ; 411   if (OPT->OPT3_DATASIZE > 0x20)
 760  000b c64803        	ld	a,18435
 761  000e a121          	cp	a,#33
 762  0010 2503          	jrult	L713
 763                     ; 413     temp = 2048;
 765  0012 ae0800        	ldw	x,#2048
 767  0015               L713:
 768                     ; 417   return(temp);
 772  0015 81            	ret	
 807                     ; 441 void FLASH_ITConfig(FunctionalState NewState)
 807                     ; 442 {
 808                     .text:	section	.text,new
 809  0000               _FLASH_ITConfig:
 813                     ; 444   assert_param(IS_FUNCTIONAL_STATE(NewState));
 815                     ; 446   if (NewState != DISABLE)
 817  0000 4d            	tnz	a
 818  0001 2705          	jreq	L733
 819                     ; 448     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 821  0003 72125050      	bset	20560,#1
 824  0007 81            	ret	
 825  0008               L733:
 826                     ; 452     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 828  0008 72135050      	bres	20560,#1
 829                     ; 454 }
 832  000c 81            	ret	
 934                     ; 467 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 934                     ; 468 {
 935                     .text:	section	.text,new
 936  0000               _FLASH_GetFlagStatus:
 938       00000001      OFST:	set	1
 941                     ; 469   FlagStatus status = RESET;
 943                     ; 471   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 945                     ; 474   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 947  0000 c45054        	and	a,20564
 948  0003 2702          	jreq	L114
 949                     ; 476     status = SET; /* FLASH_FLAG is set*/
 951  0005 a601          	ld	a,#1
 954  0007               L114:
 955                     ; 480     status = RESET; /* FLASH_FLAG is reset*/
 958                     ; 484   return status;
 962  0007 81            	ret	
1056                     ; 602 IN_RAM(void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer))
1056                     ; 603 {
1057                     .text:	section	.text,new
1058  0000               _FLASH_ProgramBlock:
1060  0000 89            	pushw	x
1061  0001 5204          	subw	sp,#4
1062       00000004      OFST:	set	4
1065                     ; 604   uint16_t Count = 0;
1067                     ; 605   uint16_t StartAddress = 0;
1069                     ; 608   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1071                     ; 609   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1073                     ; 612   if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1075  0003 9f            	ld	a,xl
1076  0004 4d            	tnz	a
1077  0005 2606          	jrne	L364
1078                     ; 615     FLASH->CR2 |= FLASH_CR2_PRG;
1080  0007 72105051      	bset	20561,#0
1082  000b 2004          	jra	L564
1083  000d               L364:
1084                     ; 620     FLASH->CR2 |= FLASH_CR2_FPRG;
1086  000d 72185051      	bset	20561,#4
1087  0011               L564:
1088                     ; 622   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1090                     ; 624   StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1092  0011 7b05          	ld	a,(OFST+1,sp)
1093  0013 5f            	clrw	x
1094  0014 97            	ld	xl,a
1095  0015 58            	sllw	x
1096  0016 58            	sllw	x
1097  0017 58            	sllw	x
1098  0018 58            	sllw	x
1099  0019 58            	sllw	x
1100  001a 58            	sllw	x
1101  001b 1c8000        	addw	x,#32768
1102  001e 1f01          	ldw	(OFST-3,sp),x
1104                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1106  0020 5f            	clrw	x
1107  0021 1f03          	ldw	(OFST-1,sp),x
1109  0023               L764:
1110                     ; 629     *((PointerAttr uint8_t*) (uint16_t)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1112  0023 1e09          	ldw	x,(OFST+5,sp)
1113  0025 72fb03        	addw	x,(OFST-1,sp)
1114  0028 f6            	ld	a,(x)
1115  0029 1e01          	ldw	x,(OFST-3,sp)
1116  002b 72fb03        	addw	x,(OFST-1,sp)
1117  002e f7            	ld	(x),a
1118                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1120  002f 1e03          	ldw	x,(OFST-1,sp)
1121  0031 5c            	incw	x
1122  0032 1f03          	ldw	(OFST-1,sp),x
1126  0034 a30040        	cpw	x,#64
1127  0037 25ea          	jrult	L764
1128                     ; 631 }
1131  0039 5b06          	addw	sp,#6
1132  003b 81            	ret	
1185                     ; 643 IN_RAM(void FLASH_EraseBlock(uint8_t BlockNum))
1185                     ; 644 {
1186                     .text:	section	.text,new
1187  0000               _FLASH_EraseBlock:
1189       00000004      OFST:	set	4
1192                     ; 646   uint16_t StartAddress = 0;
1194                     ; 648   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1196                     ; 650   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1198                     ; 652   pwFlash = (PointerAttr uint32_t *)(uint16_t)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1200  0000 5f            	clrw	x
1201  0001 97            	ld	xl,a
1202  0002 58            	sllw	x
1203  0003 58            	sllw	x
1204  0004 58            	sllw	x
1205  0005 58            	sllw	x
1206  0006 58            	sllw	x
1207  0007 58            	sllw	x
1208  0008 1c8000        	addw	x,#32768
1210                     ; 655   FLASH->CR2 |= FLASH_CR2_ERASE;
1212  000b 721a5051      	bset	20561,#5
1213                     ; 657   *pwFlash = (uint32_t)0;
1215  000f 4f            	clr	a
1216  0010 e703          	ld	(3,x),a
1217  0012 e702          	ld	(2,x),a
1218  0014 e701          	ld	(1,x),a
1219  0016 f7            	ld	(x),a
1220                     ; 658 }
1223  0017 81            	ret	
1298                     ; 670 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(void))
1298                     ; 671 {
1299                     .text:	section	.text,new
1300  0000               _FLASH_WaitForLastOperation:
1302  0000 5203          	subw	sp,#3
1303       00000003      OFST:	set	3
1306                     ; 672   uint16_t timeout = OPERATION_TIMEOUT;
1308  0002 ae1000        	ldw	x,#4096
1309  0005 1f01          	ldw	(OFST-2,sp),x
1311                     ; 673   uint8_t My_FlagStatus = 0x00;
1313  0007 0f03          	clr	(OFST+0,sp)
1316  0009 200a          	jra	L365
1317  000b               L755:
1318                     ; 678     My_FlagStatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1320  000b c65054        	ld	a,20564
1321  000e a405          	and	a,#5
1322  0010 6b03          	ld	(OFST+0,sp),a
1324                     ; 679     timeout--;
1326  0012 5a            	decw	x
1327  0013 1f01          	ldw	(OFST-2,sp),x
1329  0015               L365:
1330                     ; 676   while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1332  0015 7b03          	ld	a,(OFST+0,sp)
1333  0017 2604          	jrne	L765
1335  0019 1e01          	ldw	x,(OFST-2,sp)
1336  001b 26ee          	jrne	L755
1337  001d               L765:
1338                     ; 682   if (timeout == 0x00)
1340  001d 1e01          	ldw	x,(OFST-2,sp)
1341  001f 2602          	jrne	L175
1342                     ; 684     My_FlagStatus = (uint8_t)FLASH_Status_TimeOut;
1344  0021 a602          	ld	a,#2
1346  0023               L175:
1347                     ; 687   return((FLASH_Status_TypeDef)My_FlagStatus);
1351  0023 5b03          	addw	sp,#3
1352  0025 81            	ret	
1365                     	xdef	_FLASH_WaitForLastOperation
1366                     	xdef	_FLASH_EraseBlock
1367                     	xdef	_FLASH_ProgramBlock
1368                     	xdef	_FLASH_GetFlagStatus
1369                     	xdef	_FLASH_ITConfig
1370                     	xdef	_FLASH_GetReadOutProtectionStatus
1371                     	xdef	_FLASH_GetDataSize
1372                     	xdef	_FLASH_GetBootSize
1373                     	xdef	_FLASH_ReadByte
1374                     	xdef	_FLASH_ProgramWord
1375                     	xdef	_FLASH_EraseByte
1376                     	xdef	_FLASH_ProgramByte
1377                     	xdef	_FLASH_Lock
1378                     	xdef	_FLASH_Unlock
1379                     	xdef	_FLASH_DeInit
1380                     	xdef	_FLASH_SetProgrammingTime
1381                     	xdef	_FLASH_GetProgrammingTime
1400                     	end
