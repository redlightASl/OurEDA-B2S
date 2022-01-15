   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 57 void COMP_DeInit(void)
  48                     ; 58 {
  50                     .text:	section	.text,new
  51  0000               _COMP_DeInit:
  55                     ; 59   COMP->CR   = COMP_CR_RESET_VALUE;
  57  0000 725f5300      	clr	21248
  58                     ; 60   COMP->CSR  = COMP_CSR_RESET_VALUE;
  60  0004 35505301      	mov	21249,#80
  61                     ; 61   COMP->CCS  = COMP_CCS_RESET_VALUE;
  63  0008 725f5302      	clr	21250
  64                     ; 62 }
  67  000c 81            	ret	
 201                     ; 85 void COMP_Init(COMP_Selection_TypeDef COMP_Selection,
 201                     ; 86                COMP_Reference_TypeDef COMP_Reference,
 201                     ; 87                COMP_Polarity_TypeDef COMP_Polarity)
 201                     ; 88 {
 202                     .text:	section	.text,new
 203  0000               _COMP_Init:
 205  0000 89            	pushw	x
 206       00000000      OFST:	set	0
 209                     ; 90   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 211                     ; 91   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 213                     ; 92   assert_param(IS_COMP_SELECTION(COMP_Selection));
 215                     ; 94   COMP->CR &= (uint8_t)(~((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection));
 217  0001 9f            	ld	a,xl
 218  0002 1a05          	or	a,(OFST+5,sp)
 219  0004 1a01          	or	a,(OFST+1,sp)
 220  0006 43            	cpl	a
 221  0007 c45300        	and	a,21248
 222  000a c75300        	ld	21248,a
 223                     ; 96   COMP->CR |= (uint8_t)((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection);
 225  000d 7b05          	ld	a,(OFST+5,sp)
 226  000f 1a02          	or	a,(OFST+2,sp)
 227  0011 1a01          	or	a,(OFST+1,sp)
 228  0013 ca5300        	or	a,21248
 229  0016 c75300        	ld	21248,a
 230                     ; 98 }
 233  0019 85            	popw	x
 234  001a 81            	ret	
 289                     ; 106 void COMP_Cmd(FunctionalState NewState)
 289                     ; 107 {
 290                     .text:	section	.text,new
 291  0000               _COMP_Cmd:
 295                     ; 109   assert_param(IS_FUNCTIONAL_STATE(NewState));
 297                     ; 111   if (NewState != DISABLE)
 299  0000 4d            	tnz	a
 300  0001 2705          	jreq	L131
 301                     ; 114     COMP->CR |= COMP_CR_BIASEN;
 303  0003 72105300      	bset	21248,#0
 306  0007 81            	ret	
 307  0008               L131:
 308                     ; 118     COMP->CR &= (uint8_t)(~COMP_CR_BIASEN);
 310  0008 72115300      	bres	21248,#0
 311                     ; 120 }
 314  000c 81            	ret	
 360                     ; 134 void COMP_SelectionConfig(COMP_Selection_TypeDef COMP_Selection,
 360                     ; 135                           FunctionalState NewState)
 360                     ; 136 {
 361                     .text:	section	.text,new
 362  0000               _COMP_SelectionConfig:
 364  0000 89            	pushw	x
 365       00000000      OFST:	set	0
 368                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 370                     ; 139   assert_param(IS_COMP_SELECTION(COMP_Selection));
 372                     ; 141   if (NewState != DISABLE)
 374  0001 9f            	ld	a,xl
 375  0002 4d            	tnz	a
 376  0003 2706          	jreq	L751
 377                     ; 143     COMP->CR |= (uint8_t)COMP_Selection;
 379  0005 9e            	ld	a,xh
 380  0006 ca5300        	or	a,21248
 382  0009 2006          	jra	L161
 383  000b               L751:
 384                     ; 147     COMP->CR &= (uint8_t)(~(uint8_t)COMP_Selection);
 386  000b 7b01          	ld	a,(OFST+1,sp)
 387  000d 43            	cpl	a
 388  000e c45300        	and	a,21248
 389  0011               L161:
 390  0011 c75300        	ld	21248,a
 391                     ; 149 }
 394  0014 85            	popw	x
 395  0015 81            	ret	
 474                     ; 162 void COMP_ITConfig(COMP_IT_TypeDef COMP_IT,
 474                     ; 163                    FunctionalState NewState)
 474                     ; 164 {
 475                     .text:	section	.text,new
 476  0000               _COMP_ITConfig:
 478  0000 89            	pushw	x
 479       00000000      OFST:	set	0
 482                     ; 166   assert_param(IS_COMP_IT(COMP_IT));
 484                     ; 167   assert_param(IS_FUNCTIONAL_STATE(NewState));
 486                     ; 169   if (NewState != DISABLE)
 488  0001 9f            	ld	a,xl
 489  0002 4d            	tnz	a
 490  0003 2706          	jreq	L122
 491                     ; 172     COMP->CSR |= (uint8_t)COMP_IT;
 493  0005 9e            	ld	a,xh
 494  0006 ca5301        	or	a,21249
 496  0009 2006          	jra	L322
 497  000b               L122:
 498                     ; 177     COMP->CSR &= (uint8_t)(~(uint8_t)COMP_IT);
 500  000b 7b01          	ld	a,(OFST+1,sp)
 501  000d 43            	cpl	a
 502  000e c45301        	and	a,21249
 503  0011               L322:
 504  0011 c75301        	ld	21249,a
 505                     ; 179 }
 508  0014 85            	popw	x
 509  0015 81            	ret	
 565                     ; 189 void COMP_TIM2Config(COMP_TIM2Config_TypeDef COMP_TIM2Config)
 565                     ; 190 {
 566                     .text:	section	.text,new
 567  0000               _COMP_TIM2Config:
 571                     ; 192   assert_param(IS_COMP_TIM2CONFIG(COMP_TIM2Config));
 573                     ; 195   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_IC1BK);
 575  0000 721f5300      	bres	21248,#7
 576                     ; 198   COMP->CR |= (uint8_t)COMP_TIM2Config;
 578  0004 ca5300        	or	a,21248
 579  0007 c75300        	ld	21248,a
 580                     ; 199 }
 583  000a 81            	ret	
 698                     ; 216 void COMP_SwitchConfig(COMP_Switch_TypeDef COMP_Switch,
 698                     ; 217                        FunctionalState NewState)
 698                     ; 218 {
 699                     .text:	section	.text,new
 700  0000               _COMP_SwitchConfig:
 702  0000 89            	pushw	x
 703       00000000      OFST:	set	0
 706                     ; 220   assert_param(IS_COMP_SWITCH(COMP_Switch));
 708                     ; 221   assert_param(IS_FUNCTIONAL_STATE(NewState));
 710                     ; 223   if (NewState != DISABLE)
 712  0001 9f            	ld	a,xl
 713  0002 4d            	tnz	a
 714  0003 2706          	jreq	L123
 715                     ; 226     COMP->CCS |= (uint8_t)COMP_Switch;
 717  0005 9e            	ld	a,xh
 718  0006 ca5302        	or	a,21250
 720  0009 2006          	jra	L323
 721  000b               L123:
 722                     ; 231     COMP->CCS &= (uint8_t)(~(uint8_t)COMP_Switch);
 724  000b 7b01          	ld	a,(OFST+1,sp)
 725  000d 43            	cpl	a
 726  000e c45302        	and	a,21250
 727  0011               L323:
 728  0011 c75302        	ld	21250,a
 729                     ; 233 }
 732  0014 85            	popw	x
 733  0015 81            	ret	
 809                     ; 245 void COMP_TIMConnect(COMP_TimersConnection_TypeDef COMP_TIMConnection)
 809                     ; 246 {
 810                     .text:	section	.text,new
 811  0000               _COMP_TIMConnect:
 813  0000 88            	push	a
 814       00000000      OFST:	set	0
 817                     ; 248   assert_param(IS_COMP_TIMCONNECTION(COMP_TIMConnection));
 819                     ; 251   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_CNFTIM);
 821  0001 c65300        	ld	a,21248
 822  0004 a49f          	and	a,#159
 823  0006 c75300        	ld	21248,a
 824                     ; 254   COMP->CR |= (uint8_t)COMP_TIMConnection;
 826  0009 c65300        	ld	a,21248
 827  000c 1a01          	or	a,(OFST+1,sp)
 828  000e c75300        	ld	21248,a
 829                     ; 255 }
 832  0011 84            	pop	a
 833  0012 81            	ret	
 869                     ; 265 void COMP_SelectPolarity(COMP_Polarity_TypeDef COMP_Polarity)
 869                     ; 266 {
 870                     .text:	section	.text,new
 871  0000               _COMP_SelectPolarity:
 875                     ; 268   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 877                     ; 271   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_POL);
 879  0000 72195300      	bres	21248,#4
 880                     ; 274   COMP->CR |= (uint8_t)COMP_Polarity;
 882  0004 ca5300        	or	a,21248
 883  0007 c75300        	ld	21248,a
 884                     ; 275 }
 887  000a 81            	ret	
 922                     ; 285 void COMP_SetReference(COMP_Reference_TypeDef COMP_Reference)
 922                     ; 286 {
 923                     .text:	section	.text,new
 924  0000               _COMP_SetReference:
 928                     ; 288   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 930                     ; 291   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_COMPREF);
 932  0000 72175300      	bres	21248,#3
 933                     ; 294   COMP->CR |= (uint8_t)COMP_Reference;
 935  0004 ca5300        	or	a,21248
 936  0007 c75300        	ld	21248,a
 937                     ; 295 }
 940  000a 81            	ret	
