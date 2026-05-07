clear all

global data "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\IPUMS\ACS v2\created_data"

import delimited "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\IPUMS\ACS v2\nhgis0003_ts_nominal_county nolabel.csv", varnames(1) 

gen pop=av0aa

gen pop65andup=b57ap+b57aq+b57ar

gen pop_white=b18aa
gen pop_black=b18ab
gen pop_asian=b18ad
gen pop_hispanic=a35aa

gen pop_foreignborn=at5ab

gen pop_educ_bachelorup=b87af+b87ag



gen pop_poor=cl6aa
gen pop_poor_65andup=bv8aa


gen prop_65andup=pop65andup/pop

gen prop_white=pop_white/pop
gen prop_black=pop_black/pop
gen prop_asian=pop_asian/pop
gen prop_hispanic=pop_asian/pop

gen prop_foreign=pop_foreignborn/pop

gen prop_higheduc=pop_educ_bachelorup/pop

gen prop_poor=pop_poor/pop
gen prop_poor_65andup=pop_poor_65andup/pop65andup


gen income_medianhh=bd5aa
gen income_pca=bd5aa


keep gisjoin year state statefp county countyfp name pop prop_65andup- income_pca


gen fips=statefp*1000+countyfp

sort fips year

encode year, gen(year_id)



keep fips name year_id pop prop_65andup- income_pca

/*
  2013-2017 |      3,220       12.50       12.50
  2014-2018 |      3,220       12.50       24.99
  2015-2019 |      3,220       12.50       37.49
  2016-2020 |      3,221       12.50       49.99
  2017-2021 |      3,221       12.50       62.49
  2018-2022 |      3,222       12.50       74.99
  2019-2023 |      3,222       12.50       87.50
  2020-2024 |      3,222       12.50      100.00
*/


save "$data\acsdata_all.dta", replace 

keep if year_id==8

drop year_id

rename fips fips_county

save "$data\acsdata_mostrecent2024.dta", replace 

use "$data\acsdata_all.dta", clear 

keep if year_id==1

drop year_id

rename fips fips_county

save "$data\acsdata_mostrecent2017.dta", replace 




stop

***base in 2017

keep if year_id==1
drop year_id

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"


clonevar county=fips

maptile prop_white, geo(county2014) twopt(title("%White, 2017")) fcolor(Reds) 

maptile prop_foreign, geo(county2014) twopt(title("%Foreign born, 2017")) fcolor(Reds) 

maptile prop_poor, geo(county2014) twopt(title("%Poor, 2017")) fcolor(Reds) 

maptile prop_higheduc, geo(county2014) twopt(title("%Bachelor or above, 2017")) fcolor(Blues) 


****difference 

keep if year_id==1 | year_id==8

foreach var of varlist prop_65andup- income_pca {

sort fips year_id
bys fips: gen diff_`var'=`var'-`var'[_n-1]

}


keep if year_id==8



clonevar county=fips

maptile diff_prop_white, geo(county2014) twopt(title("Difference in %White, 2017-2024")) fcolor(RdBu) cutvalues(-0.2 -0.03 0 0.1)

maptile diff_prop_foreign, geo(county2014) twopt(title("Difference in %Foreign born, 2017-2024")) fcolor(RdBu) 

maptile diff_prop_poor, geo(county2014) twopt(title("Difference in %Poor, 2017-2024")) fcolor(BuRd) cutvalues(-0.05 -0.01 0 0.01)

maptile diff_prop_higheduc, geo(county2014) twopt(title("Difference in %Bachelor or above, 2017-2024")) fcolor(RdBu) cutvalues(-0.05 -0.01 0 0.05)


