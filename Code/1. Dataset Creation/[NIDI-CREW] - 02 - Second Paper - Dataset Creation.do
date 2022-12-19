/*____/\\\\\\\\\\\___  __/\\\________/\\\_  _____/\\\\\\\\\____  ____/\\\\\\\\\_____  __/\\\\\\\\\\\\\\\_             
* ___/\\\/////////\\\_  _\/\\\_______\/\\\_  ___/\\\\\\\\\\\\\__  __/\\\///////\\\___  _\/\\\///////////__            
*  __\//\\\______\///__  _\/\\\_______\/\\\_  __/\\\/////////\\\_  _\/\\\_____\/\\\___  _\/\\\_____________           
*   ___\////\\\_________  _\/\\\\\\\\\\\\\\\_  _\/\\\_______\/\\\_  _\/\\\\\\\\\\\/____  _\/\\\\\\\\\\\_____          
*    ______\////\\\______  _\/\\\/////////\\\_  _\/\\\\\\\\\\\\\\\_  _\/\\\//////\\\____  _\/\\\///////______         
*     _________\////\\\___  _\/\\\_______\/\\\_  _\/\\\/////////\\\_  _\/\\\____\//\\\___  _\/\\\_____________        
*      __/\\\______\//\\\__  _\/\\\_______\/\\\_  _\/\\\_______\/\\\_  _\/\\\_____\//\\\__  _\/\\\_____________       
*       _\///\\\\\\\\\\\/___  _\/\\\_______\/\\\_  _\/\\\_______\/\\\_  _\/\\\______\//\\\_  _\/\\\\\\\\\\\\\\\_      
*        ___\///////////_____  _\///________\///__  _\///________\///__  _\///________\///__  _\///////////////__     
*                                       __                       _                            _  _           _        
*                                      (_     __    _  \/    _ _|_   |_| _  _  | _|_|_       |_|(_| _  o __ (_|       
*                                      __)|_| | \_/(/_ /    (_) |    | |(/_(_| |  |_| | /    | |__|(/_ | | |__|       
*                                                   _                                         __          _           
*                                       _ __  _|   |_) _ _|_ o  __ _ __  _ __ _|_    o __    |_     __ _ |_) _        
*                                      (_|| |(_|   | \(/_ |_ |  | (/_|||(/_| | |_    | | |   |__|_| | (_)|  (/_*/       
*
*
*	SHARE Release 7.0.0
*
*	Uccheddu, Damiano, Anne H. Gauthier, Nardi Steverink, and Tom Emery. ‘The Pains and Reliefs of the Transitions 
*	into and out of Spousal Caregiving. A Cross-National Comparison of the Health Consequences of Caregiving by Gender’. 
*	Social Science & Medicine 240 (1 November 2019): 112517. https://doi.org/10.1016/j.socscimed.2019.112517.


******************************************************************************************************************

		//Index\\
*----	[  1. Open the log file ]--------------------------------------------------------------------------------*
*----	[  2. Extract & Recode Variables from technical_variables ]----------------------------------------------*
*----	[  3. Extract & Recode Variables from PH ]---------------------------------------------------------------*
*----	[  4. Extract & Recode Variables from MH ]---------------------------------------------------------------*
*----	[  5. Extract & Recode Variables from BR ]---------------------------------------------------------------*
*----	[  6. Extract & Recode Variables from GV_Health]---------------------------------------------------------*
*----	[  7. Extract & Recode Variables from CV_R ]-------------------------------------------------------------*
*----	[  8. Extract & Recode Variables from GV_Imputations ]---------------------------------------------------*
*----	[  9. Extract & Recode Variables from DN ]---------------------------------------------------------------*
*----	[ 10. Extract & Recode Variables from SP ]---------------------------------------------------------------*
*----	[ 11. Extract & Recode Variables from SN ]---------------------------------------------------------------*
*----	[ 12. Merge modules per wave ]---------------------------------------------------------------------------*
*----	[ 13. Append waves to panel long format ]----------------------------------------------------------------*
*----	[ 14. Fix & (re)generate variables, labels, etc. FINAL SAVE ]--------------------------------------------*


******************************************************************************************************************

*----	[  1. Open the log file ]--------------------------------------------------------------------------------*

log using "$share_logfile/Data Creation.log", replace


*----	[  2. Extract & Recode Variables from technical_variables ]----------------------------------------------*

*>>	WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_technical_variables.dta", clear 	// Open the dataset
gen wave=1															// Create wave id 

*	Keep only variables of interest
keep 		///
mn005_ 		/// 
wave 		/// Wave number
mergeid 	/// Personal identifier
hhid1 		/// Household identifier (wave 1)
mergeidp1	/// Partner identifier (wave 1)  
coupleid1	//  Couple identifier (wave 1)   

*	Dataset Save
save "$share_w1_out/sharew1_technical_variables.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew1_technical_variables.xls", replace


*>>	WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_technical_variables.dta", clear 	// Open the dataset
gen wave=2															// Create wave id 

*	Keep only variables of interest
keep		///
mn005_		/// 
wave		/// Wave number
mergeid		/// Personal identifier
hhid2		/// Household identifier (wave 2)
mergeidp2	/// Partner identifier (wave 2)  
coupleid2	//  Couple identifier (wave 2)   

*	Dataset Save
save "$share_w2_out/sharew2_technical_variables.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew2_technical_variables.xls", replace


*>>	WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_technical_variables.dta", clear 	// Open the dataset
gen wave=4															// Create wave id 

*	Keep only variables of interest
keep 		///
mn005_ 		/// 
wave 		/// Wave number
mergeid 	/// Personal identifier
hhid4	 	/// Household identifier (wave 4)
mergeidp4 	/// Partner identifier (wave 4)  
coupleid4 	// Couple identifier (wave 4)   

*	Dataset Save
save "$share_w4_out/sharew4_technical_variables.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew4_technical_variables.xls", replace


*>>	WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_technical_variables.dta", clear 	// Open the dataset
gen wave=5											// Create wave id 

*	Keep only variables of interest
keep 		///
mn005_ 		/// 
wave 		/// Wave number
mergeid 	/// Personal identifier
hhid5	  	/// Household identifier (wave 5)
mergeidp5  	/// Partner identifier (wave 5)  
coupleid5  	// Couple identifier (wave 5)   

*	Dataset Save
save "$share_w5_out/sharew5_technical_variables.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew5_technical_variables.xls", replace


*>>	WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_technical_variables.dta", clear 	// Open the dataset
gen wave=6															// Create wave id 

*	Keep only variables of interest
keep 		///
mn005_ 		/// 
wave 		/// Wave number
mergeid 	/// Personal identifier
hhid6	   /// Household identifier (wave 6)
mergeidp6   /// Partner identifier (wave 6)  
coupleid6   // Couple identifier (wave 6)   

*	Dataset Save
save "$share_w6_out/sharew6_technical_variables.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew6_technical_variables.xls", replace

*>>	WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_technical_variables.dta", clear 	// Open the dataset
gen wave=7											// Create wave id 

*	Keep only variables of interest
keep 		///
mn005_ 		/// 
wave 		/// Wave number
mergeid 	/// Personal identifier
hhid7	   /// Household identifier (wave 7)
mergeidp7   /// Partner identifier (wave 7)  
coupleid7   // Couple identifier (wave 7)   

*	Dataset Save
save "$share_w7_out/sharew7_technical_variables.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew7_technical_variables.xls", replace



*----	[  3. Extract & Recode Variables from PH ]---------------------------------------------------------------*

*>>	WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_ph.dta", clear 	// Open the dataset
gen wave=1											// Create wave id 

*	Self-report of health variable (SRH)
*	wave 1 respondent self-report of health, creation of new variable
gen srh =.
replace srh = 1 if ph003_==1 | ph052_==1 // merging the EU version of the variable with the US version
replace srh = 2 if ph003_==2 | ph052_==2
replace srh = 3 if ph003_==3 | ph052_==3
replace srh = 4 if ph003_==4 | ph052_==4
replace srh = 5 if ph003_==5 | ph052_==5

* 	Defining the label 
label define lab_health ///
   1 "1.Excellent"  	///
   2 "2.Very good" 		///
   3 "3.Good"			///
   4 "4.Fair"			///
   5 "5.Poor"	

* 	Label creation for SRH 
label variable srh "Self-report of health"
label values srh lab_health

*	Keep only variables of interest
keep				///
srh					/// Self-report of health 
ph049d3				/// Difficulties: bathing or showering
ph049d1				/// Difficulties: dressing, including shoes and socks
ph048d3				/// Difficulties: getting up from chair
ph049d2				/// Difficulties: walking across a room
ph049d4				/// Difficulties: eating, cutting up food
ph048d7				/// Difficulties: reaching or extending arms above shoulder
ph049d6				/// Difficulties: using the toilet, incl getting up or down
ph048d5				/// Difficulties: climbing one flight of stairs
ph048d9				/// Difficulties: lifting or carrying weights over 5 kilos
ph049d9				/// Difficulties: shopping for groceries
ph049d10			/// Difficulties: telephone calls
ph049d12			/// Difficulties: doing work around the house or garden
ph049d8				/// Difficulties: preparing a hot meal
ph049d11			/// Difficulties: taking medications
ph049d13			/// Difficulties: managing money
ph048d1				/// Difficulties: walking 100 metres
ph049d5				/// Difficulties: getting in or out of bed
ph049d7				///
ph004_ ph005_		/// Long-term illness
ph006d2				/// Doctor told you had: high blood pressure or hypertension
ph006d1				/// Doctor told you had: heart attack
ph006d4				/// Doctor told you had: stroke
ph006d10			/// Doctor told you had: cancer
ph006d5				/// Doctor told you had: diabetes or high blood sugar
ph006d8				/// Doctor told you had: arthritis
ph006d6				/// Doctor told you had: chronic lung disease
ph006d9				/// Doctor told you had: osteoporosis
ph006d14			/// Doctor told you had: hip fracture or femoral fracture
ph006d12			/// Doctor told you had: Parkinson disease
ph010d3				/// Bothered by: breathlessness
ph010d7				/// Bothered by: falling down
ph010d8				/// Bothered by: fear of falling down
ph010d9				/// Bothered by: dizziness, faints or blackouts
ph043_				/// Eyesight distance
ph044_				/// Eyesight reading
ph046_				/// Hearing
ph012_				/// Weight of respondent
ph013_				/// Height (How tall are you?)
wave				/// Wave number
mergeid				/// Personal identifier
hhid1				/// Household identifier (wave 1)
mergeidp1			/// Partner identifier (wave 1)  
coupleid1			// Couple identifier (wave 1)


*	Dataset Save
save "$share_w1_out/sharew1_ph.dta", replace 

*	Codebook creation -> you can check comparability using Microsoft Spreadsheet Compare 
codebookout "$codebook/sharew1_ph.xls", replace

*>>	WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_ph.dta", clear 	// Open the dataset
gen wave=2											// Create wave id 

*	wave 2 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5
label variable srh "Self-report of health"
label values srh lab_health

*	Recode: "Registered or legally blind" --> POOR Eyesight
recode ph043_ (6=5)
recode ph044_ (6=5)

*	Personal identifier & keep variables
keep 			///
srh 			///
ph049d3 		/// Difficulties: bathing or showering
ph049d1 		/// Difficulties: dressing, including shoes and socks
ph048d3 		/// Difficulties: getting up from chair
ph049d2 		/// Difficulties: walking across a room
ph049d4 		/// Difficulties: eating, cutting up food
ph048d7 		/// Difficulties: reaching or extending arms above shoulder
ph049d6 		/// Difficulties: using the toilet, incl getting up or down
ph048d5 		/// Difficulties: climbing one flight of stairs
ph048d9 		/// Difficulties: lifting or carrying weights over 5 kilos
ph049d10		/// Difficulties: telephone calls
ph049d9 		/// Difficulties: shopping for groceries
ph049d10		/// Difficulties: telephone calls
ph049d12		/// Difficulties: doing work around the house or garden
ph049d8 		/// Difficulties: preparing a hot meal
ph049d11		/// Difficulties: taking medications
ph049d13		/// Difficulties: managing money
ph048d1 		/// Difficulties: walking 100 metres
ph049d5 		/// Difficulties: getting in or out of bed
ph049d7 		/// 
ph004_ ph005_ 	/// Long-term illness
ph006d2  		/// Doctor told you had: high blood pressure or hypertension
ph006d1  		/// Doctor told you had: heart attack
ph006d4  		/// Doctor told you had: stroke
ph006d10 		/// Doctor told you had: cancer
ph006d5  		/// Doctor told you had: diabetes or high blood sugar
ph006d8  		/// Doctor told you had: arthritis
ph006d6  		/// Doctor told you had: chronic lung disease
ph006d9  		/// Doctor told you had: osteoporosis
ph006d14 		/// Doctor told you had: hip fracture or femoral fracture
ph006d12		/// Doctor told you had: Parkinson disease
ph010d3  		/// Bothered by: breathlessness
ph010d7  		/// Bothered by: falling down
ph010d8  		/// Bothered by: fear of falling down
ph010d9  		/// Bothered by: dizziness, faints or blackouts
ph043_ 			/// Eyesight distance
ph044_ 			/// Eyesight reading
ph046_ 			/// Hearing
ph012_	  		/// Weight of respondent
ph013_ 			/// Height (How tall are you?)
wave 			///
mergeid 		///
hhid2	   		/// Household identifier (wave 2)
mergeidp2   	/// Partner identifier (wave 2)  
coupleid2   	//  Couple identifier (wave 2)   
	
*	Save
save "$share_w2_out/sharew2_ph.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_ph.xls", replace


*>>	WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_ph.dta", clear 	// Open the dataset 
gen wave=4											// Create wave id 

*	wave 4 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5
label variable srh "Self-report of health"
label values srh lab_health

*	Personal identifier & keep variables	
keep 			///
srh 			///
ph049d3 		/// Difficulties: bathing or showering
ph049d1 		/// Difficulties: dressing, including shoes and socks
ph048d3 		/// Difficulties: getting up from chair
ph049d2 		/// Difficulties: walking across a room
ph049d4 		/// Difficulties: eating, cutting up food
ph048d7 		/// Difficulties: reaching or extending arms above shoulder
ph049d6 		/// Difficulties: using the toilet, incl getting up or down
ph048d5 		/// Difficulties: climbing one flight of stairs
ph048d9 		/// Difficulties: lifting or carrying weights over 5 kilos
ph049d9 		/// Difficulties: shopping for groceries
ph049d10		/// Difficulties: telephone calls
ph049d12		/// Difficulties: doing work around the house or garden
ph049d8 		/// Difficulties: preparing a hot meal
ph049d11		/// Difficulties: taking medications
ph049d13		/// Difficulties: managing money
ph048d1 		/// Difficulties: walking 100 metres
ph049d5 		/// Difficulties: getting in or out of bed
ph049d7 		/// 
ph004_ ph005_ 	/// Long-term illness
ph006d2  		/// Doctor told you had: high blood pressure or hypertension
ph006d1  		/// Doctor told you had: heart attack
ph006d4  		/// Doctor told you had: stroke
ph006d10 		/// Doctor told you had: cancer
ph006d5  		/// Doctor told you had: diabetes or high blood sugar
ph006d8  		/// Doctor told you had: arthritis
ph006d6  		/// Doctor told you had: chronic lung disease
ph006d9  		/// Doctor told you had: osteoporosis
ph006d14 		/// Doctor told you had: hip fracture or femoral fracture
ph006d12		/// Doctor told you had: Parkinson disease
ph010d3  		/// Bothered by: breathlessness
ph010d7  		/// Bothered by: falling down
ph010d8  		/// Bothered by: fear of falling down
ph010d9  		/// Bothered by: dizziness, faints or blackouts
ph043_ 			/// Eyesight distance
ph044_ 			/// Eyesight reading
ph046_ 			/// Hearing
ph012_	  		/// Weight of respondent
ph013_ 			/// Height (How tall are you?)
wave 			///
mergeid 		///
hhid4	   		/// Household identifier (wave 4)
mergeidp4   	/// Partner identifier (wave 4)  
coupleid4  		//  Couple identifier (wave 4)   
	
*	Save
save "$share_w4_out/sharew4_ph.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_ph.xls", replace


*>>	WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_ph.dta", clear 	// Open the dataset 
gen wave=5											// Create wave id 

*	wave 5 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5
label variable srh "Self-report of health"
label values srh lab_health


/* Starting in Wave 5, respondents are asked if they have ever had rheumatoid arthritis (ph006d19) or
osteoarthritis/other rheumatism (ph006d20) as separate questions. FI_arthritis is coded as 1 if the respondent
indicates having had at least one of the conditions. */

tab ph006d19, miss // Doctor told you had: rheumatoid arthritis
tab ph006d20, miss // Doctor told you had: osteoarthritis/other rheumatism


*	Variable harmonization
gen ph006d8 = . 
replace ph006d8 = 0 if ph006d19==0 | ph006d20==0
replace ph006d8 = 1 if ph006d19==1 | ph006d20==1

/* We can use ph011d11 (Drugs for: osteoporosis) as a proxy for ph006d9 (Doctor told you had: osteoporosis)
because the question is not asked starting from wave 5 */

rename ph011d11 ph006d9

*	Same variables, different names: 
rename ph089d1 ph010d7
rename ph089d2 ph010d8
rename ph089d3 ph010d9

*	Personal identifier & keep variables
keep 			///
srh 			///
ph049d3 		/// Difficulties: bathing or showering
ph049d1 		/// Difficulties: dressing, including shoes and socks
ph048d3 		/// Difficulties: getting up from chair
ph049d2 		/// Difficulties: walking across a room
ph049d4 		/// Difficulties: eating, cutting up food
ph048d7 		/// Difficulties: reaching or extending arms above shoulder
ph049d6 		/// Difficulties: using the toilet, incl getting up or down
ph048d5 		/// Difficulties: climbing one flight of stairs
ph048d9 		/// Difficulties: lifting or carrying weights over 5 kilos
ph049d9 		/// Difficulties: shopping for groceries
ph049d10		/// Difficulties: telephone calls
ph049d12		/// Difficulties: doing work around the house or garden
ph049d8 		/// Difficulties: preparing a hot meal
ph049d11		/// Difficulties: taking medications
ph049d13		/// Difficulties: managing money
ph048d1 		/// Difficulties: walking 100 metres
ph049d5 		/// Difficulties: getting in or out of bed
ph049d7 		/// 
ph004_ ph005_ 	/// Long-term illness
ph006d2  		/// Doctor told you had: high blood pressure or hypertension
ph006d1  		/// Doctor told you had: heart attack
ph006d4  		/// Doctor told you had: stroke
ph006d10 		/// Doctor told you had: cancer
ph006d5  		/// Doctor told you had: diabetes or high blood sugar
ph006d8  		/// Doctor told you had: arthritis
ph006d6  		/// Doctor told you had: chronic lung disease
ph006d9  		/// Doctor told you had: osteoporosis
ph006d14 		/// Doctor told you had: hip fracture or femoral fracture
ph006d12		/// Doctor told you had: Parkinson disease
ph010d7  		/// Bothered by: falling down
ph010d8  		/// Bothered by: fear of falling down
ph010d9  		/// Bothered by: dizziness, faints or blackouts
ph043_ 			/// Eyesight distance
ph044_ 			/// Eyesight reading
ph046_ 			/// Hearing
ph012_	  		/// Weight of respondent
ph013_ 			/// Height (How tall are you?)
wave 			///
mergeid 		///
hhid5	  		/// Household identifier (wave 5)
mergeidp5  		/// Partner identifier (wave 5)  
coupleid5  		//  Couple identifier (wave 5) 
	
*	Save
save "$share_w5_out/sharew5_ph.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_ph.xls", replace


*>>	WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_ph.dta", clear 	// Open the dataset 
gen wave=6											// Create wave id 

*	wave 6 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5
label variable srh "Self-report of health"
label values srh lab_health

/* Starting in Wave 5, respondents are asked if they have ever had rheumatoid arthritis or
osteoarthritis/other rheumatism, as separate questions. I will create a new "ph006d8" variable, coded as 1 if the respondent
indicates having had at least one of the conditions. */

tab ph006d19, miss
tab ph006d20, miss

*	Variable harmonization
gen ph006d8 = . 
replace ph006d8 = 0 if ph006d19==0 | ph006d20==0
replace ph006d8 = 1 if ph006d19==1 | ph006d20==1

/* We can use ph011d11 (Drugs for: osteoporosis) as a proxy for ph006d9 (Doctor told you had: osteoporosis)
because the question is not asked starting from wave 5. */

rename ph011d11 ph006d9

*	Same variables, different names: 
rename ph089d1 ph010d7
rename ph089d2 ph010d8
rename ph089d3 ph010d9

*	Personal identifier & keep variables
keep 			///
srh 			///
ph049d3 		/// Difficulties: bathing or showering
ph049d1 		/// Difficulties: dressing, including shoes and socks
ph048d3 		/// Difficulties: getting up from chair
ph049d2 		/// Difficulties: walking across a room
ph049d4 		/// Difficulties: eating, cutting up food
ph048d7 		/// Difficulties: reaching or extending arms above shoulder
ph049d6 		/// Difficulties: using the toilet, incl getting up or down
ph048d5 		/// Difficulties: climbing one flight of stairs
ph048d9 		/// Difficulties: lifting or carrying weights over 5 kilos
ph049d9 		/// Difficulties: shopping for groceries
ph049d10		/// Difficulties: telephone calls
ph049d12		/// Difficulties: doing work around the house or garden
ph049d8 		/// Difficulties: preparing a hot meal
ph049d11		/// Difficulties: taking medications
ph049d13		/// Difficulties: managing money
ph048d1 		/// Difficulties: walking 100 metres
ph049d5 		/// Difficulties: getting in or out of bed
ph049d7 		/// 
ph004_ ph005_ 	/// Long-term illness
ph006d2  		/// Doctor told you had: high blood pressure or hypertension
ph006d1  		/// Doctor told you had: heart attack
ph006d4  		/// Doctor told you had: stroke
ph006d10 		/// Doctor told you had: cancer
ph006d5  		/// Doctor told you had: diabetes or high blood sugar
ph006d8  		/// Doctor told you had: arthritis
ph006d6  		/// Doctor told you had: chronic lung disease
ph006d9  		/// Doctor told you had: osteoporosis
ph006d14 		/// Doctor told you had: hip fracture or femoral fracture
ph006d12		/// Doctor told you had: Parkinson disease
/// ph010d3 	/// Bothered by: breathlessness // Variable not present starting from wave 5
ph010d7  		/// Bothered by: falling down
ph010d8  		/// Bothered by: fear of falling down
ph010d9  		/// Bothered by: dizziness, faints or blackouts
ph043_ 			/// Eyesight distance
ph044_ 			/// Eyesight reading
ph046_ 			/// Hearing
ph012_	  		/// Weight of respondent
ph013_ 			/// Height (How tall are you?)
wave 			///
mergeid 		///
hhid6	   		/// Household identifier (wave 6)
mergeidp6   	/// Partner identifier (wave 6)  
coupleid6  		//  Couple identifier (wave 6)

