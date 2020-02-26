SELECT *
FROM CD03501P.I_CM_RKPG_ADDR
WHERE (RKPG_PRSN_ID, ORIG_PRSN_ID, PRSN_RSN_CD) in (
    select RKPG_PRSN_ID, ORIG_PRSN_ID, PRSN_RSN_CD from CD03501P.H_CM_EEST_EEOR 
    where efenddt = '2299-12-31' and cat_id = 1 and PROC_ST_CD like 'C%' and cat_cd in ('BENE','TERM','QDRO')) 
and (RKPG_PRSN_ID, ORIG_PRSN_ID, PRSN_RSN_CD) in (
    select RKPG_PRSN_ID, ORIG_PRSN_ID, PRSN_RSN_CD from CD03501P.H_CM_BAL 
    where PROC_ST_CD like 'C%')
and PROC_ST_CD not like 'X%' and ADDR_TYPE_CD = 'POSTAL'
and 
(
LENGTH(trim(TRANSLATE(
  ADDR_LINE_1_TX,
  '                                                                                            ', 
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ,./\()-#?&;:"[]{}<>+=|~`@!$^' || chr(39)
))) > 0
or
LENGTH(trim(TRANSLATE(
  ADDR_LINE_2_TX,
  '                                                                                            ', 
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ,./\()-#?&;:"[]{}<>+=|~`@!$^' || chr(39)
))) > 0
or
LENGTH(trim(TRANSLATE(
  ADDR_LINE_3_TX,
  '                                                                                            ', 
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ,./\()-#?&;:"[]{}<>+=|~`@!$^' || chr(39)
))) > 0
or
LENGTH(trim(TRANSLATE(
  CITY_NM,
  '                                                                                            ', 
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ,./\()-#?&;:"[]{}<>+=|~`@!$^' || chr(39)
))) > 0)