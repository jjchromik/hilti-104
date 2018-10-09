# @author: Justyna Chromik
# Bro file to analyse various TypeIDs frame events. 
# @version: 13-04-2018

##############################################################################
# This script only counts the number of the specific Type IDs in the traffic #
##############################################################################

@load base/protocols/conn

module T104_Events;

export{
	redef enum Log::ID += {LOG_SetPoints};
	#redef PacketFilter::all_packets=T;
	const DEBUG_ENABLED = T;
}

function print_debug(message: string) {
	if (DEBUG_ENABLED){
		print fmt("%s [DEBUG] %s", strftime("%Y-%m-%d_%H:%M:%S", current_time()), message);
	}
}

export {
	type norm_val:record {
		ioa_addr: int;
		value: int;
	};
	type single_point:record {
		ioa_addr: int;
		point: bool;
	};
}

#############################
# Setting the counters to 0 #
#############################

global counters: table[string] of count={
	#process information in monitoring direction 1-29
	#1
	["m_sp_na_counter"] = 0,
	["m_dp_ta_counter"] = 0,
	["m_dp_na_counter"] = 0,
	["m_st_na_counter"] = 0,
	["m_bo_na_counter"] = 0,
	["m_me_na_counter"] = 0,
	["m_me_nb_counter"] = 0,
	["m_me_nc_counter"] = 0,
	#21
	["m_me_nd_counter"] = 0,
	#22-29 reserved
    #process information in monitoring direction cont’d 30-44
	#30
	["m_sp_tb_counter"] = 0,
	["m_dp_tb_counter"] = 0,
	["m_st_tb_counter"] = 0,
	["m_bo_tb_counter"] = 0,
	["m_me_td_counter"] = 0,
	["m_me_te_counter"] = 0,
	["m_me_tf_counter"] = 0,
	#41-44 reserved
    #process information in control direction 45-51
	#45
	["c_sc_na_counter"] = 0,
	["c_dc_na_counter"] = 0,
	["c_rc_na_counter"] = 0,
	["c_se_na_counter"] = 0,
	["c_se_nb_counter"] = 0,
	["c_se_nc_counter"] = 0,
	["c_bo_na_counter"] = 0,
	#52-57 reserved
    #process information in control direction with time tag 58-64
    #58
	["c_sc_ta_counter"] = 0,
	["c_dc_ta_counter"] = 0,
	["c_rc_ta_counter"] = 0,
	["c_se_ta_counter"] = 0,
	["c_se_tb_counter"] = 0,
	["c_se_tc_counter"] = 0,
	["c_bo_ta_counter"] = 0,
	#65-69 reserved
    #system information in monitor direction 70-99
	#70
	["m_ei_na_counter"] = 0,
	#71-99 reserved
    #system information in control direction 100-109
	#100
	["c_ic_na_counter"] = 0,
	["c_ci_na_counter"] = 0,
	["c_rd_na_counter"] = 0,
	["c_cs_na_counter"] = 0,
	["c_ts_ta_counter"] = 0,
	#114-119 reserved
    #file transfer 120-127
    #127 reserved
	# proprietary
	["c_ih_na_p_counter"] = 0,
	["c_su_na_p_counter"] = 0,
	["x_ds_na_p_counter"] = 0
};



global begin_time: time;
global total_time: interval;

event bro_init() {
	begin_time = current_time();

}

type cause:record {
    negative : bool;
    test : bool;
    common_addr : int;
};

##############################
###       TYPE IDs         ###
##############################

