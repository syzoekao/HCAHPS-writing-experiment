clear all
global data "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\hospital general information data"


import delimited "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\hospital general information data\Hospital_General_Information.csv"


keep facilityid hospitaltype hospitalownership emergencyservices


save "$data\generalinfo.dta", replace


clear all
import delimited "C:\Users\z0055u8k\OneDrive - Siemens Healthineers\Patient Experience\HCAHPS research\hospital general information data\Timely_and_Effective_Care-Hospital.csv", stringcols(1)


tab score if measurename=="Average (median) time all patients spent in the emergency department before leaving from the visit, including psychiatric/mental health patients and patients who were transferred to another facility. A lower number of minutes is better"

keep facilityid score measurename 

keep if measurename=="Average (median) time all patients spent in the emergency department before leaving from the visit, including psychiatric/mental health patients and patients who were transferred to another facility. A lower number of minutes is better"


save "$data\timeliness.dta", replace