1027                     ; 305 FlagStatus COMP_GetOutputStatus(COMP_Output_TypeDef COMP_Output)
1027                     ; 306 {
1028                     .text:	section	.text,new
1029  0000               _COMP_GetOutputStatus:
1031       00000001      OFST:	set	1
1034                     ; 307   FlagStatus status = RESET;
1036                     ; 310   assert_param(IS_COMP_OUTPUT(COMP_Output));
1038                     ; 312   if ((COMP->CSR & (uint8_t)COMP_Output) != 0)
1040  0000 c45301        	and	a,21249
1041  0003 2702          	jreq	L554
1042                     ; 314     status = SET;
1044  0005 a601          	ld	a,#1
1047  0007               L554:
1048                     ; 318     status = RESET;
1051                     ; 320   return status;
1055  0007 81            	ret	
1121                     ; 331 FlagStatus COMP_GetFlagStatus(COMP_FLAG_TypeDef COMP_Flag)
1121                     ; 332 {
1122                     .text:	section	.text,new
1123  0000               _COMP_GetFlagStatus:
1125       00000001      OFST:	set	1
1128                     ; 333   FlagStatus status = RESET;
1130                     ; 336   assert_param(IS_COMP_FLAG(COMP_Flag));
1132                     ; 338   if ((COMP->CSR & (uint8_t)COMP_Flag) != 0)
1134  0000 c45301        	and	a,21249
1135  0003 2702          	jreq	L315
1136                     ; 340     status = SET;
1138  0005 a601          	ld	a,#1
1141  0007               L315:
1142                     ; 344     status = RESET;
1145                     ; 346   return status;
1149  0007 81            	ret	
1184                     ; 357 void COMP_ClearFlag(COMP_FLAG_TypeDef COMP_Flag)
1184                     ; 358 {
1185                     .text:	section	.text,new
1186  0000               _COMP_ClearFlag:
1190                     ; 360   assert_param(IS_COMP_FLAG(COMP_Flag));
1192                     ; 363   COMP->CSR |= (uint8_t)COMP_Flag;
1194  0000 ca5301        	or	a,21249
1195  0003 c75301        	ld	21249,a
1196                     ; 364 }
1199  0006 81            	ret	
1245                     ; 374 ITStatus COMP_GetITStatus(COMP_IT_TypeDef COMP_ITPendingBit)
1245                     ; 375 {
1246                     .text:	section	.text,new
1247  0000               _COMP_GetITStatus:
1249       00000001      OFST:	set	1
1252                     ; 376   ITStatus status = RESET;
1254                     ; 379   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1256                     ; 381   if (COMP->CSR & (uint8_t)COMP_ITPendingBit)
1258  0000 c45301        	and	a,21249
1259  0003 2702          	jreq	L755
1260                     ; 383     status = SET;
1262  0005 a601          	ld	a,#1
1265  0007               L755:
1266                     ; 387     status = RESET;
1269                     ; 389   return status;
1273  0007 81            	ret	
1309                     ; 400 void COMP_ClearITPendingBit(COMP_IT_TypeDef COMP_ITPendingBit)
1309                     ; 401 {
1310                     .text:	section	.text,new
1311  0000               _COMP_ClearITPendingBit:
1315                     ; 403   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1317                     ; 406   COMP->CSR |= (uint8_t)COMP_ITPendingBit;
1319  0000 ca5301        	or	a,21249
1320  0003 c75301        	ld	21249,a
1321                     ; 407 }
1324  0006 81            	ret	
1337                     	xdef	_COMP_ClearITPendingBit
1338                     	xdef	_COMP_GetITStatus
1339                     	xdef	_COMP_ClearFlag
1340                     	xdef	_COMP_GetFlagStatus
1341                     	xdef	_COMP_GetOutputStatus
1342                     	xdef	_COMP_SetReference
1343                     	xdef	_COMP_SelectPolarity
1344                     	xdef	_COMP_TIMConnect
1345                     	xdef	_COMP_SwitchConfig
1346                     	xdef	_COMP_TIM2Config
1347                     	xdef	_COMP_ITConfig
1348                     	xdef	_COMP_SelectionConfig
1349                     	xdef	_COMP_Cmd
1350                     	xdef	_COMP_Init
1351                     	xdef	_COMP_DeInit
1370                     	end