#1
event t104::m_sp_na_asdu(c: connection, cot: cause) {
	counters["m_sp_na_counter"] += 1;
}
#2
event t104::m_sp_ta_asdu(c: connection, cot: cause) {
	counters["m_dp_ta_counter"] += 1;
}
#3
event t104::m_dp_na_asdu(c: connection, cot: cause) {
	counters["m_dp_na_counter"] += 1;
}
#5 
event t104::m_st_na_asdu(c: connection, cot: cause) {
	counters["m_st_na_counter"] += 1;
}
#7
event t104::m_bo_na_asdu(c: connection, cot: cause) {
	counters["m_bo_na_counter"] += 1; 
}
#9
event t104::m_me_na_asdu(c: connection, cot: cause) {
	counters["m_me_na_counter"] += 1;
}
#11
event t104::m_me_nb_asdu(c: connection, cot: cause) {
	counters["m_me_nb_counter"] += 1;
}
#13
event t104::m_me_nc_asdu(c: connection, cot: cause) {
	counters["m_me_nc_counter"] += 1;
}
#21
event t104::m_me_nd_asdu(c: connection, cot: cause) {
	counters["m_me_nd_counter"] += 1;
}
#30
event t104::m_sp_tb_asdu(c: connection, cot: cause) {
	counters["m_sp_tb_counter"] += 1;
}
#31
event t104::m_dp_tb_asdu(c: connection, cot: cause) {
	counters["m_dp_tb_counter"] += 1;
}
#32
event t104::m_st_tb_asdu(c: connection, cot: cause) {
	counters["m_st_tb_counter"] += 1;
}
#33
event t104::m_bo_tb_asdu(c: connection, cot: cause) {
	counters["m_bo_tb_counter"] += 1;
}
#34
event t104::m_me_td_asdu(c: connection, cot: cause) { 
	counters["m_me_td_counter"] += 1;
}
#35
event t104::m_me_te_asdu(c: connection, cot: cause) { 
	counters["m_me_te_counter"] += 1;
}
#36
event t104::m_me_tf_asdu(c: connection, cot: cause) { 
	counters["m_me_tf_counter"] += 1;
}
#45
event t104::c_sc_na_asdu(c: connection, cot: cause) {
	counters["c_sc_na_counter"] += 1;
}
#46
event t104::c_dc_na_asdu(c: connection, cot: cause) {
	counters["c_dc_na_counter"] += 1;
}
#47
event t104::c_rc_na_asdu(c: connection, cot: cause) {
	counters["c_rc_na_counter"] += 1;
}
#48
event t104::c_se_na_asdu(c: connection, cot: cause) {
	counters["c_se_na_counter"] += 1;
}
#49
event t104::c_se_nb_asdu(c: connection, cot: cause) {
	counters["c_se_nb_counter"] += 1;
}
#50
event t104::c_se_nc_asdu(c: connection, cot: cause) {
	counters["c_se_nc_counter"] += 1;
}
#51
event t104::c_bo_na_asdu(c: connection, cot: cause) {
	counters["c_bo_na_counter"] += 1;
}
#58
event t104::c_sc_ta_asdu(c: connection, cot: cause) {
	counters["c_sc_ta_counter"] += 1;
}
#59
event t104::c_dc_ta_asdu(c: connection, cot: cause) {
	counters["c_dc_ta_counter"] += 1;
}
#60
event t104::c_rc_ta_asdu(c: connection, cot: cause) {
	counters["c_rc_ta_counter"] += 1;
}
#61
event t104::c_se_ta_asdu(c: connection, cot: cause) { 
	counters["c_se_ta_counter"] += 1;
}
#62
event t104::c_se_tb_asdu(c: connection, cot: cause) { 
	counters["c_se_tb_counter"] += 1;
}
#63
event t104::c_se_tc_asdu(c: connection, cot: cause) { 
	counters["c_se_tc_counter"] += 1;
}
#64
event t104::c_bo_ta_asdu(c: connection, cot: cause) { 
	counters["c_bo_ta_counter"] += 1;
}
#70
event t104::m_ei_na_asdu(c: connection, cot: cause) { 
	counters["m_ei_na_counter"] += 1;
}
#100
event t104::c_ic_na_asdu(c: connection, cot: cause) {
	counters["c_ic_na_counter"] += 1;
}
#101
event t104::c_ci_na_asdu(c: connection, cot: cause) {
	counters["c_ci_na_counter"] += 1;
}
#102
event t104::c_rd_na_asdu(c: connection, cot: cause) {
	counters["c_rd_na_counter"] += 1;
}
#103
event t104::c_cs_na_asdu(c: connection, cot: cause) {
	counters["c_cs_na_counter"] += 1;
}
#107
event t104::c_ts_ta_asdu(c: connection, cot: cause) {
	counters["c_ts_ta_counter"] += 1;
}
#142
event t104::c_ih_na_p_asdu(c: connection, cot: cause) {
	counters["c_ih_na_p_counter"] += 1;
}
#143
event t104::c_su_na_p_asdu(c: connection, cot: cause) {
	counters["c_su_na_p_counter"] += 1;
}
#200 
event t104::x_ds_na_p_asdu(c: connection, cot: cause) {
	counters["x_ds_na_p_counter"] += 1;
}


event bro_done () {
	total_time =  current_time() - begin_time;
	
	for ([i] in counters){
		if (counters[i] >0 ) {
			print_debug(fmt("%s: %d", i, counters[i]));
		}
	}
	print_debug(fmt("Total time: %s", total_time));
	
}
