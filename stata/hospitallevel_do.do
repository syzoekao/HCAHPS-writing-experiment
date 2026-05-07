
global data "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\data_stata"

global data2 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCPHPA"


use "$data\hcahps_all.dta", clear 

clonevar hospitalid=facilityid
replace hospitalid=providerid if hospitalid==""

clonevar date=startdate
replace date=measurestartdate if date==""

sort hospitalid date hcahpsmeasureid
bys hospitalid date hcahpsmeasureid: gen id=_n

keep if id==1
drop id


gen date2 = date(date, "MDY")
format date2 %td

tab date2, gen(did)

gen date_id=.
foreach num of numlist 1(1)23 {
replace date_id=`num' if did`num'==1
}


tab patientsurveystarrating if hcahpsquestion=="Overall hospital rating - star rating"

tab patientsurveystarrating if hcahpsquestion=="Care transition - star rating"

keep if hcahpsquestion=="Nurse communication - star rating" |hcahpsquestion=="Doctor communication - star rating"|hcahpsquestion=="Staff responsiveness - star rating"|hcahpsquestion=="Communication about medicines - star rating"|hcahpsquestion=="Discharge information - star rating"|hcahpsquestion=="Cleanliness - star rating"|hcahpsquestion=="Quietness - star rating"| hcahpsquestion=="Recommend hospital - star rating"|hcahpsquestion=="Care transition - star rating"| hcahpsquestion=="Overall hospital rating - star rating"


keep if date_id==23
*keep if date_id==1 | date_id==23 


keep hospitalid zipcode hcahpsquestion patientsurveystarrating numberofcompletedsurveys


replace patientsurveystarrating="" if patientsurveystarrating=="Not Available"
*drop if patientsurveystarrating=="Not Available"

destring  patientsurveystarrating, replace

encode hcahpsquestion, gen(hcq_num)

tab hcq_num
/*
1=Care transition - star rating	
2=Cleanliness - star rating	
3=Communication about medicines - star ra	
4=Discharge information - star rating	
5=Doctor communication - star rating	
6=Nurse communication - star rating	
7=Overall hospital rating - star rating	
8=Quietness - star rating	
9=Recommend hospital - star rating	
10=Staff responsiveness - star rating	
*/


drop hcahpsquestion

reshape wide patientsurveystarrating , i(hospitalid) j(hcq_num)

foreach var of varlist patientsurveystarrating1- patientsurveystarrating10 numberofcompletedsurveys {
rename `var' `var'_2024
}


save "$data\hcahps2024.dta", replace


use "$data\hcahps_all.dta", clear 

clonevar hospitalid=facilityid
replace hospitalid=providerid if hospitalid==""

clonevar date=startdate
replace date=measurestartdate if date==""

sort hospitalid date hcahpsmeasureid
bys hospitalid date hcahpsmeasureid: gen id=_n

keep if id==1
drop id


gen date2 = date(date, "MDY")
format date2 %td

tab date2, gen(did)

gen date_id=.
foreach num of numlist 1(1)23 {
replace date_id=`num' if did`num'==1
}


tab patientsurveystarrating if hcahpsquestion=="Overall hospital rating - star rating"

tab patientsurveystarrating if hcahpsquestion=="Care transition - star rating"

keep if hcahpsquestion=="Nurse communication - star rating" |hcahpsquestion=="Doctor communication - star rating"|hcahpsquestion=="Staff responsiveness - star rating"|hcahpsquestion=="Communication about medicines - star rating"|hcahpsquestion=="Discharge information - star rating"|hcahpsquestion=="Cleanliness - star rating"|hcahpsquestion=="Quietness - star rating"| hcahpsquestion=="Recommend hospital - star rating"|hcahpsquestion=="Care transition - star rating"| hcahpsquestion=="Overall hospital rating - star rating"


keep if date_id==1
*keep if date_id==1 | date_id==23 


keep hospitalid zipcode hcahpsquestion patientsurveystarrating numberofcompletedsurveys


replace patientsurveystarrating="" if patientsurveystarrating=="Not Available"
*drop if patientsurveystarrating=="Not Available"

destring  patientsurveystarrating, replace

encode hcahpsquestion, gen(hcq_num)

