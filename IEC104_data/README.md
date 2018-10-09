# t104.* files 

This folder contains the following: 

* `t104.spicy` file is the file describing the grammar of the IEC-104 protocol.

* `t104.evt` file defines events, i.e., indicates when to create an event. E.g., one can define an event upon parsing an I frame type, or more detailed, one can define an even upon parsing the function (Type ID) `C_IC_NA`.

* `t104*.bro` file defines how to handle each event defined in `t104.evt`. For example, file `t104_typeid_count.bro` increases some counter upon every Type ID that is parsed and prints out the total number at the end of parsing the file. 

For better understanding of the relations between the Spicy grammar, the event file and the bro file, I highly recommend to [see this video](https://youtu.be/3sQ6thi_BR0).

<a href="http://www.youtube.com/watch?feature=player_embedded&v=3sQ6thi_BR0
" target="_blank"><img src="http://img.youtube.com/vi/3sQ6thi_BR0/0.jpg" 
alt="BinPAC++ Demo by Robin Sommer" width="240" height="180" border="10" /></a>



## Currently implemented Type IDs

Process information in monitoring direction 1-29

| Type ID 	| Number 	| Implemented? 	|
|-----------|-----------|--------------	|
| M_SP_NA_1	| 1 		| Y 			|
| M_SP_TA_1 | 2* 		| Y 			|
| M_DP_NA_1	| 3 		| Y 			|
| M_DP_TA_1	| 4* 		|				|
| M_ST_NA_1 | 5 		| Y 			|
| M_ST_TA_1	| 6*		| 				|
| M_BO_NA_1	| 7 		| Y				| 
| M_BO_TA_1	| 8 		|				|
| M_ME_NA_1	| 9 		| Y 			|
| M_ME_TA_1 | 10 		|				|
| M_ME_NB_1	| 11 		| Y 			|
| M_ME_TB_1	| 12 		| 				|
| M_ME_NC_1	| 13 		| Y 			|
| M_ME_TC_1	| 14 		| 				|
| M_IT_NA_1	| 15 		| 				|
| M_IT_TA_1	| 16 		| 				|
| M_EP_TA_1	| 17 		| 				|
| M_EP_TB_1	| 18 		| 				|
| M_EP_TC_1	| 19 		| 				|
| M_PS_NA_1	| 20 		| 				|
| M_ME_ND_1	| 21 		| Y				|
|---------------------------------------|
| 22-29 reserved 						|
| process information in monitoring direction cont’d 30-44|
|---------------------------------------|

    M_SP_TB_1 = 30,     #implemented R. Udd
    M_DP_TB_1 = 31,     #implemented JCh
    M_ST_TB_1 = 32,     #implemented JCh
    M_BO_TB_1 = 33,     #implemented JCh /test the bitstring? 
    M_ME_TD_1 = 34,     #implemented JCh
    M_ME_TE_1 = 35,     #implemented JCh
    M_ME_TF_1 = 36,     #implemented JCh
    M_IT_TB_1 = 37,
    M_EP_TD_1 = 38,
    M_EP_TE_1 = 39,
    M_EP_TF_1 = 40,
    #41-44 reserved
    #process information in control direction 45-51
    C_SC_NA_1 = 45,     #implemented R. Udd
    C_DC_NA_1 = 46,     #implemented JCh 
    C_RC_NA_1 = 47,     #implemented JCh 
    C_SE_NA_1 = 48,     #implemented JCh
    C_SE_NB_1 = 49,     #implemented JCh
    C_SE_NC_1 = 50,     #implemented JCh
    C_BO_NA_1 = 51,     #implemented JCh /test the bitstring? 
    #52-57 reserved
    #process information in control direction with time tag 58-64
    C_SC_TA_1 = 58,     #implemented JCh
    C_DC_TA_1 = 59,     #implemented RF
    C_RC_TA_1 = 60,     #implemented JCh
    C_SE_TA_1 = 61,     #implemented JCh
    C_SE_TB_1 = 62,     #implemented JCh
    C_SE_TC_1 = 63,     #implemented RF
    C_BO_TA_1 = 64,     #implemented JCh /test the bitstring? 
    #65-69 reserved
    #system information in monitor direction 70-99
    M_EI_NA_1 = 70,     #implemented JCh
    #71-99 reserved
    #system information in control direction 100-109
    C_IC_NA_1 = 100,    #implemented R. Udd
    C_CI_NA_1 = 101,    #implemented JCh
    C_RD_NA_1 = 102,    #implemented JCh
    C_CS_NA_1 = 103,    #implemented JCh
    C_TS_NA_1 = 104,
    C_RP_NA_1 = 105,
    C_CD_NA_1 = 106,
    C_TS_TA_1 = 107,    #implemented JCh
    #108-109 reserved 
    #parameter in control direction 110-119
    P_ME_NA_1 = 110,
    P_ME_NB_1 = 111,
    P_ME_NC_1 = 112,
    P_AC_NA_1 = 113,
    #114-119 reserved
    #file transfer 120-127
    F_FR_NA_1 = 120,
    F_SR_NA_1 = 121, 
    F_SC_NA_1 = 122,
    F_LS_NA_1 = 123,
    F_AF_NA_1 = 124,
    F_SG_NA_1 = 125,
    F_DR_TA_1 = 126,
    #127 reserved