*	Save
save "$share_w6_out/sharew6_ph.dta", replace 
*>> Codebook
codebookout "$codebook/sharew6_ph.xls", replace


*>>	WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_ph.dta", clear 	// Open the dataset 
gen wave=7											// Create wave id 

*	wave 7 respondent self-report of health
gen srh =.
replace srh = 1 if ph003_==1
replace srh = 2 if ph003_==2
replace srh = 3 if ph003_==3
replace srh = 4 if ph003_==4
replace srh = 5 if ph003_==5
label variable srh "Self-report of health"
label values srh lab_health

/* Starting in Wave 5, respondents are asked if they have ever had rheumatoid arthritis or
osteoarthritis/other rheumatism, as separate questions. I will create a new "ph006d8" variable, coded as 1 if the respondent
indicates having had at least one of the conditions. */
tab ph006d19, miss
tab ph006d20, miss

*	Variable harmonization 
gen ph006d8 = . 
replace ph006d8 = 0 if ph006d19==0 | ph006d20==0
replace ph006d8 = 1 if ph006d19==1 | ph006d20==1

/* We can use ph011d11 (Drugs for: osteoporosis) as a proxy for ph006d9 (Doctor told you had: osteoporosis)
because the question is not asked starting from wave 5. */

rename ph011d11 ph006d9

*	Same variables, different names: 
rename ph089d1 ph010d7
rename ph089d2 ph010d8
rename ph089d3 ph010d9

*	Personal identifier & keep variables
keep 			///
srh 			///
ph049d3 		/// Difficulties: bathing or showering
ph049d1 		/// Difficulties: dressing, including shoes and socks
ph048d3 		/// Difficulties: getting up from chair
ph049d2 		/// Difficulties: walking across a room
ph049d4 		/// Difficulties: eating, cutting up food
ph048d7 		/// Difficulties: reaching or extending arms above shoulder
ph049d6 		/// Difficulties: using the toilet, incl getting up or down
ph048d5 		/// Difficulties: climbing one flight of stairs
ph048d9 		/// Difficulties: lifting or carrying weights over 5 kilos
ph049d9 		/// Difficulties: shopping for groceries
ph049d10		/// Difficulties: telephone calls
ph049d12		/// Difficulties: doing work around the house or garden
ph049d8 		/// Difficulties: preparing a hot meal
ph049d11		/// Difficulties: taking medications
ph049d13		/// Difficulties: managing money
ph048d1 		/// Difficulties: walking 100 metres
ph049d5 		/// Difficulties: getting in or out of bed
ph049d7 		/// 
ph004_ ph005_ 	/// Long-term illness
ph006d2  		/// Doctor told you had: high blood pressure or hypertension
ph006d1  		/// Doctor told you had: heart attack
ph006d4  		/// Doctor told you had: stroke
ph006d10 		/// Doctor told you had: cancer
ph006d5  		/// Doctor told you had: diabetes or high blood sugar
ph006d8  		/// Doctor told you had: arthritis
ph006d6  		/// Doctor told you had: chronic lung disease
ph006d9  		/// Doctor told you had: osteoporosis
ph006d14 		/// Doctor told you had: hip fracture or femoral fracture
ph006d12		/// Doctor told you had: Parkinson disease
/// ph010d3 	/// Bothered by: breathlessness // Variable not present starting from wave 5
ph010d7  		/// Bothered by: falling down
ph010d8  		/// Bothered by: fear of falling down
ph010d9  		/// Bothered by: dizziness, faints or blackouts
ph043_ 			/// Eyesight distance
ph044_ 			/// Eyesight reading
ph046_ 			/// Hearing
ph012_	  		/// Weight of respondent
ph013_ 			/// Height (How tall are you?)
wave 			///
mergeid 		///
hhid7	   		/// Household identifier (wave 7)
mergeidp7   	/// Partner identifier (wave 7)  
coupleid7  		//  Couple identifier (wave 7)

*	Save
save "$share_w7_out/sharew7_ph.dta", replace 
*>> Codebook
codebookout "$codebook/sharew7_ph.xls", replace


*----	[  4. Extract & Recode Variables from MH ]---------------------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_mh.dta", clear 	// Open the dataset 
gen wave=1											// Create wave id 

*	Personal identifier & keep variables	
keep 		///
mh011_ 		/// Appetite
mh012_ 		/// Eating more or less (this variable is linked to mh011_)
mh013_ 		/// Fatigue
mh002_ 		/// Sad or depressed last month
mh016_ 		/// Enjoyment
mh003_ 		/// Hopes for the future
wave 		///
mergeid 	///
hhid1	   	/// Household identifier (wave 1)
mergeidp1   /// Partner identifier (wave 1)  
coupleid1  	// Couple identifier (wave 1)   

*	Save
save "$share_w1_out/sharew1_mh.dta", replace 

*>> Codebook
codebookout "$codebook/sharew1_mh.xls", replace


*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_mh.dta", clear 	// Open the dataset 
gen wave=2											// Create wave id 


*	Personal identifier & keep variables
keep 		///
mh011_ 		/// Appetite
mh012_ 		/// Eating more or less (this variable is linked to mh011_)
mh013_ 		/// Fatigue
mh002_ 		/// Sad or depressed last month
mh016_ 		/// Enjoyment
mh003_ 		/// Hopes for the future
wave 		///
mergeid 	///
hhid2	   	/// Household identifier (wave 2)
mergeidp2   /// Partner identifier (wave 2)  
coupleid2   //  Couple identifier (wave 2)   
	
*	Save
save "$share_w2_out/sharew2_mh.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_mh.xls", replace


*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_mh.dta", clear 	// Open the dataset 
gen wave=4											// Create wave id 

*	Personal identifier & keep variables	

keep 		///
mh011_ 		/// Appetite
mh012_ 		/// Eating more or less (this variable is linked to mh011_)
mh013_ 		/// Fatigue
mh002_ 		/// Sad or depressed last month
mh016_ 		/// Enjoyment
mh003_ 		/// Hopes for the future
wave 		///
mergeid 	///
hhid4	   	/// Household identifier (wave 4)
mergeidp4   /// Partner identifier (wave 4)  
coupleid4   //  Couple identifier (wave 4)   
	
*	Save
save "$share_w4_out/sharew4_mh.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_mh.xls", replace


*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_mh.dta", clear 	// Open the dataset 
gen wave=5											// Create wave id 

*	Recode variables (inconsistency with other waves)
recode mh011_ (5=2) (9=3)
recode mh003_ (5=2)
recode mh016_ (5=2)

*	Personal identifier & keep variables
keep 		///
mh011_ 		/// Appetite
mh012_ 		/// Eating more or less (this variable is linked to mh011_)
mh013_ 		/// Fatigue
mh002_ 		/// Sad or depressed last month
mh016_ 		/// Enjoyment
mh003_ 		/// Hopes for the future
wave 		///
mergeid 	///
hhid5	   	/// Household identifier (wave 5)
mergeidp5   /// Partner identifier (wave 5)  
coupleid5   //  Couple identifier (wave 5) 
	
*	Save
save "$share_w5_out/sharew5_mh.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_mh.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_mh.dta", clear 	// Open the dataset 
gen wave=6											// Create wave id 

*	Personal identifier & keep variables
keep 		///
mh011_ 		/// Appetite
mh012_ 		/// Eating more or less (this variable is linked to mh011_)
mh013_ 		/// Fatigue
mh002_ 		/// Sad or depressed last month
mh016_ 		/// Enjoyment
mh003_ 		/// Hopes for the future
wave 		///
mergeid 	///
hhid6		/// Household identifier (wave 6)
mergeidp6	/// Partner identifier (wave 6)  
coupleid6	//  Couple identifier (wave 6)

*	Save
save "$share_w6_out/sharew6_mh.dta", replace 
*>> Codebook
codebookout "$codebook/sharew6_mh.xls", replace



*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_mh.dta", clear 	// Open the dataset 
gen wave=7											// Create wave id 

*	Personal identifier & keep variables
keep 		///
mh011_ 		/// Appetite
mh012_ 		/// Eating more or less (this variable is linked to mh011_)
mh013_ 		/// Fatigue
mh002_ 		/// Sad or depressed last month
mh016_ 		/// Enjoyment
mh003_ 		/// Hopes for the future
wave 		///
mergeid 	///
hhid7	   	/// Household identifier (wave 7)
mergeidp7   /// Partner identifier (wave 7)  
coupleid7  	//  Couple identifier (wave 7)

*	Save
save "$share_w7_out/sharew7_mh.dta", replace 
*>> Codebook
codebookout "$codebook/sharew7_mh.xls", replace

*----	[  5. Extract & Recode Variables from BR ]---------------------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_br.dta", clear 	// Open the dataset 
gen wave=1											// Create wave id 


*	Personal identifier & keep variables	
keep 		///
br001_ 		/// Ever smoked daily
br002_  	/// Smoke at the present time
br003_  	/// How many years smoked
br010_  	/// Days a week consumed alcohol last 6 months <- it's different [3 months] in the subsequent weaves
br015_ 		/// Sports or activities that are vigorous
br016_ 		/// Activities requiring a moderate level of energy
wave 		///
mergeid 	///
hhid1	   	/// Household identifier (wave 1)
mergeidp1   /// Partner identifier (wave 1)  
coupleid1   // Couple identifier (wave 1)   

*	Save
save "$share_w1_out/sharew1_br.dta", replace 

*>> Codebook
codebookout "$codebook/sharew1_br.xls", replace

*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_br.dta", clear 	// Open the dataset 
gen wave=2											// Create wave id 

*	Personal identifier & keep variables
keep 		///
br001_ 		/// Ever smoked daily
br002_  	/// Smoke at the present time
br003_  	/// How many years smoked
br022_  	/// Stopped smoking
br010_  	/// Days a week consumed alcohol last 3 months
br015_ 		/// Sports or activities that are vigorous
br016_ 		/// Activities requiring a moderate level of energy
wave 		///
mergeid 	///
hhid2	  	/// Household identifier (wave 2)
mergeidp2  	/// Partner identifier (wave 2)  
coupleid2  	//  Couple identifier (wave 2)   


*	Save
save "$share_w2_out/sharew2_br.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_br.xls", replace


*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_br.dta", clear 	// Open the dataset 
gen wave=4											// Create wave id 

*	Personal identifier & keep variables
keep 		///
br001_ 		/// Ever smoked daily
br002_  	/// Smoke at the present time
br003_  	/// How many years smoked
br022_  	/// Stopped smoking
br010_  	/// Days a week consumed alcohol last 3 months
br015_ 		/// Sports or activities that are vigorous
br016_ 		/// Activities requiring a moderate level of energy
wave 		///
mergeid 	///
hhid4	   	/// Household identifier (wave 4)
mergeidp4   	/// Partner identifier (wave 4)  
coupleid4   	//  Couple identifier (wave 4)   

*	Save
save "$share_w4_out/sharew4_br.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_br.xls", replace


*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_br.dta", clear 	// Open the dataset 
gen wave=5											// Create wave id 


*	Personal identifier & keep variables
keep 		///
br001_ 		/// Ever smoked daily
br002_  	/// Smoke at the present time
br003_  	/// How many years smoked
br022_  	/// Stopped smoking
br010_  	/// Days a week consumed alcohol last 3 months
br015_ 		/// Sports or activities that are vigorous
br016_ 		/// Activities requiring a moderate level of energy
wave 		///
mergeid 	///
hhid5	   	/// Household identifier (wave 5)
mergeidp5   /// Partner identifier (wave 5)  
coupleid5   //  Couple identifier (wave 5) 

*	Save
save "$share_w5_out/sharew5_br.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_br.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_br.dta", clear 	// Open the dataset 
gen wave=6											// Create wave id 

*	Personal identifier & keep variables	
keep 	///
br001_ 	/// Ever smoked daily
br002_  /// Smoke at the present time
br003_  /// How many years smoked
br015_ 	/// Sports or activities that are vigorous
br016_ 	/// Activities requiring a moderate level of energy
br039_ 	///
wave 	///
mergeid ///
hhid6	   /// Household identifier (wave 6)
mergeidp6   /// Partner identifier (wave 6)  
coupleid6   //  Couple identifier (wave 6)

*	Save
save "$share_w6_out/sharew6_br.dta", replace 

*>> Codebook
codebookout "$codebook/sharew6_br.xls", replace

*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_br.dta", clear 	// Open the dataset 
gen wave=7											// Create wave id 

*	Personal identifier & keep variables	
keep 	///
br001_ 	/// Ever smoked daily
br002_  /// Smoke at the present time
br003_  /// How many years smoked
br015_ 	/// Sports or activities that are vigorous
br016_ 	/// Activities requiring a moderate level of energy
br039_ 	///
wave 	///
mergeid ///
hhid7	   /// Household identifier (wave 7)
mergeidp7   /// Partner identifier (wave 7)  
coupleid7   //  Couple identifier (wave 7)

*	Save
save "$share_w7_out/sharew7_br.dta", replace 

*>> Codebook
codebookout "$codebook/sharew7_br.xls", replace

*----	[  6. Extract & Recode Variables from GV_Health]---------------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_gv_health.dta", clear 	// Open the dataset 
gen wave=1													// Create wave id 

*	Personal identifier & keep variables	
keep 		///
cusmoke 	///
drinkin2 	///
casp 		///
eurod 		/// 
spheu 		///
spheu2 		///
sphus 		///
sphus2 		///
wave 		///
mergeid 	///
hhid1	   /// Household identifier (wave 1)
mergeidp1   /// Partner identifier (wave 1)  
coupleid1   // Couple identifier (wave 1)   

*	Save
save "$share_w1_out/sharew1_gv_health.dta", replace 

*>> Codebook
codebookout "$codebook/sharew1_gv_health.xls", replace


*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_gv_health.dta", clear 	// Open the dataset  
gen wave=2													// Create wave id 

*	Personal identifier & keep variables	
keep 	 ///
cusmoke  ///
casp 	 ///
eurod 	 ///
sphus 	 ///
wave 	 ///
mergeid  ///
hhid2	 /// Household identifier (wave 2)
mergeidp2 /// Partner identifier (wave 2)  
coupleid2 //  Couple identifier (wave 2)   
	
*	Save
save "$share_w2_out/sharew2_gv_health.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_gv_health.xls", replace


*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_gv_health.dta", clear 	// Open the dataset  
gen wave=4													// Create wave id 


*	Personal identifier & keep variables	
keep 		///
cusmoke 	///
casp 		///
eurod 		///
sphus 		///
wave 		///
mergeid 	///
hhid4		/// Household identifier (wave 4)
mergeidp4	/// Partner identifier (wave 4)  
coupleid4	//  Couple identifier (wave 4)   
	
*	Save
save "$share_w4_out/sharew4_gv_health.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_gv_health.xls", replace


*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_gv_health.dta", clear 	// Open the dataset  
gen wave=5													// Create wave id 


*	Personal identifier & keep variables
keep 		///
casp 		///
eurod 		///
sphus 		///
wave 		///
mergeid 	///
hhid5		/// Household identifier (wave 5)
mergeidp5	/// Partner identifier (wave 5)  
coupleid5	//  Couple identifier (wave 5) 
	
*	Save
save "$share_w5_out/sharew5_gv_health.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_gv_health.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_gv_health.dta", clear 	// Open the dataset  
gen wave=6													// Create wave id 


*	Personal identifier & keep variables	
keep 		///
casp 		///
eurod 		///
sphus 		///
wave 		///
mergeid 	///
hhid6		/// Household identifier (wave 6)
mergeidp6	/// Partner identifier (wave 6)  
coupleid6	//  Couple identifier (wave 6)

*	Save
save "$share_w6_out/sharew6_gv_health.dta", replace 

*>> Codebook
codebookout "$codebook/sharew6_gv_health.xls", replace


*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_gv_health.dta", clear 	// Open the dataset  
gen wave=7													// Create wave id 


*	Personal identifier & keep variables	
keep 		///
casp 		///
eurod 		///
sphus 		///
wave 		///
mergeid 	///
hhid7		/// Household identifier (wave 7)
mergeidp7	/// Partner identifier (wave 7)  
coupleid7	//  Couple identifier (wave 7)

*	Save
save "$share_w7_out/sharew7_gv_health.dta", replace 

*>> Codebook
codebookout "$codebook/sharew7_gv_health.xls", replace


*----	[  7. Extract & Recode Variables from CV_R ]-------------------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_cv_r.dta", clear 	// Open the dataset  
gen wave=1												// Create wave id 

*	"deceased" variable creation
gen deceased = 0 	// Since in this wave there is not the "deceased" variable (that identify the death of the respondent), 
					// as in the subsequent waves, we have to create it


*	Personal identifier & keep variables	
keep 		///
country		/// Country identifier
deceased   	/// Deceased
mobirth		/// Month of birth
yrbirth		/// Year of birth
age_int		/// Age of respondent at the time of interview
partnerinhh	/// Partner in household
hhsize	 	/// Household size
interview 	/// 
int_year   	/// Interview year
int_month  	/// Interview month
wave 		///
mergeid 	///
gender 		/// 
yrbirthp 	///
mobirthp 	///
hhid1	  	/// Household identifier (wave 1)
mergeidp1  	/// Partner identifier (wave 1)  
coupleid1  	/// Couple identifier (wave 1)   
fam_resp 	/// "Family respondent"
hou_resp	// "Household respondent"

lab var hhid1 	  	"Household identifier wave 1"
lab var hhsize		"Household size"
lab var int_year  	"Interview year"
lab var int_month 	"Interview month"
lab var partnerinhh "Partner in household"
lab var fam_resp 	"Family respondent"
lab var hou_resp	"Household respondent"
recode gender 2=1 1=0, gen(female)
lab var female "Gender: female=1, male=0"
lab def female 1 "female" 0 "male"
lab val female female

sort coupleid1
 