tab hcq_num
/*
1=Care transition - star rating	
2=Cleanliness - star rating	
3=Communication about medicines - star ra	
4=Discharge information - star rating	
5=Doctor communication - star rating	
6=Nurse communication - star rating	
7=Overall hospital rating - star rating	
8=Quietness - star rating	
9=Recommend hospital - star rating	
10=Staff responsiveness - star rating	
*/


drop hcahpsquestion

reshape wide patientsurveystarrating , i(hospitalid) j(hcq_num)

foreach var of varlist patientsurveystarrating1- patientsurveystarrating10 numberofcompletedsurveys {
rename `var' `var'_2017
}


save "$data\hcahps2017.dta", replace





global data "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\data_stata"

global data2 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCPHPA"



use "$data\hcahps2017.dta", clear
merge 1:1 hospitalid using "$data\hcahps2024.dta"
drop _merge 

reg patientsurveystarrating7_2017 patientsurveystarrating1_2017 patientsurveystarrating2_2017 patientsurveystarrating3_2017 patientsurveystarrating4_2017 patientsurveystarrating5_2017 patientsurveystarrating6_2017 patientsurveystarrating8_2017 patientsurveystarrating9_2017 patientsurveystarrating10_2017

reg patientsurveystarrating7_2017 patientsurveystarrating1_2017 patientsurveystarrating2_2017 patientsurveystarrating3_2017 patientsurveystarrating4_2017 patientsurveystarrating5_2017 patientsurveystarrating6_2017 patientsurveystarrating8_2017 patientsurveystarrating10_2017
estimates store t1


reg patientsurveystarrating7_2024 patientsurveystarrating1_2024 patientsurveystarrating2_2024 patientsurveystarrating3_2024 patientsurveystarrating4_2024 patientsurveystarrating5_2024 patientsurveystarrating6_2024 patientsurveystarrating8_2024 patientsurveystarrating9_2024 patientsurveystarrating10_2024

reg patientsurveystarrating7_2024 patientsurveystarrating1_2024 patientsurveystarrating2_2024 patientsurveystarrating3_2024 patientsurveystarrating4_2024 patientsurveystarrating5_2024 patientsurveystarrating6_2024 patientsurveystarrating8_2024  patientsurveystarrating10_2024

estimates store t2

*estout t1 t2  using "$data\s1.txt",  cells(b(star fmt(3)) se(par fmt(3))) stats(N r2, fmt(0 3)) starlevels(** 0.05 *** 0.01)




global data0 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\hospital general information data"

clonevar facilityid=hospitalid

merge m:1 facilityid using "$data0\generalinfo.dta"
drop if _merge==2
drop _merge 

merge m:1 facilityid using "$data0\timeliness.dta"
drop if _merge==2
drop _merge 

rename score time_duringER2024



global data8 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\hospital general information data 2017"

merge m:1 facilityid using "$data8\timeliness2017.dta"
drop if _merge==2
drop _merge 

rename score2017 time_duringER2017 





clonevar zip5=zipcode


*keep zip5 patientsurveystarrating date2 date_id numberofcompletedsurveys hospitalid hospitaltype- time_duringER 

replace numberofcompletedsurveys_2017="" if numberofcompletedsurveys_2017=="Not Available"
destring numberofcompletedsurveys_2017, replace

replace numberofcompletedsurveys_2024="" if numberofcompletedsurveys_2024=="Not Available"
destring numberofcompletedsurveys_2024, replace


merge m:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 

rename county fips_county
destring fips_county, replace

global data3 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\CDC_PLACES\diseaseburden"

global data4 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\CMS Provider of Services File\ttlhosp_data"

merge m:1 fips_county using "$data3\diseaseburden2019to2023.dta"
drop _merge 
merge m:1 fips_county using "$data4\ttlhosp_20172024.dta"
drop _merge 
drop ttl_hosp2018-ttl_hosp2023


global data5 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\IPUMS\ACS v2\created_data"

merge m:1 fips_county using  "$data5\acsdata_mostrecent2024.dta"
drop _merge 

drop name
foreach var of varlist pop- income_pca {
	rename `var' `var'2024
}

merge m:1 fips_county using  "$data5\acsdata_mostrecent2017.dta"
drop _merge 

drop name
foreach var of varlist pop- income_pca {
	rename `var' `var'2017
}




global data6 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\zip_RUCA_crosswalk"

*clonevar zipcode=zip5
merge m:1 zipcode using "$data6\zip_ruca.dta"
drop if _merge==2
drop _merge 

