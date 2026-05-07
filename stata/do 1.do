
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

keep if hcahpsquestion=="Overall hospital rating - star rating"

sort hospitalid date_id 

drop if patientsurveystarrating=="Not Available"

destring  patientsurveystarrating, replace



clonevar zip5=zipcode


keep zip5 patientsurveystarrating date2 date_id numberofcompletedsurveys

replace numberofcompletedsurveys="" if numberofcompletedsurveys=="Not Available"
destring numberofcompletedsurveys, replace

save "$data\rating_allyears.dta", replace
stop


**difference between 2017 and 2024
**all years
use "$data\rating_allyears.dta", clear

collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5 date_id)

keep if date_id==1 | date_id==23

sort zip5 date_id
bys zip5: gen dif_score=patientsurveystarrating-patientsurveystarrating[_n-1]

keep if dif_score~=.

merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 dif_score zip county
rename county county1


merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 dif_score zip county1 county
rename county county2

merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 dif_score zip county1 county2 county
rename county county3

merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 dif_score zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 dif_score county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 dif_score county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 dif_score county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 dif_score county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep dif_score county 
destring county, replace

collapse dif_score, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile dif_score, geo(county2014) twopt(title("Difference in patient star rating, 2017-2024")) fcolor(RdBu) cutvalues(-1 -0.33 0 0.5)



**map each year  
*date_id: 1, 4, 8, 9, 11, 15, 19, 23

****************************************
use "$data\rating_allyears.dta", clear

keep if date_id==1

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2017")) fcolor(Reds)


****************************



use "$data\rating_allyears.dta", clear

keep if date_id==4

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2018")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)



****************************



use "$data\rating_allyears.dta", clear

keep if date_id==8

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2019")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)




****************************



use "$data\rating_allyears.dta", clear

keep if date_id==9

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2020")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)


***********************************************

use "$data\rating_allyears.dta", clear

keep if date_id==11

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2021")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)




***********************************************

use "$data\rating_allyears.dta", clear

keep if date_id==15

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2022")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)


***********************************************

use "$data\rating_allyears.dta", clear

keep if date_id==19

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2023")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)




***********************************************
global data "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\data_stata"

use "$data\rating_allyears.dta", clear

keep if date_id==23

*collapse patientsurveystarrating, by(zip5)
collapse (mean) patientsurveystarrating [aw = numberofcompletedsurveys], by(zip5)


merge 1:1 zip5 using "$data2\zip_county3_id1.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county
rename county county1

merge 1:1 zip5 using "$data2\zip_county3_id2.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county
rename county county2


merge 1:1 zip5 using "$data2\zip_county3_id3.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county
rename county county3


merge 1:1 zip5 using "$data2\zip_county3_id4.dta"
keep if _merge==1 | _merge==3 
drop _merge 
keep zip5 patientsurveystarrating zip county1 county2 county3 county
rename county county4

save "$data\c4.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county1 
drop if county1==""
save "$data\c41.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county2
drop if county2==""
save "$data\c42.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county3
drop if county3==""
save "$data\c43.dta", replace

use "$data\c4.dta", clear 
keep zip5 patientsurveystarrating county4
drop if county4==""
save "$data\c44.dta", replace

use "$data\c41.dta"
append using "$data\c42.dta"
append using "$data\c43.dta"
append using "$data\c44.dta"

gen county=county1 
replace county=county2 if county==""
replace county=county3 if county==""
replace county=county4 if county==""

keep patientsurveystarrating county 
destring county, replace

collapse patientsurveystarrating, by(county)

maptile_install using "http://files.michaelstepner.com/geo_county2014.zip"

maptile patientsurveystarrating, geo(county2014) twopt(title("Patient satisfaction rating, 2024")) fcolor(Reds) cutvalues(2.83 3.18 3.49 3.78 4.08)