*>> Gender of the partner 
gen	 gender_partner=.
replace gender_partner=female[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace gender_partner=female[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace gender_partner=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9
lab var gender_partner "Gender of partner: female=1, male=0"
lab val gender_partner lblfemale
lab def lblfemale	   	/// 
		0 "0. male"	 	/// 
		1 "1. female"   ///
	   -9 "filtered: single or no partner in household", add

*>> Re-number coupleID  
bysort  hhid1: gen temp =_n
gsort -coupleid1 -temp

*>> Interview of partner available 
gen	 int_partner=.
replace int_partner=-9 if coupleid1==""
replace int_partner=1  /// 
		   if (coupleid1==coupleid1[_n+1] | coupleid1==coupleid1[_n-1]) ///
		   &  coupleid1!=""
replace int_partner=5  ///
		   if  coupleid1!=coupleid1[_n+1] & coupleid1!=coupleid1[_n-1]  ///
		   &  coupleid1!=""
lab var int_partner "Interview of partner available"
lab val int_partner lblinterviewp
lab def lblinterviewp 1 "1. yes" /// 
					  5 "5. no"  ///
					 -9 "filtered: single or no partner in household", add 

*	Save
save "$share_w1_out/sharew1_cv_r.dta", replace 

*>> Codebook
codebookout "$codebook/sharew1_cv_r.xls", replace


*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_cv_r.dta", clear  	// Open the dataset  
gen wave=2												// Create wave id 

*	Personal identifier & keep variables	
keep 		///
country		/// Country identifier
mobirth		/// Month of birth
yrbirth		/// Year of birth
age_int		/// Age of respondent at the time of interview
partnerinhh	/// Partner in household
hhsize	 	/// Household size
int_year   	/// Interview year
int_month  	/// Interview month
deceased   	/// Deceased
yrbirthp  	/// 
mobirthp 	///
fam_resp 	/// 
hou_resp 	/// 
gender 		/// 
interview 	///
wave 		///
mergeid 	///
hhid2	   	/// Household identifier (wave 2)
mergeidp2   /// Partner identifier (wave 2)  
coupleid2   //  Couple identifier (wave 2)   

lab var hhid2 	  	"Household identifier wave 2"
lab var hhsize		"Household size"
lab var int_year  	"Interview year"
lab var int_month 	"Interview month"
lab var partnerinhh "Partner in household"
lab var fam_resp 	"Family respondent"
lab var hou_resp	"Household respondent"
recode gender 2=1 1=0, gen(female)
lab var female "Gender: female=1, male=0"
lab def female 1 "female" 0 "male"
lab val female female

sort coupleid2
gen	 gender_partner=.
replace gender_partner=female[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace gender_partner=female[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace gender_partner=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9
lab var gender_partner "Gender of partner"
lab val gender_partner lblfemale
lab def lblfemale -9 "filtered: single or no partner in hh", add

bysort  hhid2: gen temp =_n
gsort -coupleid2 -temp

gen int_partner=.
replace int_partner=-9 if  coupleid2==""
replace int_partner=1  ///
		if (coupleid2==coupleid2[_n+1] | coupleid2==coupleid2[_n-1]) ///
		 &  coupleid2!=""
replace int_partner=5  ///
		if  coupleid2!=coupleid2[_n+1] & coupleid2!=coupleid2[_n-1]  ///
		 &  coupleid2!=""
lab var int_partner "Interview of partner available"
lab val int_partner lblinterviewp
lab def lblinterviewp 1 "1. yes" ///
					  5 "5. no"  ///
					 -9 "filtered: single or no partner in household", add 
	
*	Save
save "$share_w2_out/sharew2_cv_r.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_cv_r.xls", replace


*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_cv_r.dta", clear  	// Open the dataset  
gen wave=4												// Create wave id 

*	Personal identifier & keep variables	
keep 		///
country		/// Country identifier
mobirth		/// Month of birth
yrbirth		/// Year of birth
age_int		/// Age of respondent at the time of interview
partnerinhh	/// Partner in household
hhsize	 	/// Household size
int_year   	/// Interview year
int_month  	/// Interview month
yrbirthp  	///
mobirthp 	///
interview 	///
deceased   	/// Deceased
gender 		/// 
wave 		///
mergeid 	///
hhid4		/// Household identifier (wave 4)
mergeidp4	/// Partner identifier (wave 4)  
coupleid4	//  Couple identifier (wave 4)   


lab var hhsize	   "Household size"
lab var int_year	 "Interview year"
lab var int_month	 "Interview month"
recode gender 2=1 1=0, gen(female)
lab var female "Gender: female=1, male=0"
lab def female 1 "female" 0 "male"
lab val female female

sort coupleid4
gen	 gender_partner=.
replace gender_partner=female[_n-1] if coupleid4==coupleid4[_n-1] /// 
									 & coupleid4!=""
replace gender_partner=female[_n+1] if coupleid4==coupleid4[_n+1] /// 
									 & coupleid4!=""
replace gender_partner=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9
lab var gender_partner "Gender of partner: female=1, male=0"
lab val gender_partner lblfemale
lab def lblfemale -9 "filtered: single or no partner in hh", add

bysort  hhid4: gen temp =_n
gsort -coupleid4 -temp

gen	 int_partner=.
replace int_partner=-9 if coupleid4==""
replace int_partner=1												 ///
		if (coupleid4==coupleid4[_n+1] | coupleid4==coupleid4[_n-1])  ///
		 & coupleid4!=""
replace int_partner=5												 /// 
		if coupleid4!=coupleid4[_n+1] & coupleid4!=coupleid4[_n-1]	///
		 & coupleid4!=""
lab var int_partner "Interview of partner available"
lab val int_partner lblinterviewp
lab def lblinterviewp 1 "1. yes"  ///
					  5 "5. no"   ///
					 -9 "filtered: single or no partner in household", add 
	
*	Save
save "$share_w4_out/sharew4_cv_r.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_cv_r.xls", replace


*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_cv_r.dta", clear  	// Open the dataset  
gen wave=5												// Create wave id 

*	Personal identifier & keep variables
keep 			///
country	 		/// Country identifier
mobirth	 		/// Month of birth
yrbirth	 		/// Year of birth
age_int	 		/// Age of respondent at the time of interview
partnerinhh 	/// Partner in household
hhsize	  		/// Household size
int_year		/// Interview year
int_month   	/// Interview month
yrbirthp  		///
mobirthp 		///
gender			///
interview		///
deceased		/// Deceased
wave 			///
mergeid 		///
hhid5	   		/// Household identifier (wave 5)
mergeidp5 		/// Partner identifier (wave 5)  
coupleid5 		//  Couple identifier (wave 5) 


lab var hhsize	   "Household size"
lab var int_year	 "Interview year"
lab var int_month	 "Interview month"
recode gender 2=1 1=0, gen(female)
lab var female "Gender: female=1, male=0"
lab def female 1 "female" 0 "male"
lab val female female

sort coupleid5
gen	 gender_partner=.
replace gender_partner=female[_n-1] if coupleid5==coupleid5[_n-1] /// 
									 & coupleid5!=""
replace gender_partner=female[_n+1] if coupleid5==coupleid5[_n+1] /// 
									 & coupleid5!=""
replace gender_partner=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9
lab var gender_partner "Gender of partner: female=1, male=0"
lab val gender_partner lblfemale
lab def lblfemale -9 "filtered: single or no partner in hh", add

bysort  hhid5: gen temp =_n   
gsort -coupleid5 -temp

gen	 int_partner=.
replace int_partner=-9 if coupleid5==""
replace int_partner=1												 ///
		if (coupleid5==coupleid5[_n+1] | coupleid5==coupleid5[_n-1])  ///
		 & coupleid5!=""
replace int_partner=5												 /// 
		if coupleid5!=coupleid5[_n+1] & coupleid5!=coupleid5[_n-1]	///
		 & coupleid5!=""
lab var int_partner "Interview of partner available"
lab val int_partner lblinterviewp
lab def lblinterviewp 1 "1. yes"  ///
					  5 "5. no"   ///
					 -9 "filtered: single or no partner in household", add 
	
*	Save
save "$share_w5_out/sharew5_cv_r.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_cv_r.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_cv_r.dta", clear  	// Open the dataset  
gen wave=6												// Create wave id 

*	Personal identifier & keep variables	
keep 			///
country	 		/// Country identifier
mobirth	 		/// Month of birth
yrbirth	 		/// Year of birth
age_int	 		/// Age of respondent at the time of interview
partnerinhh 	/// Partner in household
hhsize	  		/// Household size
int_year		/// Interview year
int_month   	/// Interview month
yrbirthp  		///
mobirthp 		///
gender 			///
interview 		///
deceased		/// Deceased
wave 			///
mergeid 		///
hhid6	   		/// Household identifier (wave 6)
mergeidp6   	/// Partner identifier (wave 6)  
coupleid6   	//  Couple identifier (wave 6)

lab var wave		"Wave"
lab var hhsize	   	"Household size"
lab var int_year	"Interview year"
lab var int_month	"Interview month"
recode gender 2=1 1=0, gen(female)
lab var female "Gender: female=1, male=0"
lab def female 1 "female" 0 "male"
lab val female female

sort coupleid6
gen	 gender_partner=.
replace gender_partner=female[_n-1] if coupleid6==coupleid6[_n-1] /// 
									 & coupleid6!=""
replace gender_partner=female[_n+1] if coupleid6==coupleid6[_n+1] /// 
									 & coupleid6!=""
replace gender_partner=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9
lab var gender_partner "Gender of partner: female=1, male=0"
lab val gender_partner lblfemale
lab def lblfemale -9 "filtered: single or no partner in hh", add

bysort  hhid6: gen temp =_n   
gsort -coupleid6 -temp

gen	 int_partner=.
replace int_partner=-9 if coupleid6==""
replace int_partner=1												 ///
		if (coupleid6==coupleid6[_n+1] | coupleid6==coupleid6[_n-1])  ///
		 & coupleid6!=""
replace int_partner=5												 /// 
		if coupleid6!=coupleid6[_n+1] & coupleid6!=coupleid6[_n-1]	///
		 & coupleid6!=""
lab var int_partner "Interview of partner available"
lab val int_partner lblinterviewp
lab def lblinterviewp 1 "1. yes"  ///
					  5 "5. no"   ///
					 -9 "filtered: single or no partner in household", add 

*	Save
save "$share_w6_out/sharew6_cv_r.dta", replace 
*>> Codebook
codebookout "$codebook/sharew6_cv_r.xls", replace



*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_cv_r.dta", clear  	// Open the dataset  
gen wave=7												// Create wave id 

*	Personal identifier & keep variables	
keep 			///
country	 		/// Country identifier
mobirth	 		/// Month of birth
yrbirth	 		/// Year of birth
age_int	 		/// Age of respondent at the time of interview
partnerinhh 	/// Partner in household
hhsize	  		/// Household size
int_year		/// Interview year
int_month   	/// Interview month
yrbirthp  		///
mobirthp 		///
gender 			///
interview 		///
deceased		/// Deceased
wave 			///
mergeid 		///
hhid7	   		/// Household identifier (wave 7)
mergeidp7   	/// Partner identifier (wave 7)  
coupleid7   	//  Couple identifier (wave 7)

lab var wave		 "Wave"
lab var hhsize	   "Household size"
lab var int_year	 "Interview year"
lab var int_month	 "Interview month"
recode gender 2=1 1=0, gen(female)
lab var female "Gender: female=1, male=0"
lab def female 1 "female" 0 "male"
lab val female female

sort coupleid7
gen	 gender_partner=.
replace gender_partner=female[_n-1] if coupleid7==coupleid7[_n-1] /// 
									 & coupleid7!=""
replace gender_partner=female[_n+1] if coupleid7==coupleid7[_n+1] /// 
									 & coupleid7!=""
replace gender_partner=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9
lab var gender_partner "Gender of partner: female=1, male=0"
lab val gender_partner lblfemale
lab def lblfemale -9 "filtered: single or no partner in hh", add

bysort  hhid7: gen temp =_n   
gsort -coupleid7 -temp

gen	 int_partner=.
replace int_partner=-9 if coupleid7==""
replace int_partner=1												 	///
		if (coupleid7==coupleid7[_n+1] | coupleid7==coupleid7[_n-1])  	///
		 & coupleid7!=""
replace int_partner=5												 	/// 
		if coupleid7!=coupleid7[_n+1] & coupleid7!=coupleid7[_n-1]		///
		 & coupleid7!=""
lab var int_partner "Interview of partner available"
lab val int_partner lblinterviewp
lab def lblinterviewp 1 "1. yes"  ///
					  5 "5. no"   ///
					 -9 "filtered: single or no partner in household", add 

*	Save
save "$share_w7_out/sharew7_cv_r.dta", replace 
*>> Codebook
codebookout "$codebook/sharew7_cv_r.xls", replace


*----	[  8. Extract & Recode Variables from GV_Imputations ]---------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_gv_imputations.dta", clear  	// Open the dataset  
gen wave=1														// Create wave id 


*	Personal identifier & keep variables	
keep 					///
/// CONSUMPTION
		fahc*			/// Amount spent on food at home
		fohc*			/// Amount spent on food outside home
/// WEALTH & INCOME variables:
		hrass* 			/// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)	(wave 1 2 4 5 6)
		hgfass* 		/// Household gross financial assets (sum of bacc, bsmf and slti)			(wave 1 2 4 5 6)
		hnfass* 		/// Household net financial assets (hgfass – liab) 							(wave 1 2 4 5 6)
		hnetw* 			/// Household net worth 													(wave 1 2 4 5 6)
		home* 			/// Value of main residence 												(wave 1 2 4 5 6)
		vbus* 			/// Value of own business 													(wave 1 2 4 5 6)
		sbus* 			/// Share of own business 													(wave 1 2 4 5 6)
		car* 			/// Value of cars 		 													(wave 1 2 4 5 6)
		ores* 			/// Value of other real estate – Amount 									(wave 1 2 4 5 6)
		mort* 			/// Mortgage on main residence 												(wave 1 2 4 5 6)
		bacc* 			/// Bank accounts															(wave 1 2 4 5 6)
		bsmf* 			/// Bond, stock and mutual funds											(wave 1 2 4 5 6)
		slti*			/// Savings for long-term investments										(wave 1 2 4 5 6)
		liab*			/// Financial liabilities													(wave 1 2 4 5 6)
		liab* 	 		/// financial liabilities
		mort* 	 		/// mortgage on main residence
		otrf* 	 		/// owner, tenant or rent free
		sbus* 	 		/// share of own business
		slti* 	 		/// savings for long-term investments
		vbus*	 		/// value of own business
		implicat*   	///	Implicat number
		exrate*	 		///	Exchange rate
		thinc*	  		///	Total household income - Version A
		hrass*	  		///	Household real assets
/// SOCIO-DEMOGRAPHIC variables:
		gender*	 		///	Gender
		yedu*	   		///	Years of education
		isced*	  		///	ISCED 1997 coding of education
		sphus*	  		///	Self-perceived health - US scale
		mstat*	  		///	Marital status
		nchild*	 		///	Number of children
		ngrchild*   	///	Number of grandchildren
		eyesightr*  	///	Eyesight reading
		hearing*		///	Hearing
		bmi*			///	Body mass index
		weight*	 		///	Weight
		height*	 		///	Height
		esmoked*		///	Ever smoked daily
		phinact*		///	Physical inactivity
		orienti*		///	Score of orientation in time test
		maxgrip*		///	Maximum of grip strength measures
		doctor*	 		///	Seen/Talked to medical doctor
		hospital*   	///	In hospital last 12 months
		thospital*  	///	Times being patient in hospital
		nhospital*  	///	Total nights stayed in hospital
		cjs*			///	Current job situation
		pwork*	  		///	Did any paid work
		empstat1*	   	/// Employee or self-employed first job
		empstat2*	   	/// Employee or self-employed second job
		fdistress*  	///	Household able to make ends meet
		nalm* 			/// Number of activities last month
/// Other (e.g. ID)
		ghih  			///	Given help in the household (how many) 	-> based on sp018 (waves 1 2 4 5 6)
		ghto  			///	Given help to others (how many) 		-> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
		maxgrip_f 		/// 
		bmi_f 			/// 
		orienti_f 		/// 
		wave 			///
		mergeid 		///
		hhid1	  		/// Household identifier (wave 1)
		mergeidp1  		/// Partner identifier (wave 1)  
		coupleid1  		// Couple identifier (wave 1)   

*	mean value for income and wealth (based on the 5 SHARE imputation)
bys mergeid : egen income_implicatmean=mean(thinc)
bys mergeid : egen wealth_implicatmean=mean(hnetw)


*	We only keep one out of the five implicats:
keep if implicat==1 

*	Save
save "$share_w1_out/sharew1_gv_imputations.dta", replace 

*>> Codebook
codebookout "$codebook/sharew1_gv_imputations.xls", replace


*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_gv_imputations.dta", clear  	// Open the dataset  
gen wave=2														// Create wave id 


*	Personal identifier & keep variables	
keep 					///
/// CONSUMPTION
		fahc*			/// Amount spent on food at home
		fohc*			/// Amount spent on food outside home
/// WEALTH & INCOME variables:
		hrass* 			/// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)	(wave 1 2 4 5 6)
		hgfass* 		/// Household gross financial assets (sum of bacc, bsmf and slti)			(wave 1 2 4 5 6)
		hnfass* 		/// Household net financial assets (hgfass – liab) 							(wave 1 2 4 5 6)
		hnetw* 			/// Household net worth 													(wave 1 2 4 5 6)
		home* 			/// Value of main residence 												(wave 1 2 4 5 6)
		vbus* 			/// Value of own business 													(wave 1 2 4 5 6)
		sbus* 			/// Share of own business 													(wave 1 2 4 5 6)
		car* 			/// Value of cars 		 													(wave 1 2 4 5 6)
		ores* 			/// Value of other real estate – Amount 									(wave 1 2 4 5 6)
		mort* 			/// Mortgage on main residence 												(wave 1 2 4 5 6)
		bacc* 			/// Bank accounts															(wave 1 2 4 5 6)
		bsmf* 			/// Bond, stock and mutual funds											(wave 1 2 4 5 6)
		slti*			/// Savings for long-term investments										(wave 1 2 4 5 6)
		liab*			/// Financial liabilities													(wave 1 2 4 5 6)
		bacc* 	 		/// bank accounts
		bsmf* 	 		/// bond, stock and mutual funds
		car* 	 		/// value of cars
		home* 	 		/// value of main residence
		liab* 	 		/// financial liabilities
		mort* 	 		/// mortgage on main residence
		ores* 	 		/// value of other real estate - amount
		ores* 	 		/// value of other real estate
		ores* 	 		/// value of real estate - amount
		otrf* 	 		/// owner, tenant or rent free
		sbus* 	 		/// share of own business
		slti* 	 		/// savings for long-term investments
		vbus* 	 		/// value of own business
		implicat*   	///	Implicat number
		exrate*	 		///	Exchange rate
		thinc2*	 		///	Total household income - Version B
		thinc*	  		///	Total household income - Version A
		hrass*	  		///	Household real assets
		hgfass*	 		///	Household gross financial assets
		hnfass*	 		///	Household net financial assets
		gender*	 		///	Gender
		yedu*	   		///	Years of education
		isced*	  		///	ISCED 1997 coding of education
		sphus*	  		///	Self-perceived health - US scale
		mstat*	  		///	Marital status
		nchild*	 		///	Number of children
		ngrchild*   	///	Number of grandchildren
		eyesightr*  	///	Eyesight reading
		hearing*		///	Hearing
		bmi*			///	Body mass index
		weight*	 		///	Weight
		height*	 		///	Height
		esmoked*		///	Ever smoked daily
		phinact*		///	Physical inactivity
		orienti*		///	Score of orientation in time test
		maxgrip*		///	Maximum of grip strength measures
		doctor*	 		///	Seen/Talked to medical doctor
		hospital*   	///	In hospital last 12 months
		thospital*  	///	Times being patient in hospital
		nhospital*  	///	Total nights stayed in hospital
		cjs*			///	Current job situation
		pwork*	  		///	Did any paid work
		empstat*		///	Employee or self-employed
		fdistress*  	///	Household able to make ends meet
		nalm* 			/// Number of activities last month
/// Other (e.g. ID)	
		ghih  			///	Given help in the household (how many) 	-> based on sp018 (waves 1 2 4 5 6)
		ghto  			///	Given help to others (how many) 		-> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
		maxgrip_f 		/// 
		bmi_f 			/// 
		orienti_f 		/// 
		wave 			///
		mergeid 		///
		hhid2	 		/// Household identifier (wave 2)
		mergeidp2 		/// Partner identifier (wave 2)  
		coupleid2 		//  Couple identifier (wave 2)   


*	mean value for income and wealth (based on the 5 SHARE imputation)
bys mergeid : egen income_implicatmean=mean(thinc)
bys mergeid : egen wealth_implicatmean=mean(hnetw)	

*	We only keep one out of the five implicats:
keep if implicat==1 

*	Save
save "$share_w2_out/sharew2_gv_imputations.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_gv_imputations.xls", replace


*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_gv_imputations.dta", clear  	// Open the dataset  
gen wave=4														// Create wave id 


*	Personal identifier & keep variables	
keep 					///
/// CONSUMPTION
		fahc			/// Amount spent on food at home
		fohc			/// Amount spent on food outside home
/// WEALTH & INCOME variables:
		hrass* 			/// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)	(wave 1 2 4 5 6)
		hgfass* 		/// Household gross financial assets (sum of bacc, bsmf and slti)			(wave 1 2 4 5 6)
		hnfass* 		/// Household net financial assets (hgfass – liab) 							(wave 1 2 4 5 6)
		hnetw* 			/// Household net worth 													(wave 1 2 4 5 6)
		home* 			/// Value of main residence 												(wave 1 2 4 5 6)
		perho* 			/// Percentage of house owned 				---------------->				(wave	 4 5 6)
		vbus* 			/// Value of own business 													(wave 1 2 4 5 6)
		sbus* 			/// Share of own business 													(wave 1 2 4 5 6)
		car* 			/// Value of cars 		 													(wave 1 2 4 5 6)
		ores* 			/// Value of other real estate – Amount 									(wave 1 2 4 5 6)
		mort* 			/// Mortgage on main residence 												(wave 1 2 4 5 6)
		bacc* 			/// Bank accounts															(wave 1 2 4 5 6)
		bsmf* 			/// Bond, stock and mutual funds											(wave 1 2 4 5 6)
		slti*			/// Savings for long-term investments										(wave 1 2 4 5 6)
		liab*			/// Financial liabilities													(wave 1 2 4 5 6)
		bacc* 	 		/// bank accounts
		bsmf* 	 		/// bond, stock and mutual funds
		car* 	 		/// value of cars
		home* 	 		/// value of main residence
		liab* 	 		/// financial liabilities
		mort* 	 		/// mortgage on main residence
		ores* 	 		/// value of other real estate - amount
		ores* 	 		/// value of other real estate
		ores* 	 		/// value of real estate - amount
		otrf* 	 		/// owner, tenant or rent free
		perho* 	 		/// percentage of house owned
		sbus* 	 		/// share of own business
		slti* 	 		/// savings for long-term investments
		vbus* 	 		/// value of own business
		implicat*   	///	Implicat number
		exrate*	 		///	Exchange rate
		thinc2*	 		///	Total household income - Version B
		thinc*	  		///	Total household income - Version A
		hrass*	  		///	Household real assets
		hgfass*	 		///	Household gross financial assets
		hnfass*	 		///	Household net financial assets
		gender*	 		///	Gender
		yedu*	   		///	Years of education
		isced*	  		///	ISCED 1997 coding of education
		sphus*	  		///	Self-perceived health - US scale
		mstat*	  		///	Marital status
		nchild*	 		///	Number of children
		ngrchild*   	///	Number of grandchildren
		eyesightr*  	///	Eyesight reading
		hearing*		///	Hearing
		bmi*			///	Body mass index
		weight*	 		///	Weight
		height*	 		///	Height
		esmoked*		///	Ever smoked daily
		phinact*		///	Physical inactivity
		orienti*		///	Score of orientation in time test
		maxgrip*		///	Maximum of grip strength measures
		doctor*	 		///	Seen/Talked to medical doctor
		hospital*   	///	In hospital last 12 months
		thospital*  	///	Times being patient in hospital
		nhospital*  	///	Total nights stayed in hospital
		cjs*			///	Current job situation
		pwork*	  		///	Did any paid work
		empstat*		///	Employee or self-employed
		fdistress* 		///	Household able to make ends meet
		naly*	   		///	Number of activities last year
		saly*	   		///	Satisfied with no activities
/// Other (e.g. ID)
		ghih  			///	Given help in the household (how many) 	-> based on sp018 (waves 1 2 4 5 6)
		ghto  			///	Given help to others (how many) 		-> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
		maxgrip_f 		/// 
		bmi_f 			/// 
		orienti_f 		/// 
		wave 			///
		mergeid 		///
		hhid4	   		/// Household identifier (wave 4)
		mergeidp4		/// Partner identifier (wave 4)  
		coupleid4		//  Couple identifier (wave 4)   

*	mean value for income and wealth (based on the 5 SHARE imputation)
bys mergeid : egen income_implicatmean=mean(thinc)
bys mergeid : egen wealth_implicatmean=mean(hnetw)

* We only keep one out of the five implicats:
keep if implicat==1 


*	Save
save "$share_w4_out/sharew4_gv_imputations.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_gv_imputations.xls", replace


*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_gv_imputations.dta", clear  	// Open the dataset  
gen wave=5														// Create wave id 


*	Personal identifier & keep variables
keep 					///
/// CONSUMPTION
		fahc*			/// Amount spent on food at home
		fohc*			/// Amount spent on food outside home
/// WEALTH & INCOME variables:
		hrass* 			/// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)	(wave 1 2 4 5 6)
		hgfass* 		/// Household gross financial assets (sum of bacc, bsmf and slti)			(wave 1 2 4 5 6)
		hnfass* 		/// Household net financial assets (hgfass – liab) 							(wave 1 2 4 5 6)
		hnetw* 			/// Household net worth 													(wave 1 2 4 5 6)
		home* 			/// Value of main residence 												(wave 1 2 4 5 6)
		perho* 			/// Percentage of house owned 				---------------->				(wave	 4 5 6)
		vbus* 			/// Value of own business 													(wave 1 2 4 5 6)
		sbus* 			/// Share of own business 													(wave 1 2 4 5 6)
		car* 			/// Value of cars 		 													(wave 1 2 4 5 6)
		ores* 			/// Value of other real estate – Amount 									(wave 1 2 4 5 6)
		mort* 			/// Mortgage on main residence 												(wave 1 2 4 5 6)
		bacc* 			/// Bank accounts															(wave 1 2 4 5 6)
		bsmf* 			/// Bond, stock and mutual funds											(wave 1 2 4 5 6)
		slti*			/// Savings for long-term investments										(wave 1 2 4 5 6)
		liab*			/// Financial liabilities													(wave 1 2 4 5 6)
		bacc* 	 		/// bank accounts
		bsmf* 	 		/// bond, stock and mutual funds
		car* 	 		/// value of cars
		home* 	 		/// value of main residence
		liab* 	 		/// financial liabilities
		mort* 	 		/// mortgage on main residence
		ores* 	 		/// value of other real estate - amount
		ores* 	 		/// value of other real estate
		ores* 	 		/// value of real estate - amount
		otrf* 	 		/// owner, tenant or rent free
		perho* 	 		/// percentage of house owned
		sbus* 	 		/// share of own business
		slti* 	 		/// savings for long-term investments
		vbus* 	 		/// value of own business
		implicat*   	///	Implicat number
		exrate*	 		///	Exchange rate
		thinc2*	 		///	Total household income - Version B
		thinc*	  		///	Total household income - Version A
		hrass*	  		///	Household real assets
		hgfass*	 		///	Household gross financial assets
		hnfass*	 		///	Household net financial assets
		gender*	 		///	Gender
		yedu*	   		///	Years of education
		isced*	  		///	ISCED 1997 coding of education
		sphus*	  		///	Self-perceived health - US scale
		mstat*	  		///	Marital status
		nchild*	 		///	Number of children
		ngrchild*   	///	Number of grandchildren
		eyesightr*  	///	Eyesight reading
		hearing*		///	Hearing
		bmi*			///	Body mass index
		weight*	 		///	Weight
		height*	 		///	Height
		esmoked*		///	Ever smoked daily
		phinact*		///	Physical inactivity
		orienti*		///	Score of orientation in time test
		maxgrip*		///	Maximum of grip strength measures
		doctor*	 		///	Seen/Talked to medical doctor
		hospital*   	///	In hospital last 12 months
		thospital* 		///	Times being patient in hospital
		nhospital* 		///	Total nights stayed in hospital
		cjs*			///	Current job situation
		pwork*	  		///	Did any paid work
		empstat*		///	Employee or self-employed
		lookjob*		///	Looking for job
		fdistress*  	///	Household able to make ends meet
		naly*	   		///	Number of activities last year
		saly*	   		///	Satisfied with no activities
/// Other (e.g. ID)
		ghih  			///	Given help in the household (how many) 	-> based on sp018 (waves 1 2 4 5 6)
		ghto  			///	Given help to others (how many) 		-> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
		maxgrip_f 		/// 
		bmi_f 			/// 
		orienti_f 		/// 
		wave 			///
		mergeid 		///
		hhid5	   		/// Household identifier (wave 5)
		mergeidp5   	/// Partner identifier (wave 5)  
		coupleid5   	//  Couple identifier (wave 5) 

*	mean value for income and wealth (based on the 5 SHARE imputation)
bys mergeid : egen income_implicatmean=mean(thinc)
bys mergeid : egen wealth_implicatmean=mean(hnetw)

*	We only keep one out of the five implicats:
keep if implicat==1 
	
*	Save
save "$share_w5_out/sharew5_gv_imputations.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_gv_imputations.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_gv_imputations.dta", clear  	// Open the dataset  
gen wave=6														// Create wave id 

*	Personal identifier & keep variables	
keep 					///
/// CONSUMPTION
		fahc*			/// Amount spent on food at home
		fohc*			/// Amount spent on food outside home
/// WEALTH & INCOME variables:
		hrass* 			/// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)	(wave 1 2 4 5 6)
		hgfass* 		/// Household gross financial assets (sum of bacc, bsmf and slti)			(wave 1 2 4 5 6)
		hnfass* 		/// Household net financial assets (hgfass – liab) 							(wave 1 2 4 5 6)
		hnetw* 			/// Household net worth 													(wave 1 2 4 5 6)
		home* 			/// Value of main residence 												(wave 1 2 4 5 6)
		perho* 			/// Percentage of house owned 				---------------->				(wave	 4 5 6)
		vbus* 			/// Value of own business 													(wave 1 2 4 5 6)
		sbus* 			/// Share of own business 													(wave 1 2 4 5 6)
		car* 			/// Value of cars 		 													(wave 1 2 4 5 6)
		ores* 			/// Value of other real estate – Amount 									(wave 1 2 4 5 6)
		mort* 			/// Mortgage on main residence 												(wave 1 2 4 5 6)
		bacc* 			/// Bank accounts															(wave 1 2 4 5 6)
		bsmf* 			/// Bond, stock and mutual funds											(wave 1 2 4 5 6)
		slti*			/// Savings for long-term investments										(wave 1 2 4 5 6)
		liab*			/// Financial liabilities													(wave 1 2 4 5 6)
		bacc* 	 		/// bank accounts
		bsmf* 	 		/// bond, stock and mutual funds
		car* 	 		/// value of cars
		home*	 		/// value of main residence
		liab*	 		/// financial liabilities
		mort*	 		/// mortgage on main residence
		ores*	 		/// value of other real estate - amount
		ores*	 		/// value of other real estate
		ores*	 		/// value of real estate - amount
		otrf*	 		/// owner, tenant or rent free
		perho* 	 		/// percentage of house owned
		sbus* 	 		/// share of own business
		slti* 	 		/// savings for long-term investments
		vbus* 	 		/// value of own business
		implicat*   	///	Implicat number
		exrate*	 		///	Exchange rate
		thinc2*	 		///	Total household income - Version B
		thinc*	  		///	Total household income - Version A
		hrass*	  		///	Household real assets
		hgfass*	 		///	Household gross financial assets
		hnfass*	 		///	Household net financial assets
		gender*	 		///	Gender
		yedu*	   		///	Years of education
		isced*	  		///	ISCED 1997 coding of education
		sphus*	  		///	Self-perceived health - US scale
		mstat*	  		///	Marital status
		nchild*	 		///	Number of children
		ngrchild*   	///	Number of grandchildren
		eyesightr*  	///	Eyesight reading
		hearing*		///	Hearing
		bmi*			///	Body mass index
		weight*	 		///	Weight
		height*	 		///	Height
		esmoked*		///	Ever smoked daily
		phinact*		///	Physical inactivity
		orienti*		///	Score of orientation in time test
		maxgrip*		///	Maximum of grip strength measures
		doctor*	 		///	Seen/Talked to medical doctor
		hospital*   	///	In hospital last 12 months
		thospital*  	///	Times being patient in hospital
		nhospital*  	///	Total nights stayed in hospital
		cjs*			///	Current job situation
		pwork*	  		///	Did any paid work
		empstat*		///	Employee or self-employed
		lookjob*		///	Looking for job
		fdistress*  	///	Household able to make ends meet
		naly*	   		///	Number of activities last year
		saly*	   		///	Satisfied with no activities
/// Other (e.g. ID)
		ghih  			///	Given help in the household (how many) 	-> based on sp018 (waves 1 2 4 5 6)
		ghto  			///	Given help to others (how many) 		-> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
		maxgrip_f 		/// 
		bmi_f 			/// 
		orienti_f 		/// 
		wave 			///
		mergeid 		///
		hhid6	   		/// Household identifier (wave 6)
		mergeidp6		/// Partner identifier (wave 6)  
		coupleid6		//  Couple identifier (wave 6)

*	mean value for income and wealth (based on the 5 SHARE imputation)
bys mergeid : egen income_implicatmean=mean(thinc)
bys mergeid : egen wealth_implicatmean=mean(hnetw)

*	We only keep one out of the five implicats:
keep if implicat==1 


*	Save
save "$share_w6_out/sharew6_gv_imputations.dta", replace 
*>> Codebook
codebookout "$codebook/sharew6_gv_imputations.xls", replace


*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_gv_imputations.dta", clear  	// Open the dataset  
gen wave=7														// Create wave id 

*	Personal identifier & keep variables	
keep 					///
/// CONSUMPTION
		fahc*			/// Amount spent on food at home
		fohc*			/// Amount spent on food outside home
/// WEALTH & INCOME variables:
		hrass* 			/// Household real assets (home*perho/100+vbus*sbus/100+car+ ores – mort)	(wave 1 2 4 5 6)
		hgfass* 		/// Household gross financial assets (sum of bacc, bsmf and slti)			(wave 1 2 4 5 6)
		hnfass* 		/// Household net financial assets (hgfass – liab) 							(wave 1 2 4 5 6)
		hnetw* 			/// Household net worth 													(wave 1 2 4 5 6)
		home* 			/// Value of main residence 												(wave 1 2 4 5 6)
		perho* 			/// Percentage of house owned 				---------------->				(wave	 4 5 6)
		vbus* 			/// Value of own business 													(wave 1 2 4 5 6)
		sbus* 			/// Share of own business 													(wave 1 2 4 5 6)
		car* 			/// Value of cars 		 													(wave 1 2 4 5 6)
		ores* 			/// Value of other real estate – Amount 									(wave 1 2 4 5 6)
		mort* 			/// Mortgage on main residence 												(wave 1 2 4 5 6)
		bacc* 			/// Bank accounts															(wave 1 2 4 5 6)
		bsmf* 			/// Bond, stock and mutual funds											(wave 1 2 4 5 6)
		slti*			/// Savings for long-term investments										(wave 1 2 4 5 6)
		liab*			/// Financial liabilities													(wave 1 2 4 5 6)
		bacc* 	 		/// bank accounts
		bsmf* 	 		/// bond, stock and mutual funds
		car* 	 		/// value of cars
		home*	 		/// value of main residence
		liab*	 		/// financial liabilities
		mort*	 		/// mortgage on main residence
		ores*	 		/// value of other real estate - amount
		ores*	 		/// value of other real estate
		ores*	 		/// value of real estate - amount
		otrf*	 		/// owner, tenant or rent free
		perho* 	 		/// percentage of house owned
		sbus* 	 		/// share of own business
		slti* 	 		/// savings for long-term investments
		vbus* 	 		/// value of own business
		implicat*   	///	Implicat number
		exrate*	 		///	Exchange rate
		thinc2*	 		///	Total household income - Version B
		thinc*	  		///	Total household income - Version A
		hrass*	  		///	Household real assets
		hgfass*	 		///	Household gross financial assets
		hnfass*	 		///	Household net financial assets
		gender*	 		///	Gender
		yedu*	   		///	Years of education
		isced*	  		///	ISCED 1997 coding of education
		sphus*	  		///	Self-perceived health - US scale
		mstat*	  		///	Marital status
		nchild*	 		///	Number of children
		ngrchild*   	///	Number of grandchildren
		eyesightr*  	///	Eyesight reading
		hearing*		///	Hearing
		bmi*			///	Body mass index
		weight*	 		///	Weight
		height*	 		///	Height
		esmoked*		///	Ever smoked daily
		phinact*		///	Physical inactivity
		orienti*		///	Score of orientation in time test
		maxgrip*		///	Maximum of grip strength measures
		doctor*	 		///	Seen/Talked to medical doctor
		hospital*   	///	In hospital last 12 months
		thospital*  	///	Times being patient in hospital
		nhospital*  	///	Total nights stayed in hospital
		cjs*			///	Current job situation
		pwork*	  		///	Did any paid work
		empstat*		///	Employee or self-employed
		lookjob*		///	Looking for job
		fdistress*  	///	Household able to make ends meet
		naly*	   		///	Number of activities last year
		saly*	   		///	Satisfied with no activities
/// Other (e.g. ID)
		ghih  			///	Given help in the household (how many) 	-> based on sp018 (waves 1 2 4 5 6)
		ghto  			///	Given help to others (how many) 		-> based on sp008, sp011, sp013 (waves 1 2 4 5 6)
		maxgrip_f 		/// 
		bmi_f 			/// 
		orienti_f 		/// 
		wave 			///
		mergeid 		///
		hhid7	   		/// Household identifier (wave 7)
		mergeidp7		/// Partner identifier (wave 7)  
		coupleid7		//  Couple identifier (wave 7)

*	mean value for income and wealth (based on the 5 SHARE imputation)
bys mergeid : egen income_implicatmean=mean(thinc)
bys mergeid : egen wealth_implicatmean=mean(hnetw)

*	We only keep one out of the five implicats:
keep if implicat==1 


*	Save
save "$share_w7_out/sharew7_gv_imputations.dta", replace 
*>> Codebook
codebookout "$codebook/sharew7_gv_imputations.xls", replace


*----	[  9. Extract & Recode Variables from DN ]---------------------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_dn.dta", clear  	// Open the dataset  
gen wave=1											// Create wave id 

*	Personal identifier & keep variables	
keep 		///
dn014_ 		/// Marital status
wave 		///
mergeid 	///
hhid1	  	///	Household identifier (wave 1)
mergeidp1  	///	Partner identifier (wave 1)  
coupleid1  	// 	Couple identifier (wave 1)   	

*	Save
save "$share_w1_out/sharew1_dn.dta", replace 

*>> Codebook
codebookout "$codebook/sharew1_dn.xls", replace


*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_dn.dta", clear  	// Open the dataset  
gen wave=2											// Create wave id 

*	Personal identifier & keep variables	
keep 		///
dn014_ 		/// Marital status
dn044_ 		/// Marital status changed
wave 		///
mergeid 	///
hhid2	   	/// Household identifier (wave 2)
mergeidp2  	/// Partner identifier (wave 2)  
coupleid2  	//  Couple identifier (wave 2)   
	
*	Save
save "$share_w2_out/sharew2_dn.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_dn.xls", replace


*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_dn.dta", clear  	// Open the dataset  
gen wave=4											// Create wave id 

*	Personal identifier & keep variables	
keep 		///
dn014_ 		/// Marital status
dn044_ 		/// Marital status changed
wave 		///
mergeid 	///
hhid4	   	/// Household identifier (wave 4)
mergeidp4  	/// Partner identifier (wave 4)  
coupleid4  	//  Couple identifier (wave 4)   
	
*	Save
save "$share_w4_out/sharew4_dn.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_dn.xls", replace


*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_dn.dta", clear  	// Open the dataset  
gen wave=5											// Create wave id 


*	Personal identifier & keep variables
keep 		///
dn014_ 		/// Marital status
dn044_ 		/// Marital status changed
wave 		///
mergeid 	///
hhid5	   	/// Household identifier (wave 5)
mergeidp5   /// Partner identifier (wave 5)  
coupleid5   //  Couple identifier (wave 5) 
	
*	Save
save "$share_w5_out/sharew5_dn.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_dn.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_dn.dta", clear  	// Open the dataset  
gen wave=6											// Create wave id 


*	Personal identifier & keep variables	
keep 			///
dn014_ 			/// Marital status
dn044_ 			/// Marital status changed
wave 			///
mergeid 		///
hhid6	   		/// Household identifier (wave 6)
mergeidp6   	/// Partner identifier (wave 6)  
coupleid6   	//  Couple identifier (wave 6)

*	Save
save "$share_w6_out/sharew6_dn.dta", replace 

*>> Codebook
codebookout "$codebook/sharew6_dn.xls", replace


*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_dn.dta", clear  	// Open the dataset  
gen wave=7											// Create wave id 


*	Personal identifier & keep variables	
keep 			///
dn014_ 			/// Marital status
dn044_ 			/// Marital status changed
wave 			///
mergeid 		///
hhid7	   		/// Household identifier (wave 7)
mergeidp7   	/// Partner identifier (wave 7)  
coupleid7   	//  Couple identifier (wave 7)

*	Save
save "$share_w7_out/sharew7_dn.dta", replace 

*>> Codebook
codebookout "$codebook/sharew7_dn.xls", replace


*----	[ 10. Extract & Recode Variables from SP ]---------------------------------------------------------------*

*>> WAVE 1
use "$share_w1_in/sharew1_rel7-0-0_sp.dta", clear  	// Open the dataset  
gen wave=1											// Create wave id 


*	Personal identifier & keep variables	
keep 		///
sp008_	  /// Given help last twelve months
sp009_1	 /// To whom did you give help: person 1
sp009_2	 /// To whom did you give help: person 2
sp009_3	 /// To whom did you give help: person 3
sp010d1_1   /// Help given person 1: personal care
sp010d1_2   /// Help given person 2: personal care
sp010d1_3   /// Help given person 3: personal care
sp010d2_1   /// Help given person 1: practical household help
sp010d2_2   /// Help given person 2: practical household help
sp010d2_3   /// Help given person 3: practical household help
sp010d3_1   /// Help given person 1: help with paperwork
sp010d3_2   /// Help given person 2: help with paperwork
sp010d3_3   /// Help given person 3: help with paperwork
sp011_1	 /// How often given help to person 1
sp011_2	 /// How often given help to person 2
sp011_3	 /// How often given help to person 3
sp012_1	 /// Hours given help to person 1
sp012_2	 /// Hours given help to person 2
sp012_3	 /// Hours given help to person 3
sp013_1	 /// Have you given help to others
sp013_2	 /// Have you given help to others
sp014_	  /// Looked after grandchildren
sp015d1	 /// Looked after child of child 1
sp015d2	 /// Looked after child of child 2
sp015d3	 /// Looked after child of child 3
sp015d4	 /// Looked after child of child 4
sp015d5	 /// Looked after child of child 5
sp015d6	 /// Looked after child of child 6
sp015d7	 /// Looked after child of child 7
sp015d8	 /// Looked after child of child 8
sp015d9	 /// Looked after child of child 9
sp015d10	/// Looked after child of child 10
sp015d11	/// Looked after child of child 11
sp015d12	/// Looked after child of child 12
sp015d13	/// Looked after child of child 13
sp015d14	/// Looked after child of child 14
sp015d15	/// Looked after child of child 15
sp015d16	/// Looked after child of child 16
sp015d17	/// Looked after child of child 17
sp015d18	/// Looked after child of child 18
sp015d19	/// Looked after child of child 19
sp015d20	/// Looked after child of child 20
sp015d21	/// Looked after child of deceased child
sp016_1	 /// How often did you look after child of child 1
sp016_2	 /// How often did you look after child of child 2
sp016_3	 /// How often did you look after child of child 3
sp016_4	 /// How often did you look after child of child 4
sp016_5	 /// How often did you look after child of child 5
sp016_6	 /// How often did you look after child of child 6
sp016_7	 /// How often did you look after child of child 7
sp016_8	 /// How often did you look after child of child 8
sp016_9	 /// How often did you look after child of child 9
sp016_10	/// How often did you look after child of child 10
sp016_11	/// How often did you look after child of child 11
sp016_12	/// How often did you look after child of child 12
sp016_13	/// How often did you look after child of child 13
sp016_14	/// How often did you look after child of child 14
sp016_17	/// How often do you look after child of child 17
sp017_1	 /// Hours looked after child(ren) of child 1
sp017_2	 /// Hours looked after child(ren) of child 2
sp017_3	 /// Hours looked after child(ren) of child 3
sp017_4	 /// Hours looked after child(ren) of child 4
sp017_5	 /// Hours looked after child(ren) of child 5
sp017_6	 /// Hours looked after child(ren) of child 6
sp017_7	 /// Hours looked after child(ren) of child 7
sp017_8	 /// Hours looked after child(ren) of child 8
sp017_9	 /// Hours looked after child(ren) of child 9
sp017_10	/// Hours looked after child(ren) of child 10
sp017_11	/// Hours looked after child(ren) of child 11
sp017_12	/// Hours looked after child(ren) of child 12
sp017_13	/// Hours looked after child(ren) of child 13
sp017_14	/// Hours looked after child(ren) of child 14
sp017_17	/// Hours looked after child(ren) of child 17
sp018_	  /// Given help to someone with personal care in the household
sp019d1		///	R provided help with personal care to: spouse/partner
sp019d2		///	R provided help with personal care to: mother
sp019d3		///	R provided help with personal care to: father
sp019d4		///	R provided help with personal care to: mother-in-law
sp019d5		///	R provided help with personal care to: father-in-law
sp019d6		///	R provided help with personal care to: stepmother
sp019d7		///	R provided help with personal care to: stepfather
sp019d8		///	R provided help with personal care to: brother
sp019d9		///	R provided help with personal care to: sister
sp019d10	///	R provided help with personal care to: child 1
sp019d11	///	R provided help with personal care to: child 2
sp019d12	///	R provided help with personal care to: child 3
sp019d13	///	R provided help with personal care to: child 4
sp019d14	///	R provided help with personal care to: child 5
sp019d15	///	R provided help with personal care to: child 6
sp019d16	///	R provided help with personal care to: child 7
sp019d17	///	R provided help with personal care to: child 8
sp019d18	///	R provided help with personal care to: child 9
sp019d19	///	R provided help with personal care to: other child
sp019d20	///	R provided help with personal care to: son-in-law
sp019d21	///	R provided help with personal care to: daughter-in-law
sp019d22	///	R provided help with personal care to: grandchild
sp019d23	///	R provided help with personal care to: grandparent
sp019d24	///	R provided help with personal care to: aunt
sp019d25	///	R provided help with personal care to: uncle
sp019d26	///	R provided help with personal care to: niece
sp019d27	///	R provided help with personal care to: nephew
sp019d28	///	R provided help with personal care to: other relative
sp019d29	///	R provided help with personal care to: friend
sp019d30	///	R provided help with personal care to: (ex-)colleague
sp019d31	///	R provided help with personal care to: neighbour
sp019d32	///	R provided help with personal care to: ex-spouse/partner
sp019d33	///	R provided help with personal care to: other acquaintance
sp020 		/// 
wave 		///
mergeid 	///
hhid1	   	/// Household identifier (wave 1)
mergeidp1   	/// Partner identifier (wave 1)
coupleid1   	// Couple identifier (wave 1)

*	Save
save "$share_w1_out/sharew1_sp.dta", replace  

*>> Codebook
codebookout "$codebook/sharew1_sp.xls", replace


*>> WAVE 2
use "$share_w2_in/sharew2_rel7-0-0_sp.dta", clear   // Open the dataset  
gen wave=2											// Create wave id 

*	Personal identifier & keep variables	
keep 		///
sp008_	  /// Given help last twelve months
sp009_1	 /// To whom did you give help: person 1
sp009_2	 /// To whom did you give help: person 2
sp009_3	 /// To whom did you give help: person 3
sp010d1_1   /// Help given person 1: personal care
sp010d1_2   /// Help given person 2: personal care
sp010d1_3   /// Help given person 3: personal care
sp010d2_1   /// Help given person 1: practical household help
sp010d2_2   /// Help given person 2: practical household help
sp010d2_3   /// Help given person 3: practical household help
sp010d3_1   /// Help given person 1: help with paperwork
sp010d3_2   /// Help given person 2: help with paperwork
sp010d3_3   /// Help given person 3: help with paperwork
sp011_1	 /// How often given help to person 1
sp011_2	 /// How often given help to person 2
sp011_3	 /// How often given help to person 3
sp012_1	 /// Hours given help to person 1
sp012_2	 /// Hours given help to person 2
sp012_3	 /// Hours given help to person 3
sp013_1	 /// Have you given help to others
sp013_2	 /// Have you given help to others
sp013_3	 /// Have you given help to others
sp014_	  /// Looked after grandchildren
sp015d1	 /// Looked after child of child 1
sp015d2	 /// Looked after child of child 2
sp015d3	 /// Looked after child of child 3
sp015d4	 /// Looked after child of child 4
sp015d5	 /// Looked after child of child 5
sp015d6	 /// Looked after child of child 6
sp015d7	 /// Looked after child of child 7
sp015d8	 /// Looked after child of child 8
sp015d9	 /// Looked after child of child 9
sp015d10	/// Looked after child of child 10
sp015d11	/// Looked after child of child 11
sp015d12	/// Looked after child of child 12
sp015d13	/// Looked after child of child 13
sp015d14	/// Looked after child of child 14
sp015d15	/// Looked after child of child 15
sp015d16	/// Looked after child of child 16
sp015d17	/// Looked after child of child 17
sp015d18	/// Looked after child of child 18
sp015d19	/// Looked after child of child 19
sp015d20	/// Looked after child of child 20
sp015d21	/// Looked after child of deceased child
sp016_1	 /// How often did you look after child of child 1
sp016_2	 /// How often did you look after child of child 2
sp016_3	 /// How often did you look after child of child 3
sp016_4	 /// How often did you look after child of child 4
sp016_5	 /// How often did you look after child of child 5
sp016_6	 /// How often did you look after child of child 6
sp016_7	 /// How often did you look after child of child 7
sp016_8	 /// How often did you look after child of child 8
sp016_9	 /// How often did you look after child of child 9
sp016_10	/// How often did you look after child of child 10
sp016_11	/// How often did you look after child of child 11
sp016_12	/// How often did you look after child of child 12
sp016_13	/// How often did you look after child of child 13
sp016_14	/// How often did you look after child of child 14
sp017_1	 /// Hours looked after child(ren) of child 1
sp017_2	 /// Hours looked after child(ren) of child 2
sp017_3	 /// Hours looked after child(ren) of child 3
sp017_4	 /// Hours looked after child(ren) of child 4
sp017_5	 /// Hours looked after child(ren) of child 5
sp017_6	 /// Hours looked after child(ren) of child 6
sp017_7	 /// Hours looked after child(ren) of child 7
sp017_8	 /// Hours looked after child(ren) of child 8
sp017_9	 /// Hours looked after child(ren) of child 9
sp017_10	/// Hours looked after child(ren) of child 10
sp017_11	/// Hours looked after child(ren) of child 11
sp017_12	/// Hours looked after child(ren) of child 12
sp017_13	/// Hours looked after child(ren) of child 13
sp017_14	/// Hours looked after child(ren) of child 14
sp018_	  /// Given help to someone with personal care in the household
sp019d1	 /// R provided help with personal care to: spouse/partner
sp019d2	 /// R provided help with personal care to: mother
sp019d3	 /// R provided help with personal care to: father
sp019d4	 /// R provided help with personal care to: mother-in-law
sp019d5	 /// R provided help with personal care to: father-in-law
sp019d6	 /// R provided help with personal care to: stepmother
sp019d7	 /// R provided help with personal care to: stepfather
sp019d8	 /// R provided help with personal care to: brother
sp019d9	 /// R provided help with personal care to: sister
sp019d10	/// R provided help with personal care to: child 1
sp019d11	/// R provided help with personal care to: child 2
sp019d12	/// R provided help with personal care to: child 3
sp019d13	/// R provided help with personal care to: child 4
sp019d14	/// R provided help with personal care to: child 5
sp019d15	/// R provided help with personal care to: child 6
sp019d16	/// R provided help with personal care to: child 7
sp019d17	/// R provided help with personal care to: child 8
sp019d18	/// R provided help with personal care to: child 9
sp019d19	/// R provided help with personal care to: other child
sp019d20	/// R provided help with personal care to: son-in-law
sp019d21	/// R provided help with personal care to: daughter-in-law
sp019d22	/// R provided help with personal care to: grandchild
sp019d23	/// R provided help with personal care to: grandparent
sp019d24	/// R provided help with personal care to: aunt
sp019d25	/// R provided help with personal care to: uncle
sp019d26	/// R provided help with personal care to: niece
sp019d27	/// R provided help with personal care to: nephew
sp019d28	/// R provided help with personal care to: other relative
sp019d29	/// R provided help with personal care to: friend
sp019d30	/// R provided help with personal care to: (ex-)colleague
sp019d31	/// R provided help with personal care to: neighbour
sp019d32	/// R provided help with personal care to: ex-spouse/partner
sp019d33	/// R provided help with personal care to: other acquaintance
sp020 		///
wave 		///
mergeid 	///
hhid2	   /// Household identifier (wave 2)
mergeidp2   /// Partner identifier (wave 2)
coupleid2   // Couple identifier (wave 2)
	
*	Save
save "$share_w2_out/sharew2_sp.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew2_sp.xls", replace

*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_sp.dta", clear   	// Open the dataset  
gen wave=4												// Create wave id 


*	Rename other variables for consistency
rename sp009_1sp sp009_1 // To whom did you give help: person 1
rename sp009_2sp sp009_2 // To whom did you give help: person 2
rename sp009_3sp sp009_3 // To whom did you give help: person 3

*	Personal identifier & keep variables	
keep 		///
sp008_	  /// Given help last twelve months
sp009_1  	/// To whom did you give help: person 1
sp009_2  	/// To whom did you give help: person 2
sp009_3  	/// To whom did you give help: person 3
sp011_1	 /// How often given help to person 1
sp011_2	 /// How often given help to person 2
sp011_3	 /// How often given help to person 3
sp013_1	 /// Have you given help to others
sp013_2	 /// Have you given help to others
sp013_3	 /// Have you given help to others
sp014_	  /// Looked after grandchildren
sp015d1	 /// Looked after child of child 1
sp015d2	 /// Looked after child of child 2
sp015d3	 /// Looked after child of child 3
sp015d4	 /// Looked after child of child 4
sp015d5	 /// Looked after child of child 5
sp015d6	 /// Looked after child of child 6
sp015d7	 /// Looked after child of child 7
sp015d8	 /// Looked after child of child 8
sp015d9	 /// Looked after child of child 9
sp015d10	/// Looked after child of child 10
sp015d11	/// Looked after child of child 11
sp015d12	/// Looked after child of child 12
sp015d13	/// Looked after child of child 13
sp015d14	/// Looked after child of child 14
sp015d15	/// Looked after child of child 15
sp015d16	/// Looked after child of child 16
sp015d17	/// Looked after child of child 17
sp015d18	/// Looked after child of child 18
sp015d19	/// Looked after child of child 19
sp015d20	/// Looked after child of child 20
sp015d21	/// Looked after child of deceased child
sp016_1	 /// How often did you look after child of child 1
sp016_2	 /// How often did you look after child of child 2
sp016_3	 /// How often did you look after child of child 3
sp016_4	 /// How often did you look after child of child 4
sp016_5	 /// How often did you look after child of child 5
sp016_6	 /// How often did you look after child of child 6
sp016_7	 /// How often did you look after child of child 7
sp016_8	 /// How often did you look after child of child 8
sp016_9	 /// How often did you look after child of child 9
sp016_10	/// How often did you look after child of child 10
sp016_11	/// How often did you look after child of child 11
sp016_12	/// How often did you look after child of child 12
sp016_13	/// How often did you look after child of child 13
sp016_14	/// How often did you look after child of child 14
sp016_15	/// How often do you look after child of child 15
sp016_16	/// How often do you look after child of child 16
sp016_17	/// How often do you look after child of child 17
sp016_18	/// How often do you look after child of child 18
sp016_19	/// How often do you look after child of child 19
sp016_20	/// How often do you look after child of child 20
sp018_	  /// Given help to someone with personal care in the household
sp019d1sn   /// R provided help with personal care to: social network person 1
sp019d2sn   /// R provided help with personal care to: social network person 2
sp019d3sn   /// R provided help with personal care to: social network person 3
sp019d4sn   /// R provided help with personal care to: social network person 4
sp019d5sn   /// R provided help with personal care to: social network person 5
sp019d6sn   /// R provided help with personal care to: social network person 6
sp019d7sn   /// R provided help with personal care to: social network person 7
sp019d1sp   /// R provided help with personal care to: spouse/partner
sp019d2sp   /// R provided help with personal care to: mother
sp019d3sp   /// R provided help with personal care to: father
sp019d4sp   /// R provided help with personal care to: mother-in-law
sp019d5sp   /// R provided help with personal care to: father-in-law
sp019d6sp   /// R provided help with personal care to: stepmother
sp019d7sp   /// R provided help with personal care to: stepfather
sp019d8sp   /// R provided help with personal care to: brother
sp019d9sp   /// R provided help with personal care to: sister
sp019d19sp  /// R provided help with personal care to: child
sp019d20sp  /// R provided help with personal care to: son-in-law
sp019d21sp  /// R provided help with personal care to: daughter-in-law
sp019d22sp  /// R provided help with personal care to: grandchild
sp019d23sp  /// R provided help with personal care to: grandparent
sp019d24sp  /// R provided help with personal care to: aunt
sp019d25sp  /// R provided help with personal care to: uncle
sp019d26sp  /// R provided help with personal care to: niece
sp019d27sp  /// R provided help with personal care to: nephew
sp019d28sp  /// R provided help with personal care to: other relative
sp019d29sp  /// R provided help with personal care to: friend
sp019d30sp  /// R provided help with personal care to: ex-colleague
sp019d31sp  /// R provided help with personal care to: neighbour
sp019d32sp  /// R provided help with personal care to: ex-spouse/partner
sp019d34sp  /// R provided help with personal care to: step-child/current partner's child
sp019d35sp  /// R provided help with personal care to: minister, priest, or other clergy
sp019d36sp  /// R provided help with personal care to: therapist or other professional helper
sp019d37sp  /// R provided help with personal care to: housekeeper/home health care provider
sp019dno	/// R provided help with personal care to: NONE OF THESE
sp020 		///
wave 		///
mergeid 	///
hhid4		/// Household identifier (wave 4)
mergeidp4	/// Partner identifier (wave 4)
coupleid4	// Couple identifier (wave 4)
	
*	Save
save "$share_w4_out/sharew4_sp.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew4_sp.xls", replace

*>> WAVE 5
use "$share_w5_in/sharew5_rel7-0-0_sp.dta", clear   	// Open the dataset  
gen wave=5												// Create wave id 

*	Personal identifier & keep variables
keep 		///
sp008_		/// Given help last twelve months
sp009_1   	/// To whom did you give help: person 1
sp009_2   	/// To whom did you give help: person 2
sp009_3   	/// To whom did you give help: person 3
sp011_1   	/// How often given help to person 1
sp011_2   	/// How often given help to person 2
sp011_3   	/// How often given help to person 3
sp013_1   	/// Have you given help to others
sp013_2   	/// Have you given help to others
sp013_3   	/// Have you given help to others
sp014_		/// Looked after grandchildren
sp015d1   	/// Looked after child of child 1
sp015d2   	/// Looked after child of child 2
sp015d3   	/// Looked after child of child 3
sp015d4   	/// Looked after child of child 4
sp015d5   	/// Looked after child of child 5
sp015d6   	/// Looked after child of child 6
sp015d7   	/// Looked after child of child 7
sp015d8   	/// Looked after child of child 8
sp015d9   	/// Looked after child of child 9
sp015d10  	/// Looked after child of child 10
sp015d11  	/// Looked after child of child 11
sp015d12  	/// Looked after child of child 12
sp015d13  	/// Looked after child of child 13
sp015d14  	/// Looked after child of child 14
sp015d15  	/// Looked after child of child 15
sp015d16  	/// Looked after child of child 16
sp015d17  	/// Looked after child of child 17
sp015d18  	/// Looked after child of child 18
sp015d19  	/// Looked after child of child 19
sp015d20  	/// Looked after child of child 20
sp015d21  	/// Looked after child of deceased child
sp016_1   	/// How often did you look after child of child 1
sp016_2   	/// How often did you look after child of child 2
sp016_3   	/// How often did you look after child of child 3
sp016_4   	/// How often did you look after child of child 4
sp016_5   	/// How often did you look after child of child 5
sp016_6   	/// How often did you look after child of child 6
sp016_7   	/// How often did you look after child of child 7
sp016_8   	/// How often did you look after child of child 8
sp016_9   	/// How often did you look after child of child 9
sp016_10  	/// How often did you look after child of child 10
sp016_11  	/// How often did you look after child of child 11
sp016_12  	/// How often did you look after child of child 12
sp016_13  	/// How often did you look after child of child 13
sp016_14  	/// How often did you look after child of child 14
sp016_15  	/// How often do you look after child of child 15
sp016_16  	/// How often do you look after child of child 16
sp016_17  	/// How often do you look after child of child 17
sp016_18  	/// How often do you look after child of child 18
sp016_19  	/// How often do you look after child of child 19
sp016_20  	/// How often do you look after child of child 20
sp018_		/// Given help to someone with personal care in the household
sp019d1   	/// R provided help with personal care to: spouse/partner
sp019d2   	/// R provided help with personal care to: mother
sp019d3   	/// R provided help with personal care to: father
sp019d4   	/// R provided help with personal care to: mother-in-law
sp019d5   	/// R provided help with personal care to: father-in-law
sp019d6   	/// R provided help with personal care to: stepmother
sp019d7   	/// R provided help with personal care to: stepfather
sp019d8   	/// R provided help with personal care to: brother
sp019d9   	/// R provided help with personal care to: sister
sp019d10  	/// R provided help with personal care to: child 1
sp019d11  	/// R provided help with personal care to: child 2
sp019d12  	/// R provided help with personal care to: child 3
sp019d13  	/// R provided help with personal care to: child 4
sp019d14  	/// R provided help with personal care to: child 5
sp019d15  	/// R provided help with personal care to: child 6
sp019d16  	/// R provided help with personal care to: child 7
sp019d17  	/// R provided help with personal care to: child 8
sp019d18  	/// R provided help with personal care to: child 9
sp019d19  	/// R provided help with personal care to: other child
sp019d20  	/// R provided help with personal care to: son-in-law
sp019d21  	/// R provided help with personal care to: daughter-in-law
sp019d22  	/// R provided help with personal care to: grandchild
sp019d23  	/// R provided help with personal care to: grandparent
sp019d24  	/// R provided help with personal care to: aunt
sp019d25  	/// R provided help with personal care to: uncle
sp019d26  	/// R provided help with personal care to: niece
sp019d27  	/// R provided help with personal care to: nephew
sp019d28  	/// R provided help with personal care to: other relative
sp019d29  	/// R provided help with personal care to: friend
sp019d30  	/// R provided help with personal care to: (ex-)colleague
sp019d31  	/// R provided help with personal care to: neighbour
sp019d32  	/// R provided help with personal care to: ex-spouse/partner
sp019d33  	/// R provided help with personal care to: other acquaintance
sp020 		///
wave 		///
mergeid 	///
hhid5	   /// Household identifier (wave 5)
mergeidp5   /// Partner identifier (wave 5)
coupleid5   /// Couple identifier (wave 5)
	
*	Save
save "$share_w5_out/sharew5_sp.dta", replace 
	
*>> Codebook
codebookout "$codebook/sharew5_sp.xls", replace


*>> WAVE 6
use "$share_w6_in/sharew6_rel7-0-0_sp.dta", clear   	// Open the dataset  
gen wave=6												// Create wave id 

*	Personal identifier & keep variables	
keep 		///
sp008_		/// Given help last twelve months
sp009_1   	/// To whom did you give help: person 1
sp009_2   	/// To whom did you give help: person 2
sp009_3   	/// To whom did you give help: person 3
sp010d1_1 	/// Help given person 1: personal care
sp010d1_2 	/// Help given person 2: personal care
sp010d1_3 	/// Help given person 3: personal care
sp010d2_1 	/// Help given person 1: practical household help
sp010d2_2 	/// Help given person 2: practical household help
sp010d2_3 	/// Help given person 3: practical household help
sp010d3_1 	/// Help given person 1: help with paperwork
sp010d3_2 	/// Help given person 2: help with paperwork
sp010d3_3 	/// Help given person 3: help with paperwork
sp011_1   	/// How often given help to person 1
sp011_2   	/// How often given help to person 2
sp011_3   	/// How often given help to person 3
sp013_1   	/// Have you given help to others
sp013_2   	/// Have you given help to others
sp013_3   	/// Have you given help to others
sp014_		/// Looked after grandchildren
sp015d1   	/// Looked after child of child 1
sp015d2   	/// Looked after child of child 2
sp015d3   	/// Looked after child of child 3
sp015d4   	/// Looked after child of child 4
sp015d5   	/// Looked after child of child 5
sp015d6   	/// Looked after child of child 6
sp015d7   	/// Looked after child of child 7
sp015d8   	/// Looked after child of child 8
sp015d9   	/// Looked after child of child 9
sp015d10  	/// Looked after child of child 10
sp015d11  	/// Looked after child of child 11
sp015d12  	/// Looked after child of child 12
sp015d13  	/// Looked after child of child 13
sp015d14  	/// Looked after child of child 14
sp015d15  	/// Looked after child of child 15
sp015d16  	/// Looked after child of child 16
sp015d17  	/// Looked after child of child 17
sp015d18  	/// Looked after child of child 18
sp015d19  	/// Looked after child of child 19
sp015d20  	/// Looked after child of child 20
sp015d21  	/// Looked after child of deceased child
sp016_1   	/// How often did you look after child of child 1
sp016_2   	/// How often did you look after child of child 2
sp016_3   	/// How often did you look after child of child 3
sp016_4   	/// How often did you look after child of child 4
sp016_5   	/// How often did you look after child of child 5
sp016_6   	/// How often did you look after child of child 6
sp016_7   	/// How often did you look after child of child 7
sp016_8   	/// How often did you look after child of child 8
sp016_9   	/// How often did you look after child of child 9
sp016_10  	/// How often did you look after child of child 10
sp016_11  	/// How often did you look after child of child 11
sp016_12  	/// How often did you look after child of child 12
sp016_13  	/// How often did you look after child of child 13
sp016_14  	/// How often did you look after child of child 14
sp016_15  	/// How often do you look after child of child 15
sp016_16  	/// How often do you look after child of child 16
sp016_17  	/// How often do you look after child of child 17
sp016_18  	/// How often do you look after child of child 18
sp016_19  	/// How often do you look after child of child 19
sp016_20  	/// How often do you look after child of child 20
sp018_		/// Given help to someone with personal care in the household
sp019d1   	/// R provided help with personal care to: spouse/partner
sp019d2   	/// R provided help with personal care to: mother
sp019d3   	/// R provided help with personal care to: father
sp019d4   	/// R provided help with personal care to: mother-in-law
sp019d5   	/// R provided help with personal care to: father-in-law
sp019d6   	/// R provided help with personal care to: stepmother
sp019d7   	/// R provided help with personal care to: stepfather
sp019d8   	/// R provided help with personal care to: brother
sp019d9   	/// R provided help with personal care to: sister
sp019d10  	/// R provided help with personal care to: child
sp019d11  	/// R provided help with personal care to: step-child/current partner's child
sp019d20  	/// R provided help with personal care to: son-in-law
sp019d21  	/// R provided help with personal care to: daughter-in-law
sp019d22  	/// R provided help with personal care to: grandchild
sp019d23  	/// R provided help with personal care to: grandparent
sp019d24  	/// R provided help with personal care to: aunt
sp019d25  	/// R provided help with personal care to: uncle
sp019d26  	/// R provided help with personal care to: niece
sp019d27  	/// R provided help with personal care to: nephew
sp019d28  	/// R provided help with personal care to: other relative
sp019d29  	/// R provided help with personal care to: friend
sp019d30  	/// R provided help with personal care to: (ex-)colleague
sp019d31  	/// R provided help with personal care to: neighbour
sp019d32  	/// R provided help with personal care to: ex-spouse/partner
sp019d35  	/// R provided help with personal care to: minister, priest, other clergy
sp019d36  	/// R provided help with personal care to: therapist/professional helper
sp019d37  	/// R provided help with personal care to: housekeeper/home health care provider
sp019dno  	/// R provided help with personal care to: none of these
sp020 		///
wave 		///
mergeid 	///
hhid6	   /// Household identifier (wave 6)
mergeidp6   /// Partner identifier (wave 6)
coupleid6   // Couple identifier (wave 6)

*	Save
save "$share_w6_out/sharew6_sp.dta", replace 

*>> Codebook
codebookout "$codebook/sharew6_sp.xls", replace

*>> WAVE 7
use "$share_w7_in/sharew7_rel7-0-0_sp.dta", clear   	// Open the dataset  
gen wave=7												// Create wave id 

*	Personal identifier & keep variables	
keep 		///
sp008_		/// Given help last twelve months
sp009_1   	/// To whom did you give help: person 1
sp009_2   	/// To whom did you give help: person 2
sp009_3   	/// To whom did you give help: person 3
sp010d1_1 	/// Help given person 1: personal care
sp010d1_2 	/// Help given person 2: personal care
sp010d1_3 	/// Help given person 3: personal care
sp010d2_1 	/// Help given person 1: practical household help
sp010d2_2 	/// Help given person 2: practical household help
sp010d2_3 	/// Help given person 3: practical household help
sp010d3_1 	/// Help given person 1: help with paperwork
sp010d3_2 	/// Help given person 2: help with paperwork
sp010d3_3 	/// Help given person 3: help with paperwork
sp011_1   	/// How often given help to person 1
sp011_2   	/// How often given help to person 2
sp011_3   	/// How often given help to person 3
sp013_1   	/// Have you given help to others
sp013_2   	/// Have you given help to others
sp013_3   	/// Have you given help to others
sp014_		/// Looked after grandchildren
sp015d1   	/// Looked after child of child 1
sp015d2   	/// Looked after child of child 2
sp015d3   	/// Looked after child of child 3
sp015d4   	/// Looked after child of child 4
sp015d5   	/// Looked after child of child 5
sp015d6   	/// Looked after child of child 6
sp015d7   	/// Looked after child of child 7
sp015d8   	/// Looked after child of child 8
sp015d9   	/// Looked after child of child 9
sp015d10  	/// Looked after child of child 10
sp015d11  	/// Looked after child of child 11
sp015d12  	/// Looked after child of child 12
sp015d13  	/// Looked after child of child 13
sp015d14  	/// Looked after child of child 14
sp015d15  	/// Looked after child of child 15
sp015d16  	/// Looked after child of child 16
sp015d17  	/// Looked after child of child 17
sp015d18  	/// Looked after child of child 18
sp015d19  	/// Looked after child of child 19
sp015d20  	/// Looked after child of child 20
sp015d21  	/// Looked after child of deceased child
sp016_1   	/// How often did you look after child of child 1
sp016_2   	/// How often did you look after child of child 2
sp016_3   	/// How often did you look after child of child 3
sp016_4   	/// How often did you look after child of child 4
sp016_5   	/// How often did you look after child of child 5
sp016_6   	/// How often did you look after child of child 6
sp016_7   	/// How often did you look after child of child 7
sp016_8   	/// How often did you look after child of child 8
sp016_9   	/// How often did you look after child of child 9
sp016_10  	/// How often did you look after child of child 10
sp016_11  	/// How often did you look after child of child 11
sp016_12  	/// How often did you look after child of child 12
sp016_13  	/// How often did you look after child of child 13
sp016_14  	/// How often did you look after child of child 14
sp016_15  	/// How often do you look after child of child 15
sp016_16  	/// How often do you look after child of child 16
sp016_17  	/// How often do you look after child of child 17
sp016_18  	/// How often do you look after child of child 18
sp016_19  	/// How often do you look after child of child 19
sp016_20  	/// How often do you look after child of child 20
sp018_		/// Given help to someone with personal care in the household
sp019d1   	/// R provided help with personal care to: spouse/partner
sp019d2   	/// R provided help with personal care to: mother
sp019d3   	/// R provided help with personal care to: father
sp019d4   	/// R provided help with personal care to: mother-in-law
sp019d5   	/// R provided help with personal care to: father-in-law
sp019d6   	/// R provided help with personal care to: stepmother
sp019d7   	/// R provided help with personal care to: stepfather
sp019d8   	/// R provided help with personal care to: brother
sp019d9   	/// R provided help with personal care to: sister
sp019d10  	/// R provided help with personal care to: child
sp019d11  	/// R provided help with personal care to: step-child/current partner's child
sp019d20  	/// R provided help with personal care to: son-in-law
sp019d21  	/// R provided help with personal care to: daughter-in-law
sp019d22  	/// R provided help with personal care to: grandchild
sp019d23  	/// R provided help with personal care to: grandparent
sp019d24  	/// R provided help with personal care to: aunt
sp019d25  	/// R provided help with personal care to: uncle
sp019d26  	/// R provided help with personal care to: niece
sp019d27  	/// R provided help with personal care to: nephew
sp019d28  	/// R provided help with personal care to: other relative
sp019d29  	/// R provided help with personal care to: friend
sp019d30  	/// R provided help with personal care to: (ex-)colleague
sp019d31  	/// R provided help with personal care to: neighbour
sp019d32  	/// R provided help with personal care to: ex-spouse/partner
sp019d35  	/// R provided help with personal care to: minister, priest, other clergy
sp019d36  	/// R provided help with personal care to: therapist/professional helper
sp019d37  	/// R provided help with personal care to: housekeeper/home health care provider
sp019dno  	/// R provided help with personal care to: none of these
sp020 		///
wave 		///
mergeid 	///
hhid7	   /// Household identifier (wave 7)
mergeidp7   /// Partner identifier (wave 7)
coupleid7   // Couple identifier (wave 7)

*	Save
save "$share_w7_out/sharew7_sp.dta", replace 

*>> Codebook
codebookout "$codebook/sharew7_sp.xls", replace

*----	[ 11. Extract & Recode Variables from SN ]---------------------------------------------------------------*

*>> WAVE 4
use "$share_w4_in/sharew4_rel7-0-0_sn.dta", clear  	// Open the dataset  
gen wave=4											// Create wave id 

*	Personal identifier & keep variables	
keep 		///
sn005_1 	/// Network relationship: SN person #
sn005_2  	///
sn005_3  	///
sn005_4  	///
sn005_5  	///
sn005_6  	///
sn005_7 	///
mergeid 	///
hhid4	   	/// Household identifier (wave 4)
mergeidp4   	/// Partner identifier (wave 4)
coupleid4   	// 	Couple identifier (wave 4)

*	Save
save "$share_w4_out/sharew4_sn.dta", replace  

*>> Codebook 
codebookout "$codebook/sharew4_sn.xls", replace

*----	[ 12. Merge modules per wave ]---------------------------------------------------------------------------*

*	Wave 1 
use "$share_w1_out/sharew1_cv_r.dta", clear 

	merge 1:1 mergeid using "$share_w1_out/sharew1_mh.dta" 				
	ta _merge
	keep if _merge==3
	drop _merge
	
	merge 1:1 mergeid using "$share_w1_out/sharew1_gv_health.dta" 		
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w1_out/sharew1_ph.dta" 				
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w1_out/sharew1_gv_imputations.dta" 	
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w1_out/sharew1_dn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w1_out/sharew1_br.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w1_out/sharew1_sp.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w1_out/sharew1_technical_variables.dta" 				
	ta _merge
	drop _merge

*>> ADL partner
*ph049d1 Difficulties: dressing, including shoes and socks
gen	 padl_dress=.
replace padl_dress=ph049d1[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace padl_dress=ph049d1[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace padl_dress=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_dress "ADL: dressing, including shoes and socks"
lab val padl_dress lblpadl
lab def lblpadl	   	/// 
	   -2 "Refusal" 		///
	   -1 "Don't know" 		///
		0 "Not selected"	/// 
		1 "Selected"   		///
	   -9 "Filtered: single or no partner in household", add

*ph049d2 Difficulties: walking across a room
gen	 padl_walk=.
replace padl_walk=ph049d2[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace padl_walk=ph049d2[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace padl_walk=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_walk "ADL: walking across a room"
lab val padl_walk lblpadl

*ph049d3 Difficulties: bathing or showering
gen	 padl_bathing=.
replace padl_bathing=ph049d3[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace padl_bathing=ph049d3[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace padl_bathing=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bathing "ADL: bathing or showering"
lab val padl_bathing lblpadl

*ph049d4 Difficulties: eating, cutting up food
gen	 padl_eating=.
replace padl_eating=ph049d4[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace padl_eating=ph049d4[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace padl_eating=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_eating "ADL: eating, cutting up food"
lab val padl_eating lblpadl

*ph049d5 Difficulties: getting in or out of bed
gen	 padl_bed=.
replace padl_bed=ph049d5[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace padl_bed=ph049d5[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace padl_bed=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bed "ADL: getting in or out of bed"
lab val padl_bed lblpadl

*ph049d6 Difficulties: using the toilet, incl getting up or down
gen	 padl_toilet=.
replace padl_toilet=ph049d6[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace padl_toilet=ph049d6[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace padl_toilet=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_toilet "ADL: using the toilet, incl getting up or down"
lab val padl_toilet lblpadl

*>> IADL partner
*IADL: Difficulties: telephone calls
gen	 piadl_phone=.
replace piadl_phone=ph049d10[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace piadl_phone=ph049d10[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace piadl_phone=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_phone "IADL: Difficulties: telephone calls"
lab val piadl_phone lblpadl

*IADL: Difficulties: taking medications
gen	 piadl_medications=.
replace piadl_medications=ph049d11[_n-1] if coupleid1==coupleid1[_n-1] ///
			  						  & coupleid1!=""
replace piadl_medications=ph049d11[_n+1] if coupleid1==coupleid1[_n+1] ///
			  						  & coupleid1!=""
replace piadl_medications=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_medications "IADL: Difficulties: taking medications"
lab val piadl_medications lblpadl

*IADL: Difficulties: doing work around the house or garden
gen	 piadl_garden=.
replace piadl_garden=ph049d12[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace piadl_garden=ph049d12[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace piadl_garden=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_garden "IADL: Difficulties: doing work around the house or garden"
lab val piadl_garden lblpadl

*IADL: Difficulties: managing money
gen	 piadl_money=.
replace piadl_money=ph049d13[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace piadl_money=ph049d13[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace piadl_money=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_money "IADL: Difficulties: managing money"
lab val piadl_money lblpadl

*IADL: Difficulties: using a map in a strange place
gen	 piadl_map=.
replace piadl_map=ph049d7[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace piadl_map=ph049d7[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace piadl_map=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_map "IADL: Difficulties: using a map in a strange place"
lab val piadl_map lblpadl

*IADL: Difficulties: preparing a hot meal
gen	 piadl_meal=.
replace piadl_meal=ph049d8[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace piadl_meal=ph049d8[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace piadl_meal=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_meal "IADL: Difficulties: preparing a hot meal"
lab val piadl_meal lblpadl

*IADL: Difficulties: shopping for groceries
gen	 piadl_shopping=.
replace piadl_shopping=ph049d9[_n-1] if coupleid1==coupleid1[_n-1] ///
									 & coupleid1!=""
replace piadl_shopping=ph049d9[_n+1] if coupleid1==coupleid1[_n+1] ///
									 & coupleid1!=""
replace piadl_shopping=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_shopping "IADL: Difficulties: shopping for groceries"
lab val piadl_shopping lblpadl

*>> Save		
save "$share_w1_out/sharew1_merged_a.dta", replace


*	Wave 2
use "$share_w2_out/sharew2_cv_r.dta", clear 

	merge 1:1 mergeid using "$share_w2_out/sharew2_ph.dta" 				
	ta _merge
	keep if _merge==3
	drop _merge
	
	merge 1:1 mergeid using "$share_w2_out/sharew2_mh.dta" 				
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w2_out/sharew2_gv_health.dta" 		
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w2_out/sharew2_gv_imputations.dta" 	
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w2_out/sharew2_dn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w2_out/sharew2_br.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w2_out/sharew2_sp.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w2_out/sharew2_technical_variables.dta" 				
	ta _merge
	drop _merge

*>> ADL partner
*ph049d1 Difficulties: dressing, including shoes and socks
gen	 padl_dress=.
replace padl_dress=ph049d1[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace padl_dress=ph049d1[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace padl_dress=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_dress "ADL: dressing, including shoes and socks"
lab val padl_dress lblpadl
lab def lblpadl	   			/// 
	   -2 "Refusal" 		///
	   -1 "Don't know" 		///
		0 "Not selected"	/// 
		1 "Selected"   		///
	   -9 "Filtered: single or no partner in household", add

*ph049d2 Difficulties: walking across a room
gen	 padl_walk=.
replace padl_walk=ph049d2[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace padl_walk=ph049d2[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace padl_walk=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_walk "ADL: walking across a room"
lab val padl_walk lblpadl

*ph049d3 Difficulties: bathing or showering
gen	 padl_bathing=.
replace padl_bathing=ph049d3[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace padl_bathing=ph049d3[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace padl_bathing=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bathing "ADL: bathing or showering"
lab val padl_bathing lblpadl

*ph049d4 Difficulties: eating, cutting up food
gen	 padl_eating=.
replace padl_eating=ph049d4[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace padl_eating=ph049d4[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace padl_eating=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_eating "ADL: eating, cutting up food"
lab val padl_eating lblpadl

*ph049d5 Difficulties: getting in or out of bed
gen	 padl_bed=.
replace padl_bed=ph049d5[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace padl_bed=ph049d5[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace padl_bed=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bed "ADL: getting in or out of bed"
lab val padl_bed lblpadl

*ph049d6 Difficulties: using the toilet, incl getting up or down
gen	 padl_toilet=.
replace padl_toilet=ph049d6[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace padl_toilet=ph049d6[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace padl_toilet=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_toilet "ADL: using the toilet, incl getting up or down"
lab val padl_toilet lblpadl

*>> IADL partner
*IADL: Difficulties: telephone calls
gen	 piadl_phone=.
replace piadl_phone=ph049d10[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace piadl_phone=ph049d10[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace piadl_phone=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_phone "IADL: Difficulties: telephone calls"
lab val piadl_phone lblpadl

*IADL: Difficulties: taking medications
gen	 piadl_medications=.
replace piadl_medications=ph049d11[_n-1] if coupleid2==coupleid2[_n-1] ///
			  						  & coupleid2!=""
replace piadl_medications=ph049d11[_n+1] if coupleid2==coupleid2[_n+1] ///
			  						  & coupleid2!=""
replace piadl_medications=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_medications "IADL: Difficulties: taking medications"
lab val piadl_medications lblpadl

*IADL: Difficulties: doing work around the house or garden
gen	 piadl_garden=.
replace piadl_garden=ph049d12[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace piadl_garden=ph049d12[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace piadl_garden=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_garden "IADL: Difficulties: doing work around the house or garden"
lab val piadl_garden lblpadl

*IADL: Difficulties: managing money
gen	 piadl_money=.
replace piadl_money=ph049d13[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace piadl_money=ph049d13[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace piadl_money=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_money "IADL: Difficulties: managing money"
lab val piadl_money lblpadl

*IADL: Difficulties: using a map in a strange place
gen	 piadl_map=.
replace piadl_map=ph049d7[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace piadl_map=ph049d7[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace piadl_map=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_map "IADL: Difficulties: using a map in a strange place"
lab val piadl_map lblpadl

*IADL: Difficulties: preparing a hot meal
gen	 piadl_meal=.
replace piadl_meal=ph049d8[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace piadl_meal=ph049d8[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace piadl_meal=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_meal "IADL: Difficulties: preparing a hot meal"
lab val piadl_meal lblpadl

*IADL: Difficulties: shopping for groceries
gen	 piadl_shopping=.
replace piadl_shopping=ph049d9[_n-1] if coupleid2==coupleid2[_n-1] ///
									 & coupleid2!=""
replace piadl_shopping=ph049d9[_n+1] if coupleid2==coupleid2[_n+1] ///
									 & coupleid2!=""
replace piadl_shopping=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_shopping "IADL: Difficulties: shopping for groceries"
lab val piadl_shopping lblpadl

*>> Save		
save "$share_w2_out/sharew2_merged_a.dta", replace


*	Wave 4
use "$share_w4_out/sharew4_cv_r.dta", clear 

	merge 1:1 mergeid using "$share_w4_out/sharew4_ph.dta" 				
	ta _merge
	keep if _merge==3
	drop _merge
	
	merge 1:1 mergeid using "$share_w4_out/sharew4_mh.dta" 				
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w4_out/sharew4_gv_health.dta" 		
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w4_out/sharew4_gv_imputations.dta" 	
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w4_out/sharew4_dn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w4_out/sharew4_br.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w4_out/sharew4_sp.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w4_out/sharew4_sn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w4_out/sharew4_technical_variables.dta" 				
	ta _merge
	drop _merge

*>> ADL partner
*ph049d1 Difficulties: dressing, including shoes and socks
gen	 padl_dress=.
replace padl_dress=ph049d1[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace padl_dress=ph049d1[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace padl_dress=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_dress "ADL: dressing, including shoes and socks"
lab val padl_dress lblpadl
lab def lblpadl	   	/// 
	   -2 "Refusal" 		///
	   -1 "Don't know" 		///
		0 "Not selected"	/// 
		1 "Selected"   		///
	   -9 "Filtered: single or no partner in household", add

*ph049d2 Difficulties: walking across a room
gen	 padl_walk=.
replace padl_walk=ph049d2[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace padl_walk=ph049d2[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace padl_walk=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_walk "ADL: walking across a room"
lab val padl_walk lblpadl

*ph049d3 Difficulties: bathing or showering
gen	 padl_bathing=.
replace padl_bathing=ph049d3[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace padl_bathing=ph049d3[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace padl_bathing=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bathing "ADL: bathing or showering"
lab val padl_bathing lblpadl

*ph049d4 Difficulties: eating, cutting up food
gen	 padl_eating=.
replace padl_eating=ph049d4[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace padl_eating=ph049d4[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace padl_eating=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_eating "ADL: eating, cutting up food"
lab val padl_eating lblpadl

*ph049d5 Difficulties: getting in or out of bed
gen	 padl_bed=.
replace padl_bed=ph049d5[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace padl_bed=ph049d5[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace padl_bed=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bed "ADL: getting in or out of bed"
lab val padl_bed lblpadl

*ph049d6 Difficulties: using the toilet, incl getting up or down
gen	 padl_toilet=.
replace padl_toilet=ph049d6[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace padl_toilet=ph049d6[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace padl_toilet=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_toilet "ADL: using the toilet, incl getting up or down"
lab val padl_toilet lblpadl

*>> IADL partner
*IADL: Difficulties: telephone calls
gen	 piadl_phone=.
replace piadl_phone=ph049d10[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace piadl_phone=ph049d10[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace piadl_phone=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_phone "IADL: Difficulties: telephone calls"
lab val piadl_phone lblpadl


*IADL: Difficulties: taking medications
gen	 piadl_medications=.
replace piadl_medications=ph049d11[_n-1] if coupleid4==coupleid4[_n-1] ///
			  						  & coupleid4!=""
replace piadl_medications=ph049d11[_n+1] if coupleid4==coupleid4[_n+1] ///
			  						  & coupleid4!=""
replace piadl_medications=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_medications "IADL: Difficulties: taking medications"
lab val piadl_medications lblpadl


*IADL: Difficulties: doing work around the house or garden
gen	 piadl_garden=.
replace piadl_garden=ph049d12[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace piadl_garden=ph049d12[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace piadl_garden=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_garden "IADL: Difficulties: doing work around the house or garden"
lab val piadl_garden lblpadl

*IADL: Difficulties: managing money
gen	 piadl_money=.
replace piadl_money=ph049d13[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace piadl_money=ph049d13[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace piadl_money=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_money "IADL: Difficulties: managing money"
lab val piadl_money lblpadl

*IADL: Difficulties: using a map in a strange place
gen	 piadl_map=.
replace piadl_map=ph049d7[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace piadl_map=ph049d7[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace piadl_map=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_map "IADL: Difficulties: using a map in a strange place"
lab val piadl_map lblpadl

*IADL: Difficulties: preparing a hot meal
gen	 piadl_meal=.
replace piadl_meal=ph049d8[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace piadl_meal=ph049d8[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace piadl_meal=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_meal "IADL: Difficulties: preparing a hot meal"
lab val piadl_meal lblpadl

*IADL: Difficulties: shopping for groceries
gen	 piadl_shopping=.
replace piadl_shopping=ph049d9[_n-1] if coupleid4==coupleid4[_n-1] ///
									 & coupleid4!=""
replace piadl_shopping=ph049d9[_n+1] if coupleid4==coupleid4[_n+1] ///
									 & coupleid4!=""
replace piadl_shopping=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_shopping "IADL: Difficulties: shopping for groceries"
lab val piadl_shopping lblpadl

*>> Save		
save "$share_w4_out/sharew4_merged_a.dta", replace


*	Wave 5
use "$share_w5_out/sharew5_cv_r.dta", clear 

	merge 1:1 mergeid using "$share_w5_out/sharew5_ph.dta" 				
	ta _merge
	keep if _merge==3
	drop _merge
	
	merge 1:1 mergeid using "$share_w5_out/sharew5_mh.dta" 				
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w5_out/sharew5_gv_health.dta" 		
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w5_out/sharew5_gv_imputations.dta" 	
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w5_out/sharew5_dn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w5_out/sharew5_br.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w5_out/sharew5_sp.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w5_out/sharew5_technical_variables.dta" 				
	ta _merge
	drop _merge

*>> ADL partner
*ph049d1 Difficulties: dressing, including shoes and socks
gen	 padl_dress=.
replace padl_dress=ph049d1[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace padl_dress=ph049d1[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace padl_dress=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_dress "ADL: dressing, including shoes and socks"
lab val padl_dress lblpadl
lab def lblpadl	   	/// 
	   -2 "Refusal" 		///
	   -1 "Don't know" 		///
		0 "Not selected"	/// 
		1 "Selected"   		///
	   -9 "Filtered: single or no partner in household", add

*ph049d2 Difficulties: walking across a room
gen	 padl_walk=.
replace padl_walk=ph049d2[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace padl_walk=ph049d2[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace padl_walk=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_walk "ADL: walking across a room"
lab val padl_walk lblpadl

*ph049d3 Difficulties: bathing or showering
gen	 padl_bathing=.
replace padl_bathing=ph049d3[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace padl_bathing=ph049d3[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace padl_bathing=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bathing "ADL: bathing or showering"
lab val padl_bathing lblpadl

*ph049d4 Difficulties: eating, cutting up food
gen	 padl_eating=.
replace padl_eating=ph049d4[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace padl_eating=ph049d4[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace padl_eating=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_eating "ADL: eating, cutting up food"
lab val padl_eating lblpadl

*ph049d5 Difficulties: getting in or out of bed
gen	 padl_bed=.
replace padl_bed=ph049d5[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace padl_bed=ph049d5[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace padl_bed=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bed "ADL: getting in or out of bed"
lab val padl_bed lblpadl

*ph049d6 Difficulties: using the toilet, incl getting up or down
gen	 padl_toilet=.
replace padl_toilet=ph049d6[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace padl_toilet=ph049d6[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace padl_toilet=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_toilet "ADL: using the toilet, incl getting up or down"
lab val padl_toilet lblpadl

*>> IADL partner
*IADL: Difficulties: telephone calls
gen	 piadl_phone=.
replace piadl_phone=ph049d10[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace piadl_phone=ph049d10[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace piadl_phone=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_phone "IADL: Difficulties: telephone calls"
lab val piadl_phone lblpadl


*IADL: Difficulties: taking medications
gen	 piadl_medications=.
replace piadl_medications=ph049d11[_n-1] if coupleid5==coupleid5[_n-1] ///
			  						  & coupleid5!=""
replace piadl_medications=ph049d11[_n+1] if coupleid5==coupleid5[_n+1] ///
			  						  & coupleid5!=""
replace piadl_medications=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_medications "IADL: Difficulties: taking medications"
lab val piadl_medications lblpadl


*IADL: Difficulties: doing work around the house or garden
gen	 piadl_garden=.
replace piadl_garden=ph049d12[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace piadl_garden=ph049d12[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace piadl_garden=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_garden "IADL: Difficulties: doing work around the house or garden"
lab val piadl_garden lblpadl

*IADL: Difficulties: managing money
gen	 piadl_money=.
replace piadl_money=ph049d13[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace piadl_money=ph049d13[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace piadl_money=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_money "IADL: Difficulties: managing money"
lab val piadl_money lblpadl

*IADL: Difficulties: using a map in a strange place
gen	 piadl_map=.
replace piadl_map=ph049d7[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace piadl_map=ph049d7[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace piadl_map=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_map "IADL: Difficulties: using a map in a strange place"
lab val piadl_map lblpadl

*IADL: Difficulties: preparing a hot meal
gen	 piadl_meal=.
replace piadl_meal=ph049d8[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace piadl_meal=ph049d8[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace piadl_meal=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_meal "IADL: Difficulties: preparing a hot meal"
lab val piadl_meal lblpadl

*IADL: Difficulties: shopping for groceries
gen	 piadl_shopping=.
replace piadl_shopping=ph049d9[_n-1] if coupleid5==coupleid5[_n-1] ///
									 & coupleid5!=""
replace piadl_shopping=ph049d9[_n+1] if coupleid5==coupleid5[_n+1] ///
									 & coupleid5!=""
replace piadl_shopping=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_shopping "IADL: Difficulties: shopping for groceries"
lab val piadl_shopping lblpadl

*>> Save		
save "$share_w5_out/sharew5_merged_a.dta", replace


*	Wave 6
use "$share_w6_out/sharew6_cv_r.dta", clear 

	merge 1:1 mergeid using "$share_w6_out/sharew6_ph.dta" 				
	ta _merge
	keep if _merge==3
	drop _merge
	
	merge 1:1 mergeid using "$share_w6_out/sharew6_mh.dta" 				
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w6_out/sharew6_gv_health.dta" 		
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w6_out/sharew6_gv_imputations.dta" 	
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w6_out/sharew6_dn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w6_out/sharew6_br.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w6_out/sharew6_sp.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w6_out/sharew6_technical_variables.dta" 				
	ta _merge
	drop _merge

*>> ADL partner
*ph049d1 Difficulties: dressing, including shoes and socks
gen	 padl_dress=.
replace padl_dress=ph049d1[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace padl_dress=ph049d1[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace padl_dress=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_dress "ADL: dressing, including shoes and socks"
lab val padl_dress lblpadl
lab def lblpadl	   			/// 
	   -2 "Refusal" 		///
	   -1 "Don't know" 		///
		0 "Not selected"	/// 
		1 "Selected"   		///
	   -9 "Filtered: single or no partner in household", add

*ph049d2 Difficulties: walking across a room
gen	 padl_walk=.
replace padl_walk=ph049d2[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace padl_walk=ph049d2[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace padl_walk=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_walk "ADL: walking across a room"
lab val padl_walk lblpadl

*ph049d3 Difficulties: bathing or showering
gen	 padl_bathing=.
replace padl_bathing=ph049d3[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace padl_bathing=ph049d3[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace padl_bathing=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bathing "ADL: bathing or showering"
lab val padl_bathing lblpadl

*ph049d4 Difficulties: eating, cutting up food
gen	 padl_eating=.
replace padl_eating=ph049d4[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace padl_eating=ph049d4[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace padl_eating=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_eating "ADL: eating, cutting up food"
lab val padl_eating lblpadl

*ph049d5 Difficulties: getting in or out of bed
gen	 padl_bed=.
replace padl_bed=ph049d5[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace padl_bed=ph049d5[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace padl_bed=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bed "ADL: getting in or out of bed"
lab val padl_bed lblpadl

*ph049d6 Difficulties: using the toilet, incl getting up or down
gen	 padl_toilet=.
replace padl_toilet=ph049d6[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace padl_toilet=ph049d6[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace padl_toilet=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_toilet "ADL: using the toilet, incl getting up or down"
lab val padl_toilet lblpadl

*>> IADL partner
*IADL: Difficulties: telephone calls
gen	 piadl_phone=.
replace piadl_phone=ph049d10[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace piadl_phone=ph049d10[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace piadl_phone=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_phone "IADL: Difficulties: telephone calls"
lab val piadl_phone lblpadl


*IADL: Difficulties: taking medications
gen	 piadl_medications=.
replace piadl_medications=ph049d11[_n-1] if coupleid6==coupleid6[_n-1] ///
			  						  & coupleid6!=""
replace piadl_medications=ph049d11[_n+1] if coupleid6==coupleid6[_n+1] ///
			  						  & coupleid6!=""
replace piadl_medications=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_medications "IADL: Difficulties: taking medications"
lab val piadl_medications lblpadl


*IADL: Difficulties: doing work around the house or garden
gen	 piadl_garden=.
replace piadl_garden=ph049d12[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace piadl_garden=ph049d12[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace piadl_garden=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_garden "IADL: Difficulties: doing work around the house or garden"
lab val piadl_garden lblpadl

*IADL: Difficulties: managing money
gen	 piadl_money=.
replace piadl_money=ph049d13[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace piadl_money=ph049d13[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace piadl_money=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_money "IADL: Difficulties: managing money"
lab val piadl_money lblpadl

*IADL: Difficulties: using a map in a strange place
gen	 piadl_map=.
replace piadl_map=ph049d7[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace piadl_map=ph049d7[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace piadl_map=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_map "IADL: Difficulties: using a map in a strange place"
lab val piadl_map lblpadl

*IADL: Difficulties: preparing a hot meal
gen	 piadl_meal=.
replace piadl_meal=ph049d8[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace piadl_meal=ph049d8[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace piadl_meal=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_meal "IADL: Difficulties: preparing a hot meal"
lab val piadl_meal lblpadl

*IADL: Difficulties: shopping for groceries
gen	 piadl_shopping=.
replace piadl_shopping=ph049d9[_n-1] if coupleid6==coupleid6[_n-1] ///
									 & coupleid6!=""
replace piadl_shopping=ph049d9[_n+1] if coupleid6==coupleid6[_n+1] ///
									 & coupleid6!=""
replace piadl_shopping=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_shopping "IADL: Difficulties: shopping for groceries"
lab val piadl_shopping lblpadl

*>> Save			
save "$share_w6_out/sharew6_merged_a.dta", replace


*	Wave 7
use "$share_w7_out/sharew7_cv_r.dta", clear 

	merge 1:1 mergeid using "$share_w7_out/sharew7_ph.dta" 				
	ta _merge
	keep if _merge==3
	drop _merge
	
	merge 1:1 mergeid using "$share_w7_out/sharew7_mh.dta" 				
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w7_out/sharew7_gv_health.dta" 		
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w7_out/sharew7_gv_imputations.dta" 	
	ta _merge
	drop _merge
	
	merge 1:1 mergeid using "$share_w7_out/sharew7_dn.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w7_out/sharew7_br.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w7_out/sharew7_sp.dta" 				
	ta _merge
	drop _merge

	merge 1:1 mergeid using "$share_w7_out/sharew7_technical_variables.dta" 				
	ta _merge
	drop _merge

*>> ADL partner
*ph049d1 Difficulties: dressing, including shoes and socks
gen	 padl_dress=.
replace padl_dress=ph049d1[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace padl_dress=ph049d1[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace padl_dress=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_dress "ADL: dressing, including shoes and socks"
lab val padl_dress lblpadl
lab def lblpadl	   		/// 
	   -2 "Refusal" 		///
	   -1 "Don't know" 		///
		0 "Not selected"	/// 
		1 "Selected"   		///
	   -9 "Filtered: single or no partner in household", add

*ph049d2 Difficulties: walking across a room
gen	 padl_walk=.
replace padl_walk=ph049d2[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace padl_walk=ph049d2[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace padl_walk=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_walk "ADL: walking across a room"
lab val padl_walk lblpadl

*ph049d3 Difficulties: bathing or showering
gen	 padl_bathing=.
replace padl_bathing=ph049d3[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace padl_bathing=ph049d3[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace padl_bathing=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bathing "ADL: bathing or showering"
lab val padl_bathing lblpadl

*ph049d4 Difficulties: eating, cutting up food
gen	 padl_eating=.
replace padl_eating=ph049d4[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace padl_eating=ph049d4[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace padl_eating=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_eating "ADL: eating, cutting up food"
lab val padl_eating lblpadl

*ph049d5 Difficulties: getting in or out of bed
gen	 padl_bed=.
replace padl_bed=ph049d5[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace padl_bed=ph049d5[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace padl_bed=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_bed "ADL: getting in or out of bed"
lab val padl_bed lblpadl

*ph049d6 Difficulties: using the toilet, incl getting up or down
gen	 padl_toilet=.
replace padl_toilet=ph049d6[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace padl_toilet=ph049d6[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace padl_toilet=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var padl_toilet "ADL: using the toilet, incl getting up or down"
lab val padl_toilet lblpadl

*>> IADL partner
*IADL: Difficulties: telephone calls
gen	 piadl_phone=.
replace piadl_phone=ph049d10[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace piadl_phone=ph049d10[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace piadl_phone=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_phone "IADL: Difficulties: telephone calls"
lab val piadl_phone lblpadl


*IADL: Difficulties: taking medications
gen	 piadl_medications=.
replace piadl_medications=ph049d11[_n-1] if coupleid7==coupleid7[_n-1] ///
			  						  & coupleid7!=""
replace piadl_medications=ph049d11[_n+1] if coupleid7==coupleid7[_n+1] ///
			  						  & coupleid7!=""
replace piadl_medications=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_medications "IADL: Difficulties: taking medications"
lab val piadl_medications lblpadl


*IADL: Difficulties: doing work around the house or garden
gen	 piadl_garden=.
replace piadl_garden=ph049d12[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace piadl_garden=ph049d12[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace piadl_garden=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_garden "IADL: Difficulties: doing work around the house or garden"
lab val piadl_garden lblpadl

*IADL: Difficulties: managing money
gen	 piadl_money=.
replace piadl_money=ph049d13[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace piadl_money=ph049d13[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace piadl_money=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_money "IADL: Difficulties: managing money"
lab val piadl_money lblpadl

*IADL: Difficulties: using a map in a strange place
gen	 piadl_map=.
replace piadl_map=ph049d7[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace piadl_map=ph049d7[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace piadl_map=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_map "IADL: Difficulties: using a map in a strange place"
lab val piadl_map lblpadl

*IADL: Difficulties: preparing a hot meal
gen	 piadl_meal=.
replace piadl_meal=ph049d8[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace piadl_meal=ph049d8[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace piadl_meal=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_meal "IADL: Difficulties: preparing a hot meal"
lab val piadl_meal lblpadl

*IADL: Difficulties: shopping for groceries
gen	 piadl_shopping=.
replace piadl_shopping=ph049d9[_n-1] if coupleid7==coupleid7[_n-1] ///
									 & coupleid7!=""
replace piadl_shopping=ph049d9[_n+1] if coupleid7==coupleid7[_n+1] ///
									 & coupleid7!=""
replace piadl_shopping=-9 if partnerinhh==3 | partnerinhh==97 | partnerinhh==-9

lab var piadl_shopping "IADL: Difficulties: shopping for groceries"
lab val piadl_shopping lblpadl

*>> Save 			
save "$share_w7_out/sharew7_merged_a.dta", replace


*----	[ 13. Append waves to panel long format ]----------------------------------------------------------------*

*>> Append single wave files to one long file:
use		  "$share_w1_out/sharew1_merged_a.dta", clear
append using "$share_w2_out/sharew2_merged_a.dta"
append using "$share_w4_out/sharew4_merged_a.dta"
append using "$share_w5_out/sharew5_merged_a.dta"
append using "$share_w6_out/sharew6_merged_a.dta"
append using "$share_w7_out/sharew7_merged_a.dta"
append using "$share_cv_r/sharewX_rel7-0-0_gv_allwaves_cv_r.dta"


*----	[10. Create country-level variables (e.g. inflation multiplier variables,etc.) ]-------------------------*

*>> isocountry - codes adapted to ISO-codes  
gen	 isocountry =   .				  
replace isocountry = 040 if country==11
replace isocountry = 276 if country==12
replace isocountry = 752 if country==13
replace isocountry = 528 if country==14
replace isocountry = 724 if country==15
replace isocountry = 380 if country==16
replace isocountry = 250 if country==17
replace isocountry = 208 if country==18
replace isocountry = 300 if country==19
replace isocountry = 756 if country==20
replace isocountry = 056 if country==23
replace isocountry = 376 if country==25

lab define lab_isocountry  	040 "Austria"		276 "Germany"   	752 "Sweden"	/// 
							528 "Netherlands"	724 "Spain"	 	380 "Italy"	 /// 
							250 "France"	 	208 "Denmark"   	300 "Greece"	/// 
							756 "Switzerland"	056 "Belgium"   	376 "Israel"	///
							203 "Czechia"		616 "Poland"		372 "Ireland"   ///
							348 "Hungary"		620 "Portugal"  	705 "Slovenia"  ///
							233 "Estonia"		442 "Luxembourg"	191 "Croatia"
lab val isocountry lab_isocountry
lab var isocountry "Country identifier (ISO coded)"


*>> Create inflation multiplier variables
gen c2003cpindex =  .
replace c2003cpindex = 87.5 if isocountry == 040 // 2003 - Austria
replace c2003cpindex = 86.2 if isocountry == 056 // 2003 - Belgium
replace c2003cpindex = 82.9 if isocountry == 203 // 2003 - Czech Republic
replace c2003cpindex = 87.4 if isocountry == 208 // 2003 - Denmark
replace c2003cpindex = 73.8 if isocountry == 233 // 2003 - Estonia
replace c2003cpindex = 89.3 if isocountry == 250 // 2003 - France
replace c2003cpindex = 89.6 if isocountry == 276 // 2003 - Germany
replace c2003cpindex = 80.1 if isocountry == 300 // 2003 - Greece
replace c2003cpindex = 69.6 if isocountry == 348 // 2003 - Hungary
replace c2003cpindex = 89.0 if isocountry == 372 // 2003 - Ireland
replace c2003cpindex = 87.0 if isocountry == 376 // 2003 - Israel
replace c2003cpindex = 87.3 if isocountry == 380 // 2003 - Italy
replace c2003cpindex = 85.6 if isocountry == 442 // 2003 - Luxembourg
replace c2003cpindex = 90.0 if isocountry == 528 // 2003 - Netherlands
replace c2003cpindex = 82.2 if isocountry == 616 // 2003 - Poland
replace c2003cpindex = 87.6 if isocountry == 620 // 2003 - Portugal
replace c2003cpindex = 81.8 if isocountry == 705 // 2003 - Slovenia
replace c2003cpindex = 83.5 if isocountry == 724 // 2003 - Spain
replace c2003cpindex = 91.9 if isocountry == 752 // 2003 - Sweden
replace c2003cpindex = 93.8 if isocountry == 756 // 2003 - Switzerland

gen c2004cpindex =  .
replace c2004cpindex = 89.3 if isocountry == 040 // 2004 - Austria
replace c2004cpindex = 88.0 if isocountry == 056 // 2004 - Belgium
replace c2004cpindex = 85.3 if isocountry == 203 // 2004 - Czech Republic
replace c2004cpindex = 88.4 if isocountry == 208 // 2004 - Denmark
replace c2004cpindex = 76.0 if isocountry == 233 // 2004 - Estonia
replace c2004cpindex = 91.2 if isocountry == 250 // 2004 - France
replace c2004cpindex = 91.0 if isocountry == 276 // 2004 - Germany
replace c2004cpindex = 82.4 if isocountry == 300 // 2004 - Greece
replace c2004cpindex = 74.2 if isocountry == 348 // 2004 - Hungary
replace c2004cpindex = 91.0 if isocountry == 372 // 2004 - Ireland
replace c2004cpindex = 86.7 if isocountry == 376 // 2004 - Israel
replace c2004cpindex = 89.2 if isocountry == 380 // 2004 - Italy
replace c2004cpindex = 87.5 if isocountry == 442 // 2004 - Luxembourg
replace c2004cpindex = 91.1 if isocountry == 528 // 2004 - Netherlands
replace c2004cpindex = 85.0 if isocountry == 616 // 2004 - Poland
replace c2004cpindex = 89.7 if isocountry == 620 // 2004 - Portugal
replace c2004cpindex = 84.7 if isocountry == 705 // 2004 - Slovenia
replace c2004cpindex = 86.1 if isocountry == 724 // 2004 - Spain
replace c2004cpindex = 92.3 if isocountry == 752 // 2004 - Sweden
replace c2004cpindex = 94.6 if isocountry == 756 // 2004 - Switzerland

gen c2005cpindex =  .
replace c2005cpindex = 91.4 if isocountry == 040 // 2005 - Austria
replace c2005cpindex = 90.4 if isocountry == 056 // 2005 - Belgium
replace c2005cpindex = 86.9 if isocountry == 203 // 2005 - Czech Republic
replace c2005cpindex = 90.0 if isocountry == 208 // 2005 - Denmark
replace c2005cpindex = 79.1 if isocountry == 233 // 2005 - Estonia
replace c2005cpindex = 92.7 if isocountry == 250 // 2005 - France
replace c2005cpindex = 92.5 if isocountry == 276 // 2005 - Germany
replace c2005cpindex = 85.3 if isocountry == 300 // 2005 - Greece
replace c2005cpindex = 76.9 if isocountry == 348 // 2005 - Hungary
replace c2005cpindex = 93.1 if isocountry == 372 // 2005 - Ireland
replace c2005cpindex = 87.8 if isocountry == 376 // 2005 - Israel
replace c2005cpindex = 91.0 if isocountry == 380 // 2005 - Italy
replace c2005cpindex = 89.7 if isocountry == 442 // 2005 - Luxembourg
replace c2005cpindex = 92.6 if isocountry == 528 // 2005 - Netherlands
replace c2005cpindex = 86.9 if isocountry == 616 // 2005 - Poland
replace c2005cpindex = 91.8 if isocountry == 620 // 2005 - Portugal
replace c2005cpindex = 86.8 if isocountry == 705 // 2005 - Slovenia
replace c2005cpindex = 89.0 if isocountry == 724 // 2005 - Spain
replace c2005cpindex = 92.7 if isocountry == 752 // 2005 - Sweden
replace c2005cpindex = 95.7 if isocountry == 756 // 2005 - Switzerland

gen c2006cpindex =  .
replace c2006cpindex = 92.7 if isocountry == 040 // 2006 - Austria
replace c2006cpindex = 92.0 if isocountry == 056 // 2006 - Belgium
replace c2006cpindex = 89.1 if isocountry == 203 // 2006 - Czech Republic
replace c2006cpindex = 91.7 if isocountry == 208 // 2006 - Denmark
replace c2006cpindex = 82.6 if isocountry == 233 // 2006 - Estonia
replace c2006cpindex = 94.3 if isocountry == 250 // 2006 - France
replace c2006cpindex = 93.9 if isocountry == 276 // 2006 - Germany
replace c2006cpindex = 88.0 if isocountry == 300 // 2006 - Greece
replace c2006cpindex = 79.9 if isocountry == 348 // 2006 - Hungary
replace c2006cpindex = 96.8 if isocountry == 372 // 2006 - Ireland
replace c2006cpindex = 89.7 if isocountry == 376 // 2006 - Israel
replace c2006cpindex = 92.9 if isocountry == 380 // 2006 - Italy
replace c2006cpindex = 92.1 if isocountry == 442 // 2006 - Luxembourg
replace c2006cpindex = 93.7 if isocountry == 528 // 2006 - Netherlands
replace c2006cpindex = 88.0 if isocountry == 616 // 2006 - Poland
replace c2006cpindex = 94.6 if isocountry == 620 // 2006 - Portugal
replace c2006cpindex = 88.9 if isocountry == 705 // 2006 - Slovenia
replace c2006cpindex = 92.1 if isocountry == 724 // 2006 - Spain
replace c2006cpindex = 94.0 if isocountry == 752 // 2006 - Sweden
replace c2006cpindex = 96.7 if isocountry == 756 // 2006 - Switzerland

gen c2007cpindex =  .
replace c2007cpindex =  94.7 if isocountry == 040 // 2007 - Austria
replace c2007cpindex =  93.7 if isocountry == 056 // 2007 - Belgium
replace c2007cpindex =  91.7 if isocountry == 203 // 2007 - Czech Republic
replace c2007cpindex =  93.3 if isocountry == 208 // 2007 - Denmark
replace c2007cpindex =  88.1 if isocountry == 233 // 2007 - Estonia
replace c2007cpindex =  95.7 if isocountry == 250 // 2007 - France
replace c2007cpindex =  96.1 if isocountry == 276 // 2007 - Germany
replace c2007cpindex =  90.6 if isocountry == 300 // 2007 - Greece
replace c2007cpindex =  86.3 if isocountry == 348 // 2007 - Hungary
replace c2007cpindex = 101.6 if isocountry == 372 // 2007 - Ireland
replace c2007cpindex =  90.1 if isocountry == 376 // 2007 - Israel
replace c2007cpindex =  94.6 if isocountry == 380 // 2007 - Italy
replace c2007cpindex =  94.2 if isocountry == 442 // 2007 - Luxembourg
replace c2007cpindex =  95.2 if isocountry == 528 // 2007 - Netherlands
replace c2007cpindex =  90.2 if isocountry == 616 // 2007 - Poland
replace c2007cpindex =  96.9 if isocountry == 620 // 2007 - Portugal
replace c2007cpindex =  92.1 if isocountry == 705 // 2007 - Slovenia
replace c2007cpindex =  94.7 if isocountry == 724 // 2007 - Spain
replace c2007cpindex =  96.0 if isocountry == 752 // 2007 - Sweden
replace c2007cpindex =  97.4 if isocountry == 756 // 2007 - Switzerland

gen c2008cpindex =  .
replace c2008cpindex =  97.7 if isocountry == 040 // 2008 - Austria
replace c2008cpindex =  97.9 if isocountry == 056 // 2008 - Belgium
replace c2008cpindex =  97.5 if isocountry == 203 // 2008 - Czech Republic
replace c2008cpindex =  96.5 if isocountry == 208 // 2008 - Denmark
replace c2008cpindex =  97.2 if isocountry == 233 // 2008 - Estonia
replace c2008cpindex =  98.4 if isocountry == 250 // 2008 - France
replace c2008cpindex =  98.6 if isocountry == 276 // 2008 - Germany
replace c2008cpindex =  94.4 if isocountry == 300 // 2008 - Greece
replace c2008cpindex =  91.5 if isocountry == 348 // 2008 - Hungary
replace c2008cpindex = 105.7 if isocountry == 372 // 2008 - Ireland
replace c2008cpindex =  94.2 if isocountry == 376 // 2008 - Israel
replace c2008cpindex =  97.7 if isocountry == 380 // 2008 - Italy
replace c2008cpindex =  97.4 if isocountry == 442 // 2008 - Luxembourg
replace c2008cpindex =  97.6 if isocountry == 528 // 2008 - Netherlands
replace c2008cpindex =  93.9 if isocountry == 616 // 2008 - Poland
replace c2008cpindex =  99.4 if isocountry == 620 // 2008 - Portugal
replace c2008cpindex =  97.4 if isocountry == 705 // 2008 - Slovenia
replace c2008cpindex =  98.5 if isocountry == 724 // 2008 - Spain
replace c2008cpindex =  99.3 if isocountry == 752 // 2008 - Sweden
replace c2008cpindex =  99.8 if isocountry == 756 // 2008 - Switzerland

gen c2009cpindex =  .
replace c2009cpindex =  98.2 if isocountry == 040 // 2009 - Austria
replace c2009cpindex =  97.9 if isocountry == 056 // 2009 - Belgium
replace c2009cpindex =  98.6 if isocountry == 203 // 2009 - Czech Republic
replace c2009cpindex =  97.8 if isocountry == 208 // 2009 - Denmark
replace c2009cpindex =  97.1 if isocountry == 233 // 2009 - Estonia
replace c2009cpindex =  98.5 if isocountry == 250 // 2009 - France
replace c2009cpindex =  98.9 if isocountry == 276 // 2009 - Germany
replace c2009cpindex =  95.5 if isocountry == 300 // 2009 - Greece
replace c2009cpindex =  95.3 if isocountry == 348 // 2009 - Hungary
replace c2009cpindex = 101.0 if isocountry == 372 // 2009 - Ireland
replace c2009cpindex =  97.4 if isocountry == 376 // 2009 - Israel
replace c2009cpindex =  98.5 if isocountry == 380 // 2009 - Italy
replace c2009cpindex =  97.8 if isocountry == 442 // 2009 - Luxembourg
replace c2009cpindex =  98.7 if isocountry == 528 // 2009 - Netherlands
replace c2009cpindex =  97.5 if isocountry == 616 // 2009 - Poland
replace c2009cpindex =  98.6 if isocountry == 620 // 2009 - Portugal
replace c2009cpindex =  98.2 if isocountry == 705 // 2009 - Slovenia
replace c2009cpindex =  98.2 if isocountry == 724 // 2009 - Spain
replace c2009cpindex =  98.9 if isocountry == 752 // 2009 - Sweden
replace c2009cpindex =  99.3 if isocountry == 756 // 2009 - Switzerland

gen c2010cpindex =  .
replace c2010cpindex = 100.0 if isocountry == 040 // 2010 - Austria
replace c2010cpindex = 100.0 if isocountry == 056 // 2010 - Belgium
replace c2010cpindex = 100.0 if isocountry == 203 // 2010 - Czech Republic
replace c2010cpindex = 100.0 if isocountry == 208 // 2010 - Denmark
replace c2010cpindex = 100.0 if isocountry == 233 // 2010 - Estonia
replace c2010cpindex = 100.0 if isocountry == 250 // 2010 - France
replace c2010cpindex = 100.0 if isocountry == 276 // 2010 - Germany
replace c2010cpindex = 100.0 if isocountry == 300 // 2010 - Greece
replace c2010cpindex = 100.0 if isocountry == 348 // 2010 - Hungary
replace c2010cpindex = 100.0 if isocountry == 372 // 2010 - Ireland
replace c2010cpindex = 100.0 if isocountry == 376 // 2010 - Israel
replace c2010cpindex = 100.0 if isocountry == 380 // 2010 - Italy
replace c2010cpindex = 105.9 if isocountry == 442 // 2010 - Luxembourg
replace c2010cpindex = 100.0 if isocountry == 528 // 2010 - Netherlands
replace c2010cpindex = 100.0 if isocountry == 616 // 2010 - Poland
replace c2010cpindex = 100.0 if isocountry == 620 // 2010 - Portugal
replace c2010cpindex = 100.0 if isocountry == 705 // 2010 - Slovenia
replace c2010cpindex = 100.0 if isocountry == 724 // 2010 - Spain
replace c2010cpindex = 100.0 if isocountry == 752 // 2010 - Sweden
replace c2010cpindex = 100.0 if isocountry == 756 // 2010 - Switzerland

gen c2011cpindex =  .
replace c2011cpindex = 103.3 if isocountry == 040 // 2011 - Austria
replace c2011cpindex = 103.5 if isocountry == 056 // 2011 - Belgium
replace c2011cpindex = 101.9 if isocountry == 203 // 2011 - Czech Republic
replace c2011cpindex = 102.8 if isocountry == 208 // 2011 - Denmark
replace c2011cpindex = 105.0 if isocountry == 233 // 2011 - Estonia
replace c2011cpindex = 102.1 if isocountry == 250 // 2011 - France
replace c2011cpindex = 102.1 if isocountry == 276 // 2011 - Germany
replace c2011cpindex = 103.3 if isocountry == 300 // 2011 - Greece
replace c2011cpindex = 103.9 if isocountry == 348 // 2011 - Hungary
replace c2011cpindex = 102.6 if isocountry == 372 // 2011 - Ireland
replace c2011cpindex = 103.5 if isocountry == 376 // 2011 - Israel
replace c2011cpindex = 102.8 if isocountry == 380 // 2011 - Italy
replace c2011cpindex = 103.4 if isocountry == 442 // 2011 - Luxembourg
replace c2011cpindex = 102.3 if isocountry == 528 // 2011 - Netherlands
replace c2011cpindex = 104.2 if isocountry == 616 // 2011 - Poland
replace c2011cpindex = 103.7 if isocountry == 620 // 2011 - Portugal
replace c2011cpindex = 101.8 if isocountry == 705 // 2011 - Slovenia
replace c2011cpindex = 103.2 if isocountry == 724 // 2011 - Spain
replace c2011cpindex = 103.0 if isocountry == 752 // 2011 - Sweden
replace c2011cpindex = 100.2 if isocountry == 756 // 2011 - Switzerland

gen c2012cpindex =  .
replace c2012cpindex = 105.9 if isocountry == 040 // 2012 - Austria
replace c2012cpindex = 106.5 if isocountry == 056 // 2012 - Belgium
replace c2012cpindex = 105.3 if isocountry == 203 // 2012 - Czech Republic
replace c2012cpindex = 105.2 if isocountry == 208 // 2012 - Denmark
replace c2012cpindex = 109.1 if isocountry == 233 // 2012 - Estonia
replace c2012cpindex = 104.1 if isocountry == 250 // 2012 - France
replace c2012cpindex = 104.1 if isocountry == 276 // 2012 - Germany
replace c2012cpindex = 104.9 if isocountry == 300 // 2012 - Greece
replace c2012cpindex = 109.8 if isocountry == 348 // 2012 - Hungary
replace c2012cpindex = 104.3 if isocountry == 372 // 2012 - Ireland
replace c2012cpindex = 105.2 if isocountry == 376 // 2012 - Israel
replace c2012cpindex = 105.9 if isocountry == 380 // 2012 - Italy
replace c2012cpindex = 106.2 if isocountry == 442 // 2012 - Luxembourg
replace c2012cpindex = 104.9 if isocountry == 528 // 2012 - Netherlands
replace c2012cpindex = 108.0 if isocountry == 616 // 2012 - Poland
replace c2012cpindex = 106.5 if isocountry == 620 // 2012 - Portugal
replace c2012cpindex = 104.5 if isocountry == 705 // 2012 - Slovenia
replace c2012cpindex = 105.7 if isocountry == 724 // 2012 - Spain
replace c2012cpindex = 103.9 if isocountry == 752 // 2012 - Sweden
replace c2012cpindex =  99.5 if isocountry == 756 // 2012 - Switzerland

gen c2013cpindex =  .
replace c2013cpindex = 108.0 if isocountry == 040 // 2013 - Austria
replace c2013cpindex = 107.7 if isocountry == 056 // 2013 - Belgium
replace c2013cpindex = 106.8 if isocountry == 203 // 2013 - Czech Republic
replace c2013cpindex = 106.1 if isocountry == 208 // 2013 - Denmark
replace c2013cpindex = 112.1 if isocountry == 233 // 2013 - Estonia
replace c2013cpindex = 105.0 if isocountry == 250 // 2013 - France
replace c2013cpindex = 105.7 if isocountry == 276 // 2013 - Germany
replace c2013cpindex = 103.9 if isocountry == 300 // 2013 - Greece
replace c2013cpindex = 111.7 if isocountry == 348 // 2013 - Hungary
replace c2013cpindex = 104.9 if isocountry == 372 // 2013 - Ireland
replace c2013cpindex = 106.9 if isocountry == 376 // 2013 - Israel
replace c2013cpindex = 107.2 if isocountry == 380 // 2013 - Italy
replace c2013cpindex = 108.0 if isocountry == 442 // 2013 - Luxembourg
replace c2013cpindex = 107.5 if isocountry == 528 // 2013 - Netherlands
replace c2013cpindex = 109.0 if isocountry == 616 // 2013 - Poland
replace c2013cpindex = 106.8 if isocountry == 620 // 2013 - Portugal
replace c2013cpindex = 106.3 if isocountry == 705 // 2013 - Slovenia
replace c2013cpindex = 107.2 if isocountry == 724 // 2013 - Spain
replace c2013cpindex = 103.8 if isocountry == 752 // 2013 - Sweden
replace c2013cpindex =  99.3 if isocountry == 756 // 2013 - Switzerland

gen c2014cpindex =  .
replace c2014cpindex = 109.7 if isocountry == 040 // 2014 - Austria
replace c2014cpindex = 108.0 if isocountry == 056 // 2014 - Belgium
replace c2014cpindex = 107.2 if isocountry == 203 // 2014 - Czech Republic
replace c2014cpindex = 106.7 if isocountry == 208 // 2014 - Denmark
replace c2014cpindex = 112.0 if isocountry == 233 // 2014 - Estonia
replace c2014cpindex = 105.5 if isocountry == 250 // 2014 - France
replace c2014cpindex = 106.7 if isocountry == 276 // 2014 - Germany
replace c2014cpindex = 102.6 if isocountry == 300 // 2014 - Greece
replace c2014cpindex = 111.5 if isocountry == 348 // 2014 - Hungary
replace c2014cpindex = 105.1 if isocountry == 372 // 2014 - Ireland
replace c2014cpindex = 107.4 if isocountry == 376 // 2014 - Israel
replace c2014cpindex = 107.5 if isocountry == 380 // 2014 - Italy
replace c2014cpindex = 108.7 if isocountry == 442 // 2014 - Luxembourg
replace c2014cpindex = 108.5 if isocountry == 528 // 2014 - Netherlands
replace c2014cpindex = 109.1 if isocountry == 616 // 2014 - Poland
replace c2014cpindex = 106.5 if isocountry == 620 // 2014 - Portugal
replace c2014cpindex = 106.5 if isocountry == 705 // 2014 - Slovenia
replace c2014cpindex = 107.0 if isocountry == 724 // 2014 - Spain
replace c2014cpindex = 103.6 if isocountry == 752 // 2014 - Sweden
replace c2014cpindex =  99.3 if isocountry == 756 // 2014 - Switzerland

gen c2015cpindex = .
replace	c2015cpindex = 112.0447	if isocountry == 036	//	2015 - 	Australia
replace	c2015cpindex = 110.6886	if isocountry == 040	//	2016 - 	Austria
replace	c2015cpindex = 108.6297	if isocountry == 056	//	2017 - 	Belgium
replace	c2015cpindex = 107.4807	if isocountry == 203 	//	2018 - 	Czechia
replace	c2015cpindex = 107.1333	if isocountry == 208 	//	2019 - 	Denmark
replace	c2015cpindex = 111.4746	if isocountry == 233 	//	2020 - 	Estonia
replace	c2015cpindex = 108.7895	if isocountry == 246 	//	2021 - 	Finland
replace	c2015cpindex = 105.5790	if isocountry == 250 	//	2022 - 	France
replace	c2015cpindex = 106.8917	if isocountry == 276 	//	2023 - 	Germany
replace	c2015cpindex = 100.7713	if isocountry == 300 	//	2024 - 	Greece
replace	c2015cpindex = 111.3844	if isocountry == 348 	//	2025 - 	Hungary
replace	c2015cpindex = 117.8495	if isocountry == 352 	//	2026 - 	Iceland
replace	c2015cpindex = 104.7143	if isocountry == 372 	//	2027 - 	Ireland
replace	c2015cpindex = 106.7204	if isocountry == 376 	//	2028 - 	Israel
replace	c2015cpindex = 107.4987	if isocountry == 380 	//	2029 - 	Italy
replace	c2015cpindex = 107.5449	if isocountry == 428 	//	2030 - 	Latvia
replace	c2015cpindex = 109.2001	if isocountry == 442 	//	2031 - 	Luxembourg
replace	c2015cpindex = 109.1832	if isocountry == 528 	//	2032 - 	Netherlands
replace	c2015cpindex = 108.5875	if isocountry == 578 	//	2033 - 	Norway
replace	c2015cpindex = 108.1267	if isocountry == 616 	//	2034 - 	Poland
replace	c2015cpindex = 107.0426	if isocountry == 620 	//	2035 - 	Portugal
replace	c2015cpindex = 108.7366	if isocountry == 703 	//	2036 - 	Slovakia
replace	c2015cpindex = 105.9471	if isocountry == 705 	//	2037 - 	Slovenia
replace	c2015cpindex = 106.5120	if isocountry == 724 	//	2038 - 	Spain
replace	c2015cpindex = 103.5948	if isocountry == 752 	//	2039 - 	Sweden
replace	c2015cpindex = 98.17177	if isocountry == 756 	//	2040 - 	Switzerland
replace	c2015cpindex = 146.0678	if isocountry == 792 	//	2041 - 	Turkey
replace	c2015cpindex = 111.8244	if isocountry == 826 	//	2042 - 	United Kingdom

label variable c2003cpindex "2003 consumer price index, 2010=100"
label variable c2004cpindex "2004 consumer price index, 2010=100"
label variable c2005cpindex "2005 consumer price index, 2010=100"
label variable c2006cpindex "2006 consumer price index, 2010=100"
label variable c2007cpindex "2007 consumer price index, 2010=100"
label variable c2008cpindex "2008 consumer price index, 2010=100"
label variable c2009cpindex "2009 consumer price index, 2010=100"
label variable c2010cpindex "2010 consumer price index, 2010=100"
label variable c2011cpindex "2011 consumer price index, 2010=100"
label variable c2012cpindex "2012 consumer price index, 2010=100"
label variable c2013cpindex "2013 consumer price index, 2010=100"
label variable c2014cpindex "2014 consumer price index, 2010=100"
label variable c2015cpindex "2015 consumer price index, 2010=100"



*********************************************
***	   Adjusting for PPP and CPI	   ***
*********************************************

// To ensure comparability across countries, our measure of income is equivalised real household income. 	//
// This represents household income adjusted using country-specific Purchasing Power Parities (PPP), the 	//
// Consumer Price Index (CPI) and the modified-OECD scale, to control for household size and composition. 	//
// Total household income includes all net monetary income received by household members during the 		//
// reference year. // [-> see Quevedo, Cristina Hernández, Andrew M. Jones, Ángel López Nicolás, 			//
// Nigel Rice, e others. 2005. «Socioeconomic inequalities in health: a comparative longitudinal analysis 	//
// using the European Community Household Panel». ECuity Project III, Working Paper 31. 					//
//																											//
//			  (https://www.york.ac.uk/media/economics/documents/herc/wp/05_12.pdf). 						//



*****		   *****
* 	   INCOME	  *
*****		   *****

*>> Square root of the number of household members
gen sqrthhsize 	= sqrt(hhsize) 

*>> Household income equivalized by dividing it by the square root of the number of household members
gen newincome = income_implicatmean/sqrthhsize



*****		   *****
* 	   WEALTH	  *
*****		   *****

*>> Household wealth equivalized by dividing it by the square root of the number of household members
gen newwealth = wealth_implicatmean/sqrthhsize



*----	[ 14. Fix & (re)generate variables, labels, etc. FINAL SAVE ]--------------------------------------------*

*>>	Create new (numeric) personal identifiers
egen pid=group(mergeid) 

* 	Label
label variable pid "Personal Identifier (pid)"

*>>	Time between the interviews: 
*	time in years (time)
bysort pid (wave): gen time=int_year-int_year[_n-1]
recode time (.=0) 	// 0 = first interview

*	logaritmic version (timelog)
gen time1=time+1
gen timelog=ln(time1)


*>>	Dead or Alive 0 = alive, 1 = dead
gen dead_temp=0 							// (Alive)
replace dead_temp=1 if deadoralive_w1 == 2	// in wave 1 we have: 	-99	= Not applicable (alive - but not yet part of the sample)
											// (Dead)				 1	= Alive
replace dead_temp=1 if deadoralive_w2 == 2 	// (Dead)
replace dead_temp=1 if deadoralive_w3 == 2 	// (Dead)
replace dead_temp=1 if deadoralive_w4 == 2 	// (Dead)
replace dead_temp=1 if deadoralive_w5 == 2 	// (Dead)
replace dead_temp=1 if deadoralive_w6 == 2 	// (Dead)
replace dead_temp=1 if deadoralive_w7 == 2 	// (Dead)

xtset pid wave
sort pid wave 

by pid: gen dead = dead_temp[_n+1] // this variable identify respondents' death in the subsequent wave 


*>> Check
//	list wave deadoralive_w6 dead_temp dead, sepby(pid)

*>>	Drop superfluous variables
drop dead_temp deadoralive_w1 deadoralive_w2 deadoralive_w3 deadoralive_w4 deadoralive_w5 deadoralive_w6 deadoralive_w7

*>>	Drop if wave is missing
drop if wave==.
drop if wave==7 // SHARELIFE

*>>	"Illogical" variables 
*	Check for deviations within gender or ISCED: 
*	if gender deviates between waves, one information must be wrong
*	as there is no way to know which is the wrong information, both
*	are set to -99 (i.e. implausible value/suspected wrong)

*>> Gender
sort mergeid
egen 	gender_change = sd(gender), by(mergeid)
ta 		gender_change
replace gender = -99 if gender_change > 0 & gender_change < . 
drop 	gender_change 
recode  gender (-99=.)

 
*>> ISCED
sort mergeid
egen 	isced_change = sd(isced), by(mergeid)
tab 	isced_change

*>> List non imputed values (isced_f==3) that vary within individuals across waves
// 	list pid wave isced isced_change if isced_change>0 & isced_change <. & isced_f==3, sepby(pid)

replace isced = -99 if isced_change > 0 & isced_change < . 
drop 	isced_change
recode  isced (-99=.)  // ISCED should not change across waves according to SHARE documentation

*>> Year of Birth
egen 	yrbirth_change = sd(yrbirth), by(mergeid)
ta 		yrbirth_change
replace yrbirth = -99 if yrbirth_change > 0 & yrbirth_change < . 
drop	yrbirth_change 
recode  yrbirth (-99=.)

*>> Keep only countries that have participated in all the 5 regular waves
ta country wave
ta country wave, nola 

drop if country==25 // Israel 
drop if country==30 // Ireland (only one wave)

*>> New SHARE countries
drop if country==32
drop if country==47
drop if country==48
drop if country==51
drop if country==53
drop if country==55
drop if country==57
drop if country==59
drop if country==61
drop if country==63

*>> Original sample
xtdes 
ta gender female, miss

*>> Eligibility
	// In wave 1 all household members born 1954 or earlier are eligible for an interview. Starting in wave 2, for new 	//
	// countries or refreshment samples, there is only one selected respondent per household who has to be born 1956 or //
	// earlier in wave 2, 1960 or earlier in wave 4, 1962 or earlier in wave 5 and 1964 or earlier in wave 6. In 		//
	// addition – in all waves – current partners living in the same household are interviewed regardless of their age. //

drop if yrbirth>1954 & wave==1 // (1194 observations deleted)
drop if yrbirth>1956 & wave==2 // (1168 observations deleted)
drop if yrbirth>1960 & wave==4 // (1629 observations deleted)
drop if yrbirth>1962 & wave==5 // (1353 observations deleted)
drop if yrbirth>1964 & wave==6 // (1184 observations deleted)
drop if yrbirth>1966 & wave==7 // (1184 observations deleted)

drop if age_int<50

di in yellow "did not meet the original SHARE sample criteria, i.e. 50 years of age or older (N=1,090)"


*>>	Label some variables 

*	Gender
recode gender (1=0 "Men") (2=1 "Women"), gen(sex)
ta gender sex, miss
drop gender
label variable sex "Gender"

*>> Order variables
order mergeid pid wave int_year int_month yrbirth mobirth age_int country sex 

*>> Final Sort
sort pid wave // sorting by personal ID and time points

*>> Check for possible duplicate cases
isid pid wave


*>> Integrate hhid? into a "long" format hidd variable
	global w "1 2 4 5 6 7"
	gen	  hhid = ""
	foreach w in $w {
		replace hhid = hhid`w' if wave==`w'	
	}
	drop	 hhid?	
	lab var  hhid "Household identifier in respective wave - see var. wave" 


*>> Integrate coupleID? into a "long" format coupleid variable

	gen	  coupleid = ""
	foreach w in $w {
	 replace coupleid = coupleid`w' if wave==`w'	
	}
	drop	 coupleid?	
	lab var  coupleid "Couple identifier in respective wave - see var. wave" 
	
	
*>> Generate wave participation overview variable 
	foreach w in $w {
		gen temp1_`w' = `w' if wave==`w'
	   egen temp2_`w' = max(temp1_`w'), by(mergeid)
	}
	gen	  wavepart = ""
	foreach w in $w {
	 replace wavepart = wavepart + string(temp2_`w')  if string(temp2_`w')!="."
	}
	destring wavepart, replace
	lab var  wavepart "Wave participation pattern"

*>> Recode and label "wave" variable 
recode wave (4=3) (5=4) (6=5) (7=6)
label define lab_wave_year ///
  1 "[1] 2004-05" 	///
  2 "[2] 2006-07" 	///
  ///				/// <- gap here ("SHARELIFE" wave)
  3 "[4] 2011-12" 	///
  4 "[5]	2013" 	///
  5 "[6]	2015" 	/// 
  6 "[7]	2017"
label values wave lab_wave_year


*>> Same-sex couples
ta gender_partner sex  // 156 men-men, 245 women-women
ta gender_partner sex, nola
// drop if sex==0 & gender_partner==0
// drop if sex==1 & gender_partner==1

*>> Drop superfluous variables
drop 	deceased spheu spheu2 sphus sphus2

*>> Drop variables that are all missing (Stata Journal, volume 8, number 4: dm89_1) --> here using dm89_2
dropmiss, force 

*>> Generate "attrition" variable
gen attrition=0
bys pid: replace attrition = 1 if ((wave)-(wave[_n-1])) >  1 & wave[_n-1]<. & wave<. 
// list pid wave attrition dead, sepby(pid)

*>> Compress the dataset
compress

*>> Remove any notes
notes drop _dta

*>> Final Save
save "$share_all_out/share_LONG_7.0.0.dta", replace

*>> Close 
display "$S_TIME  $S_DATE"
timer off 1
timer list 1

*	Close the log
log close