gen rural_urban=1 if primaryruca<=3
replace rural_urban=2 if primaryruca>=4 & primaryruca<=6
replace rural_urban=3 if primaryruca>=7 & primaryruca<=10
/*1, 2, 3: Urban
4, 5, 6: Large Rural (Micropolitan)
7, 8, 9, 10: Small Rural / Isolated Rural*/


gen numhops_perpop2024=ttl_hosp2024/pop2024
gen numhops_per1000pop2024=(ttl_hosp2024/pop2024)*1000

gen numhops_perpop2017=ttl_hosp2017/pop2017
gen numhops_per1000pop2017=(ttl_hosp2017/pop2017)*1000



tab hospitaltype, gen(hosptype)
tab hospitalownership, gen(hosp_owner)

*1=government; 2=non profit; 3=for profit
gen hosp_owner_c=1 if hosp_owner1==1 |hosp_owner2==1 | hosp_owner3==1 | hosp_owner4==1|hosp_owner5==1|hosp_owner8==1|hosp_owner9==1
replace hosp_owner_c=2 if hosp_owner6==1 |hosp_owner7==1 
replace hosp_owner_c=3 if hosp_owner10==1 |hosp_owner11==1 |hosp_owner12==1 

replace time_duringER2017="" if time_duringER2017=="Not Available"
destring time_duringER2017, replace


replace time_duringER2024="" if time_duringER2024=="Not Available"
destring time_duringER2024, replace


global data7 "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\hospital cost report"

merge m:1 facilityid using "$data7\numbers_costs_beds.dta"
drop _merge 

gen nurse_perbed= nurse_salary/ num_beds




gen change_rating=patientsurveystarrating7_2024-patientsurveystarrating7_2017


foreach num of numlist 1(1)6 8 10 {
gen change_rating`num'=patientsurveystarrating`num'_2024-patientsurveystarrating`num'_2017
}



gen change_time_duringER=time_duringER2024-time_duringER2017

gen change_numhops_per1000pop=numhops_per1000pop2024-numhops_per1000pop2017

gen change_poorhealth=poorhealth_2023-poorhealth_2019

gen change_pop=pop2024-pop2017

gen change_prop_65andup=prop_65andup2024-prop_65andup2017

gen change_prop_white2024=prop_white2024-prop_white2017
gen change_prop_black2024=prop_black2024-prop_black2017
gen change_prop_hispanic2024=prop_hispanic2024-prop_hispanic2017
gen change_prop_foreign2024=prop_foreign2024-prop_foreign2017
gen change_prop_higheduc2024=prop_higheduc2024-prop_higheduc2017

gen change_prop_poor2024=prop_poor2024-prop_poor2017
gen change_prop_poor_65andup2024=prop_poor_65andup2024-prop_poor_65andup2017
gen change_income_medianhh=income_medianhh2024-income_medianhh2017

