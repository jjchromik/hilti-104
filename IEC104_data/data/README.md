# Data

The tests can be done on the `iec104.pcap` file obtained from: `https://github.com/automayt/ICS-pcap/tree/master/IEC%2060870/iec104`

E.g., when in `IEC104_data` directory, run: 

```
bro -C -r data/iec104.pcap t104.evt t104_typeid_count.bro 
```

You should get something like: 
```
2018-10-09_06:42:20 [DEBUG] c_bo_na_counter: 6
2018-10-09_06:42:20 [DEBUG] m_st_tb_counter: 3
2018-10-09_06:42:20 [DEBUG] m_sp_tb_counter: 3
2018-10-09_06:42:20 [DEBUG] m_me_te_counter: 3
2018-10-09_06:42:20 [DEBUG] c_se_nc_counter: 6
2018-10-09_06:42:20 [DEBUG] c_rc_na_counter: 6
2018-10-09_06:42:20 [DEBUG] c_dc_na_counter: 6
```