gen sample=1
foreach var of varlist patientsurveystarrating7_2024  hosp_owner_c time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 rural_urban patientsurveystarrating7_2017  time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 {
replace sample=0 if `var'==.
}



*summary stats 

*dependent var
sum patientsurveystarrating7_2024 patientsurveystarrating7_2017 change_rating if sample==1 

bys hosp_owner_c: sum patientsurveystarrating7_2024 patientsurveystarrating7_2017 change_rating if sample==1 


bys rural_urban: sum patientsurveystarrating7_2024 patientsurveystarrating7_2017 change_rating if sample==1 





*independent var 
tab hosp_owner_c if sample==1 
tab rural_urban if sample==1

sum  nurse_perbed  if sample==1 & nurse_perbed>0

sum time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 if sample==1

sum time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if sample==1



**regression 

*2024

reg patientsurveystarrating7_2024  i.hosp_owner_c time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 i.rural_urban if sample==1, robust

estimates store t1

*reg patientsurveystarrating7_2024  i.hosp_owner_c time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 i.rural_urban patientsurveystarrating1_2024  patientsurveystarrating6_2024  if sample==1, robust


reg patientsurveystarrating7_2024 patientsurveystarrating1_2024 patientsurveystarrating2_2024 patientsurveystarrating3_2024 patientsurveystarrating4_2024 patientsurveystarrating5_2024 patientsurveystarrating6_2024 patientsurveystarrating8_2024 patientsurveystarrating10_2024 i.hosp_owner_c time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 i.rural_urban if sample==1, robust

estimates store t2


*2017
reg patientsurveystarrating7_2017  i.hosp_owner_c time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 i.rural_urban if sample==1, robust

estimates store t3

reg patientsurveystarrating7_2017 patientsurveystarrating1_2017 patientsurveystarrating2_2017 patientsurveystarrating3_2017 patientsurveystarrating4_2017 patientsurveystarrating5_2017 patientsurveystarrating6_2017 patientsurveystarrating8_2017 patientsurveystarrating10_2017  i.hosp_owner_c time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 i.rural_urban if sample==1, robust

estimates store t4

*change
reg change_rating i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban if sample==1, robust

estimates store t5


reg change_rating i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if sample==1, robust


estimates store t6

reg change_rating i.hosp_owner_c change_rating1 change_rating2 change_rating3 change_rating4 change_rating5 change_rating6 change_rating8 change_rating10  change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban patientsurveystarrating1_2017 patientsurveystarrating2_2017 patientsurveystarrating3_2017 patientsurveystarrating4_2017 patientsurveystarrating5_2017 patientsurveystarrating6_2017 patientsurveystarrating8_2017 patientsurveystarrating10_2017 time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if sample==1, robust


estimates store t7




estout t1 t2 t3 t4 t5 t6 t7 using "$data\t2.txt",  cells(b(star fmt(3)) se(par fmt(3))) stats(N r2, fmt(0 3)) starlevels(** 0.05 *** 0.01)


**Sub group

reg change_rating i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if rural_urban==1 & sample==1, robust


estimates store t5



reg change_rating i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if rural_urban==2 & sample==1, robust


estimates store t6


reg change_rating i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if rural_urban==3 & sample==1, robust


estimates store t7



reg change_rating change_rating1 change_rating2 change_rating3 change_rating4 change_rating5 change_rating6 change_rating8 change_rating10 i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if rural_urban==3 & sample==1, robust

estimates store t8



estout t1 t2 t3 t4 t5 t6 t7 t8 using "$data\t3.txt",  cells(b(star fmt(3)) se(par fmt(3))) stats(N r2, fmt(0 3)) starlevels(** 0.05 *** 0.01)


*****with number of nurse (salary) per bed: nurse_perbed


*2024

reg patientsurveystarrating7_2024  i.hosp_owner_c nurse_perbed  time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 i.rural_urban if sample==1, robust



*2017
reg patientsurveystarrating7_2017  i.hosp_owner_c nurse_perbed time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 i.rural_urban if sample==1, robust

estimates store t2

reg patientsurveystarrating7_2024 patientsurveystarrating1_2024 patientsurveystarrating2_2024 patientsurveystarrating3_2024 patientsurveystarrating4_2024 patientsurveystarrating5_2024 patientsurveystarrating6_2024 patientsurveystarrating8_2024 patientsurveystarrating10_2024 i.hosp_owner_c nurse_perbed time_duringER2024 numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 i.rural_urban, robust


*change 


reg change_rating i.hosp_owner_c change_time_duringER change_numhops_per1000pop change_poorhealth change_pop change_prop_65andup change_prop_white2024 change_prop_black2024 change_prop_hispanic2024 change_prop_foreign2024 change_prop_higheduc2024 change_prop_poor2024 change_prop_poor_65andup2024 change_income_medianhh i.rural_urban time_duringER2017 nurse_perbed  numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 if sample==1, robust




/*

reg patientsurveystarrating7_2017  i.hosp_owner_c time_duringER2017 numhops_per1000pop2017  poorhealth_2019 pop2017 prop_65andup2017 prop_white2017 prop_black2017 prop_hispanic2017 prop_foreign2017 prop_higheduc2017 prop_poor2017 prop_poor_65andup2017 income_medianhh2017 i.rural_urban, robust


















reg patientsurveystarrating i.hosp_owner_c time_duringER numhops_per1000pop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 i.rural_urban, robust

stop

reg patientsurveystarrating23 hosptype* hosp_owner* score numhops_perpop2024  poorhealth_2023 pop2024 prop_65andup2024 prop_white2024 prop_black2024 prop_hispanic2024 prop_foreign2024 prop_higheduc2024 prop_poor2024 prop_poor_65andup2024 income_medianhh2024 [aw=numberofcompletedsurveys23], robust



