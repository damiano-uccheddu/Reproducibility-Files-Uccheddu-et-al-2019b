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
*----	[ 1. Stata Version & Initial Settings]-------------------------------------------------------------------*
*----	[ 2. Preliminary operations  ]---------------------------------------------------------------------------*
*----	[ 3. Sample selection]-----------------------------------------------------------------------------------*
*----	[ 4. Generate new variables ]----------------------------------------------------------------------------*
*----	[ 5. Data analysis & Output ]----------------------------------------------------------------------------*
*----	[ 6. Other Data analysis & Output (for Reviewers) ]------------------------------------------------------*
*----	[ 7. Close ]---------------------------------------------------------------------------------------------*


******************************************************************************************************************


*----	[ 1. Stata Version & Initial Settings]-------------------------------------------------------------------*


*>> Preliminary operations

*	Clear results window
cls
clear
clear matrix
set max_memory .
set logtype text
set more off
set scheme s2mono
capture log close 

*	Recording time Stata needs for running the do-file
display "$S_TIME  $S_DATE"
timer clear
timer on 1

* 	Open the log file 
log using "$share_logfile/Data Analysis.log", replace

* 	Open the dataset
use "$share_all_out/SHARE_ANALYSIS_7.0.0.dta", clear


*----	[ 2. Preliminary operations  ]---------------------------------------------------------------------------*

* 	Sort the dataset by personal identification number and wave 
sort pid wave 

* 	Declare the longitudinal nature of the data
xtset pid wave 

* 	Rename the dependent variable 
rename fi FI

* 	Multiply dependent variable*100
replace FI=FI*100

* 	Store the Frailty variables in the macro "FrailtyVars"
global 		FrailtyVars 		///
			FI_bathing      	/// Difficulties: bathing or showering
			FI_stairs       	/// Difficulties: climbing one flight of stairs
			FI_garden       	/// Difficulties: doing work around the house or garden
			FI_dressing     	/// Difficulties: dressing, including shoes and socks
			FI_eating       	/// Difficulties: eating, cutting up food
			FI_bed          	/// Difficulties: getting in or out of bed
			FI_chair        	/// Difficulties: getting up from chair
			FI_lift5kg      	/// Difficulties: lifting or carrying weights over 5 kilos
			FI_money        	/// Difficulties: managing money
			FI_hotmeal      	/// Difficulties: preparing a hot meal
			FI_arms         	/// Difficulties: reaching or extending arms above shoulder
			FI_shopping     	/// Difficulties: shopping for groceries
			FI_medications  	/// Difficulties: taking medications
			FI_toilet       	/// Difficulties: using the toilet, incl getting up or down
			FI_walk100      	/// Difficulties: walking 100 metres
			FI_walkRoom     	/// Difficulties: walking across a room
			FI_arthritis    	/// Doctor told you had: arthritis
			FI_cancer       	/// Doctor told you had: cancer
			FI_lungdisease  	/// Doctor told you had: chronic lung disease
			FI_diabetes     	/// Doctor told you had: diabetes or high blood sugar
			FI_heartattack  	/// Doctor told you had: heart attack
			FI_hypertension 	/// Doctor told you had: high blood pressure or hypertension
			FI_fracture     	/// Doctor told you had: hip fracture or femoral fracture
			FI_stroke       	/// Doctor told you had: stroke
			FI_phactiv      	/// Engagement in activities requiring moderate or vigorous physical activity
			FI_appetite     	/// FI_appetite
			FI_bmi          	/// FI_bmi
			FI_sad          	/// RECODE of mh002_ (Sad or depressed last month)
			FI_hopelessness 	/// RECODE of mh003_ (Hopes for the future)
			FI_fatigue      	/// RECODE of mh013_ (Fatigue)
			FI_enjoyment    	/// RECODE of mh016_ (Enjoyment)
			FI_orienti      	/// RECODE of orienti (Score of orientation in time test)
			FI_longtermill  	/// RECODE of limitations (Long-term illness)
			FI_falling      	/// RECODE of ph010d7 (Bothered by: falling down)
			FI_fearfall     	/// RECODE of ph010d8 (Bothered by: fear of falling down)
			FI_dizziness    	/// RECODE of ph010d9 (Bothered by: dizziness, faints or blackouts)
			FI_srh          	/// RECODE of srh (Self-report of health)
			FI_maxgrip      	/// Grip strenght
			FI_phone 			/// Diffic, nola miss // ulties: telephone calls
			FI_parkinson 		// Doctor told you had: Parkinson disease

*>> Keep only necessary variables
keep 					/// 
pid 					/// 
FI 						///
limitations  			/// 
eurod 					/// 
srh 					/// 
maxgrip 				/// 
coupleid 				///
cjs 					///
sex 					///
gender_partner 			///
carein					///
$FrailtyVars 			///
partnercare 			///
partnerinhh 			/// 
age 					///
int_year int_month 		///
income wealth 			///
newincome newwealth 	///
wave 					///
country 	

*----	[ 3. Sample selection]-----------------------------------------------------------------------------------*

* 	Keep only partenered or married individuals 
drop if partnerinhh==3

* 	Drop same-sex partners
drop if sex==gender_partner

* 	Describe the missing pattern 
mdesc 

*>> Reviewer 1 Point 1.1.1.
ta partnercare carein, miss col 		// we do the same as in https://doi.org/10.1093/geronb/gbx133
xtdes if partnercare==. & carein==1 	// 2997 individuals 
xtdes if carein==1 						// 10750 individuals 
di round((2997/(10750))*100, 0.01) 		// Individuals who provided care to other persons than a spouse 
										// (such as parents, siblings, friends, etc.) were set to missing,
										// which applied to about one eighth of the total caregivers (). 

*>> Drop missing cases
drop if FI 				== . 
drop if age  			== .
drop if age 			== -1
drop if sex  			== .
drop if partnercare  	== .
drop if newwealth 		== .
drop if newincome 		== . 
drop if wave 			== .
drop if country 		== .
drop if cjs 			== . 

*>> Drop not married or partnered to the same person throughout the observation window
sort pid wave
egen couplepid=group(coupleid) 	
egen coupleid_change = sd(couplepid), by(pid)
tab  coupleid_change 								// For some respondents couplepid changes over time
													// (i.e., respondents changed partner)
drop if coupleid_change>0 & coupleid_change <.

*	Panel participation in at least two waves
bys pid: gen nyear=[_N] // Generate a variable that identify the participation of interviewed in at least two waves
xtdes, pattern(200) 	// Describe the panel pattern
keep if nyear>1			// Keep only individual that have participated in at least two waves (suggested by Liliya Leopold)
xtdes, pattern(200) 	// Describe (again) the panel pattern


* 	Restriction of the sample to individuals who participate in the baseline year (1) with at least two valid observations across the panel
xtpatternvar, gen(pattern) 	// generate a variable that contain the panel pattern

* 	Missing describe
mdesc

* 	Panel's pattern description
xtdes, pattern(9999999)
di in yellow "Thus, the final analytic sample included 117,790 observations from 43,435 individuals" 

replace partnercare=0 if coupleid==""	// (!) spousal care should be == 0 if the respondent do not have a partner
										// (0 real changes made)

*----	[ 4. Generate new variables ]----------------------------------------------------------------------------*

*>> Economic variables: 
* 	Equivalized wealth: (Quartiles, country- and wave-specific)
drop wealth // drop the older variable 
egen wealth = xtile(newwealth), by(wave country) nq(4)
label variable wealth "Total HH wealth (Quartiles)"

* 	Equivalized wealth: (Quartiles, country- and wave-specific)
drop income // drop the older variable 
egen income = xtile(newincome), by(wave country) nq(4)
label variable income "Total HH wealth (Quartiles)"

* 	Attribute the label to the economic variables 
label values income wealth lab_quartile

*>> Welfare cluster variables 
recode country 											///
				(13 18 14 = 0 "Northern EU") 			/// 
				(11 17 23 31 20 12 = 1 "Western EU") 	/// 
				(15 16 19 33 = 2 "Southern EU") 		/// 
				(28 29 34 35 = 3 "Eastern EU")			/// 
				, gen(welfare_cluster)

ta country welfare_cluster

*>> Treatment Months
* 	Start date 
gen survey_date = mdy(int_month, 15, int_year)

* 	Format them as dates for convenience
format survey_date %d

* 	Convert these to elapsed months:
gen survey_month=mofd(survey_date)

* 	Difference in months:
bys pid:gen treatment_months = survey_month-survey_month[_n-1]
replace treatment_months=0 if treatment_months==.


*>> Caregiving variables
* 	Allison (2019) procedure >> doi: 10.1177/2378023119826441
sort pid wave

* 1) 	Create a difference variable (or "difference score") including the difference in the caregiving variable between time t and t-1.
bys pid:gen pcarediff=partnercare[_n]-partnercare[_n-1] 	// partnercare (0=no, 1=yes); pcarediff (difference in caregiving between time t and t-1)
bys pid:replace pcarediff=0 if pcarediff==.   				// we replace this variable as 0 when the new created variable is missing 
															// (we don't have the carving histories before wave 1)

* 2) 	Decompose caregiving into positive and negative components (i.e. transitions into and out of caregiving) 
*		These variables are never negative, but the first represents an increase, and the second represents a decrease. 
bys pid:gen pcarepos=pcarediff*(pcarediff>0) 				// transition into caregiving 
bys pid:gen pcareneg=-pcarediff*(pcarediff<0) 				// transition out of caregiving 

* 3) 	Define the cumulative sums of the transitions into and out of caregiving 
bysort pid (wave): generate pcarecumpos = sum(pcarepos) 	// This is the accumulation up to time t of all previous positive changes in partnercare 
bysort pid (wave): generate pcarecumneg = sum(pcareneg) 	// This is the accumulation of all previous negative changes in partnercare. 


*----	[ 5. Data analysis & Output ]----------------------------------------------------------------------------*

*>> Descriptive statistics 

* 	Graph the Frailty Index distribution
hist FI, kdensity fraction ytitle("{bf:Fraction}") xtitle("{bf:Frailty Index}") /// 
note("Source: SHARE data, years 2004-2015 (own estimates). Unweighted results." "N(person*wave) = 71,647")
graph export "$figure_out/FIdistribution_total.png", as(png) width(1252) height(910) replace

hist FI if sex==0, kdensity fraction ytitle("{bf:Fraction}") xtitle("{bf:Frailty Index}") /// 
note("Source: SHARE data, years 2004-2015 (own estimates). Unweighted results." "N(person*wave) = 71,647")
graph export "$figure_out/FIdistribution_men.png", as(png) width(1252) height(910) replace

hist FI if sex==1, kdensity fraction ytitle("{bf:Fraction}") xtitle("{bf:Frailty Index}") /// 
note("Source: SHARE data, years 2004-2015 (own estimates). Unweighted results." "N(person*wave) = 71,647")
graph export "$figure_out/FIdistribution_women.png", as(png) width(1252) height(910) replace

graph box FI, over(sex)

separate FI, by(sex)
qqplot FI0 FI1 // compare the FI for men and women.. 

*>> Table 1 - Descriptive statistics of variables in the analyses (page 5)
tabstat FI, stat(N mean sd min max skewness kurtosis)
tabstat age, stat(N mean sd min max skewness kurtosis)
tab 	sex
tab 	partnercare
tab 	pcarecumpos
tab 	pcarecumneg
tab 	cjs
tab 	income
tab 	wealth
tab 	welfare_cluster

tabstat FI 				if sex==0, stat(N mean sd min max skewness kurtosis)
tabstat age 			if sex==0, stat(N mean sd min max skewness kurtosis)
tab partnercare 		if sex==0
tab pcarecumpos 		if sex==0
tab pcarecumneg 		if sex==0
tab cjs 				if sex==0
tab income  			if sex==0
tab wealth 				if sex==0
tab welfare_cluster 	if sex==0

tabstat FI 				if sex==1, stat(N mean sd min max skewness kurtosis)
tabstat age 			if sex==1, stat(N mean sd min max skewness kurtosis)
tab partnercare 		if sex==1
tab pcarecumpos 		if sex==1
tab pcarecumneg 		if sex==1
tab cjs 				if sex==1
tab income  			if sex==1
tab wealth 				if sex==1
tab welfare_cluster 	if sex==1


*>> Regression models 

* 	Store the Independent Variables in a macro 
* 	Independent variables 
global IVars 					pcarecumpos pcarecumneg 											/// 
								age ib2.cjs i.income i.wealth treatment_months

global IVarsInteractionGender 	c.pcarecumpos#sex c.pcarecumneg#sex 								/// 
								age ib2.cjs i.income i.wealth treatment_months

global IVarsInteractionWelfare 	c.pcarecumpos#welfare_cluster c.pcarecumneg#welfare_cluster 		/// 
								age ib2.cjs i.income i.wealth treatment_months

global IVarsInteraction3 		c.pcarecumpos#sex#welfare_cluster c.pcarecumneg#sex#welfare_cluster /// 
								age ib2.cjs i.income i.wealth treatment_months


*>> Table 2 - Results of asymmetric fixed-effects linear regression models on frailty, by gender (page 6)
eststo clear
eststo Men: 	xtreg FI $IVars if sex==0, fe vce(cluster couplepid)
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.wealth=0) (3.wealth=0) (4.wealth=0)

eststo Women: 	xtreg FI $IVars if sex==1, fe vce(cluster couplepid)
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.wealth=0) (3.wealth=0) (4.wealth=0)

esttab using "$tables_out/Table_2.txt", 													/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(2) ci(2) wide not notes 	///
	label constant obslast  sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3) 


*>> Table A2 - Results of asymmetric fixed-effects linear regression models on frailty (Supplementary Material)
eststo clear
eststo Interaction: xtreg FI $IVarsInteraction3, fe vce(cluster couplepid)

esttab using "$tables_out/ThreeWayInteraction.txt", 											/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(2) ci(2) wide not notes 		///
	label constant obslast  aic bic sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3) 

* Wald tests for the interactions
testparm i.sex#i.welfare#c.pcarecumpos
testparm i.sex#i.welfare#c.pcarecumneg

*>> Fig. 1. Asymmetric fixed-effects linear regression models: 
*			Predicted average differences in frailty, by welfare cluster and gender. Estimates and 95 per cent confidence
*			intervals. Note: Models include all the control variables. Complete models are displayed in Supplementary Table A2.
margins, dydx(pcarecumpos pcarecumneg) over(welfare_cluster sex) atmeans vsquish post

mplotoffset, by(welfare_cluster)  plotopts(connect(none)) yline(0) 								/// 
	ylabel(-5 -2.5 0 2.5 5, labsize(small)) xlabel(, angle(45) labsize(small))  xtitle("")  	/// 
	legend(order( 3 `"Transitions into caregiving"' 10 "" 4 `"Transitions out of caregiving"')) /// 
	plotregion(margin(l+10 r+10)) aspect(1) byopt(title("")) offset(0.25)

graph save "$figure_out/ThreeWayInteraction", replace
graph export "$figure_out/ThreeWayInteraction.png", as(png) width(1252) height(910) replace

*>> Table A3. 	Results of asymmetric fixed effects linear regression models on frailty. 
*				Average marginal effects by welfare cluster and gender (Supplementary Material). 
mlincom, clear
qui mlincom 1,	          rowname("POS_Northern_EU_Men	") 	clear 	stat(est p ll ul) //  Northern EU#Men 
qui mlincom 2,	          rowname("POS_Northern_EU_Women") 	add 	stat(est p ll ul) //  Northern EU#Women 
qui mlincom 1 - 2,        rowname("GenderDifference") 		add 	stat(est p ll ul) //  
qui mlincom 3,	          rowname("POS_Western_EU_Men	") 	add 	stat(est p ll ul) //  Western EU#Men         
qui mlincom 4,	          rowname("POS_Western_EU_Women") 	add 	stat(est p ll ul) //  Western EU#Women 
qui mlincom 3 - 4,        rowname("GenderDifference") 		add 	stat(est p ll ul) //  
qui mlincom 5,	          rowname("POS_Southern_EU_Men	") 	add 	stat(est p ll ul) //  Southern EU#Men 
qui mlincom 6,	          rowname("POS_Southern_EU_Women") 	add 	stat(est p ll ul) //  Southern EU#Women         
qui mlincom 5 - 6,        rowname("GenderDifference") 		add 	stat(est p ll ul) //  
qui mlincom 7,	          rowname("POS_Eastern_EU_Men	") 	add 	stat(est p ll ul) //  Eastern EU#Men 
qui mlincom 8,	          rowname("POS_Eastern_EU_Women") 	add 	stat(est p ll ul) //  Eastern EU#Women 
qui mlincom 7 - 8,        rowname("GenderDifference") 		add 	stat(est p ll ul) //  

qui mlincom 9,	          rowname("NEG_Northern_EU_Men	") 	add 	stat(est p ll ul) //  Northern EU#Men         
qui mlincom 10,	          rowname("NEG_Northern_EU_Women") 	add 	stat(est p ll ul) //  Northern EU#Women 
qui mlincom 9 - 10,       rowname("GenderDifference") 		add 	stat(est p ll ul) //  
qui mlincom 11,	          rowname("NEG_Western_EU_Men	") 	add 	stat(est p ll ul) //  Western EU#Men
qui mlincom 12,	          rowname("NEG_Western_EU_Women") 	add 	stat(est p ll ul) //  Western EU#Women         
qui mlincom 11 - 12,      rowname("GenderDifference") 		add 	stat(est p ll ul) //  
qui mlincom 13,	          rowname("NEG_Southern_EU_Men	") 	add 	stat(est p ll ul) //  Southern EU#Men
qui mlincom 14,	          rowname("NEG_Southern_EU_Women") 	add 	stat(est p ll ul) //  Southern EU#Women
qui mlincom 13 - 14,      rowname("GenderDifference") 		add 	stat(est p ll ul) //  
qui mlincom 15,	          rowname("NEG_Eastern_EU_Men	") 	add 	stat(est p ll ul) //  Eastern EU#Men                      
qui mlincom 16,	          rowname("NEG_Eastern_EU_Women") 	add 	stat(est p ll ul) //  Eastern EU#Women              
qui mlincom 15 - 16,      rowname("GenderDifference") 		add 	stat(est p ll ul) //

mlincom,	title("Pairwise test between men and women within each welfare cluster")


*>> Table A4. Differences in the marginal effects of caregiving transitions on frailty (Supplementary Material).

*	mlincom 2
mlincom, clear
qui mlincom 1,	      rowname("POS_Northern_EU_Men	") 	clear 	stat(est p ll ul) //  Northern EU#Men 
qui mlincom 5,	      rowname("POS_Southern_EU_Men	") 	add 	stat(est p ll ul) //  Southern EU#Men 
qui mlincom 5-1,      rowname("Difference") 			add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

*	mlincom 3 (Country differences) MEN (IN)
mlincom, clear
qui mlincom 3-1,	      rowname("(Western EU#Men)-(Northern EU#Men)") 	clear 	stat(est p ll ul) //  (Western EU#Men)-(Northern EU#Men)
qui mlincom 5-1,	      rowname("(Southern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Southern EU#Men)-(Northern EU#Men)
qui mlincom 7-1,	      rowname("(Eastern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Eastern EU#Men)-(Northern EU#Men)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 1-3,	      rowname("(Northern EU#Men)-(Western EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 5-3,	      rowname("(Southern EU#Men)-(Western EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 7-3,	      rowname("(Eastern EU#Men)-(Western EU#Men)") 		add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 1-5,	      rowname("(Northern EU#Men)-(Southern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 3-5,	      rowname("(Western EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 7-5,	      rowname("(Eastern EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 1-7,	      rowname("(Northern EU#Men)-(Eastern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 3-7,	      rowname("(Western EU#Men)-(Eastern EU#Men)") 		add 	stat(est p ll ul)
qui mlincom 5-7,	      rowname("(Southern EU#Men)-(Eastern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

*	mlincom 3 (Country differences) WOMEN (IN)
mlincom, clear
qui mlincom 4-2,	      rowname("(Western EU#Men)-(Northern EU#Men)") 	clear 	stat(est p ll ul) //  (Western EU#Men)-(Northern EU#Men)
qui mlincom 6-2,	      rowname("(Southern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Southern EU#Men)-(Northern EU#Men)
qui mlincom 8-2,	      rowname("(Eastern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Eastern EU#Men)-(Northern EU#Men)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 2-4,	      rowname("(Northern EU#Men)-(Western EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 6-4,	      rowname("(Southern EU#Men)-(Western EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 8-4,	      rowname("(Eastern EU#Men)-(Western EU#Men)") 		add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 2-6,	      rowname("(Northern EU#Men)-(Southern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 4-6,	      rowname("(Western EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 8-6,	      rowname("(Eastern EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 2-8,	      rowname("(Northern EU#Men)-(Eastern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 4-8,	      rowname("(Western EU#Men)-(Eastern EU#Men)") 		add 	stat(est p ll ul)
qui mlincom 6-8,	      rowname("(Southern EU#Men)-(Eastern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

*	mlincom 3 (Country differences) MEN (out)
mlincom, clear
qui mlincom 11-9,	      rowname("(Western EU#Men)-(Northern EU#Men)") 	clear 	stat(est p ll ul) //  (Western EU#Men)-(Northern EU#Men)
qui mlincom 13-9,	      rowname("(Southern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Southern EU#Men)-(Northern EU#Men)
qui mlincom 15-9,	      rowname("(Eastern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Eastern EU#Men)-(Northern EU#Men)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 9-11,	      rowname("(Northern EU#Men)-(Western EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 13-11,	      rowname("(Southern EU#Men)-(Western EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 15-11,	      rowname("(Eastern EU#Men)-(Western EU#Men)") 		add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 9-13,	      rowname("(Northern EU#Men)-(Southern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 11-13,	      rowname("(Western EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 15-13,	      rowname("(Eastern EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 9-15,	      rowname("(Northern EU#Men)-(Eastern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 11-15,	      rowname("(Western EU#Men)-(Eastern EU#Men)") 		add 	stat(est p ll ul)
qui mlincom 13-15,	      rowname("(Southern EU#Men)-(Eastern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

*	mlincom 3 (Country differences) WOMEN (out)
mlincom, clear
qui mlincom 12-10,	      rowname("(Western EU#Men)-(Northern EU#Men)") 	clear 	stat(est p ll ul) //  (Western EU#Men)-(Northern EU#Men)
qui mlincom 14-10,	      rowname("(Southern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Southern EU#Men)-(Northern EU#Men)
qui mlincom 16-10,	      rowname("(Eastern EU#Men)-(Northern EU#Men)") 	add 	stat(est p ll ul) //  (Eastern EU#Men)-(Northern EU#Men)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 10-12,	      rowname("(Northern EU#Men)-(Western EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 14-12,	      rowname("(Southern EU#Men)-(Western EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 16-12,	      rowname("(Eastern EU#Men)-(Western EU#Men)") 		add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 10-14,	      rowname("(Northern EU#Men)-(Southern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 12-14,	      rowname("(Western EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
qui mlincom 16-14,	      rowname("(Eastern EU#Men)-(Southern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

mlincom, clear
qui mlincom 10-16,	      rowname("(Northern EU#Men)-(Eastern EU#Men)") 	clear 	stat(est p ll ul)
qui mlincom 12-16,	      rowname("(Western EU#Men)-(Eastern EU#Men)") 		add 	stat(est p ll ul)
qui mlincom 14-16,	      rowname("(Southern EU#Men)-(Eastern EU#Men)") 	add 	stat(est p ll ul)
mlincom,	title("[Insert title]")

*>> Table A5. Results of asymmetric fixed-effects linear regression models on frailty, by welfare cluster and gender (Supplementary material). 
eststo clear

* Northern
eststo NorthernMen:  			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==0 & welfare_cluster==0, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

eststo NorthernWomen: 			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==1 & welfare_cluster==0, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

* Western
eststo WesternMen:  			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==0 & welfare_cluster==1, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

eststo WesternWomen: 			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==1 & welfare_cluster==1, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

* Southern
eststo SouthernMen: 			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==0 & welfare_cluster==2, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

eststo SouthernWomen: 			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==1 & welfare_cluster==2, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

* Eastern
eststo EasternMen:  			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==0 & welfare_cluster==3, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

eststo EasternWomen: 			xtreg FI age pcarecumpos pcarecumneg ib2.cjs i.income i.wealth treatment_months if sex==1 & welfare_cluster==3, fe robust
test pcarecumpos=-pcarecumneg
test (1.income=0) (2.income=0) (3.income=0) (4.income=0)
test (1.wealth=0) (2.income=0) (3.income=0) (4.income=0)

*>> Graph
coefplot 	(NorthernMen, 				label(NorthernMen))	(NorthernWomen, label(NorthernWomen))	, bylabel(`""{bf:Northern}" "{bf:Europe}""') || ///
			(WesternMen, 				label(WesternMen))	(WesternWomen, 	label(WesternWomen))	, bylabel(`""{bf:Western}" 	"{bf:Europe}""') || ///
			(SouthernMen, 				label(SouthernMen))	(SouthernWomen, label(SouthernWomen))	, bylabel(`""{bf:Southern}" "{bf:Europe}""') || ///
			(EasternMen, 				label(Men))			(EasternWomen, 	label(Women))			, bylabel(`""{bf:Eastern}" 	"{bf:Europe}""') || ///
			, keep(pcarecumpos pcarecumneg)  																										///
			xline(0) 																																///
			coeflabel(pcarecumpos = `""{bf:Transition}" "{bf:Into Caregiving}""' 																	///
					  pcarecumneg = `""{bf:Transition}" "{bf:Out of Caregiving}""', labsize() labgap()) legend(col(3) size()) 						/// 
			ylab(, labs()) xlab(-5 -2.5 0 2.5 5, ang(v))  																							/// 
			grid(glpattern(dash)) byopts(cols(4) title("")) xsize() aspect(1.15) yla(, ang(h))

graph save "$figure_out/FEModelsFItransitions", replace
graph export "$figure_out/FEModelsFItransitions.png", as(png) width(1252) height(910) replace


* 	Tables
esttab using "$tables_out/FEModelsFItransitions.txt", 											/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(2) ci(2) wide not notes 		///
	label constant obslast  aic bic sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3)   


* 	Interaction with gender 
xtreg FI $IVarsInteractionGender, fe vce(cluster couplepid)

* 	Wald test Allison 2019
test c.pcarecumpos#0.sex=-c.pcarecumneg#0.sex // Northern (Men)
test c.pcarecumpos#1.sex=-c.pcarecumneg#1.sex // Northern (Women) | p > 0.05 

* 	Wald test joint significance
test 	(c.pcarecumpos#0.sex)=(c.pcarecumpos#1.sex) 
test	(c.pcarecumneg#0.sex)=(c.pcarecumneg#1.sex) 


*----	[ 6. Other Data analysis & Output (for Reviewers) ]------------------------------------------------------*

*>> Reviewer 1. (Point 1.1.2)

* 	Comparing unadjusted model with adjusted model with activity limitation 

* 	1. sepby(gender)
eststo clear

eststo Men: 		xtreg FI $IVars 				if sex==0, fe vce(cluster couplepid)
eststo MenADJ: 		xtreg FI $IVars i.limitations 	if sex==0, fe vce(cluster couplepid)

eststo Women: 		xtreg FI $IVars 				if sex==1, fe vce(cluster couplepid)
eststo WomenADJ: 	xtreg FI $IVars i.limitations 	if sex==1, fe vce(cluster couplepid)


esttab using "$tables_out/REVIEWER_1_Limitations_gender.txt",									/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(2) se(2) wide not notes 		///
	label constant obslast  aic bic sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3) 


* 	2. sepby(gender welfare)
eststo clear

eststo Northern_Men: 		xtreg FI $IVars 				if sex==0 & welfare_cluster==0, fe vce(cluster couplepid)
eststo Northern_MenADJ: 	xtreg FI $IVars i.limitations 	if sex==0 & welfare_cluster==0, fe vce(cluster couplepid)

eststo Northern_Women: 		xtreg FI $IVars 				if sex==1 & welfare_cluster==0, fe vce(cluster couplepid)
eststo Northern_WomenADJ: 	xtreg FI $IVars i.limitations 	if sex==1 & welfare_cluster==0, fe vce(cluster couplepid)

eststo Western_Men: 		xtreg FI $IVars 				if sex==0 & welfare_cluster==1, fe vce(cluster couplepid)
eststo Western_MenADJ: 		xtreg FI $IVars i.limitations 	if sex==0 & welfare_cluster==1, fe vce(cluster couplepid)

eststo Western_Women: 		xtreg FI $IVars 				if sex==1 & welfare_cluster==1, fe vce(cluster couplepid)
eststo Western_WomenADJ: 	xtreg FI $IVars i.limitations 	if sex==1 & welfare_cluster==1, fe vce(cluster couplepid)

eststo Southern_Men: 		xtreg FI $IVars 				if sex==0 & welfare_cluster==2, fe vce(cluster couplepid)
eststo Southern_MenADJ: 	xtreg FI $IVars i.limitations 	if sex==0 & welfare_cluster==2, fe vce(cluster couplepid)

eststo Southern_Women: 		xtreg FI $IVars 				if sex==1 & welfare_cluster==2, fe vce(cluster couplepid)
eststo Southern_WomenADJ: 	xtreg FI $IVars i.limitations 	if sex==1 & welfare_cluster==2, fe vce(cluster couplepid)

eststo Eastern_Men: 		xtreg FI $IVars 				if sex==0 & welfare_cluster==3, fe vce(cluster couplepid)
eststo Eastern_MenADJ: 		xtreg FI $IVars i.limitations 	if sex==0 & welfare_cluster==3, fe vce(cluster couplepid)

eststo Eastern_Women: 		xtreg FI $IVars 				if sex==1 & welfare_cluster==3, fe vce(cluster couplepid)
eststo Eastern_WomenADJ: 	xtreg FI $IVars i.limitations 	if sex==1 & welfare_cluster==3, fe vce(cluster couplepid)

esttab using "$tables_out/REVIEWER_1_Limitations_gender_welfare.txt", 							/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(2) se(2) wide not notes 		///
	label constant obslast  aic bic sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3) 


* 	3. Three-way interaction 
eststo clear
eststo ThreeWayInter: 		xtreg FI $IVarsInteraction3 				, fe vce(robust)
eststo ThreeWayInterADJ: 	xtreg FI $IVarsInteraction3 i.limitations, fe vce(robust)

esttab using "$tables_out/REVIEWER_1_Limitations_Threeway.txt", 								/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(2) se(2) wide not notes 		///
	label constant obslast  aic bic sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3) 


*>> Reviewer 1. (Point 1.2.1)

* 	Comparing different health outcomes (or different dimensions of the Frailty Index)

* 	Generating the new health measures: 

* 	1. limitations in activities of daily living (ADL)
gen ADL 				= 	FI_dressing    	+ 	/// Difficulties: dressing, including shoes and socks
							FI_walkRoom    	+ 	/// Difficulties: walking across a room
							FI_bathing     	+ 	/// Difficulties: bathing or showering
							FI_eating      	+ 	/// Difficulties: eating, cutting up food
							FI_bed         	+ 	/// Difficulties: getting in or out of bed
							FI_toilet      		// 	Difficulties: using the toilet, incl getting up or down
		
* 	2. limitations in instrumental activities of daily living (IADL)
gen IADL 				= 	FI_hotmeal     	+ 	/// Difficulties: preparing a hot meal
							FI_shopping    	+ 	/// Difficulties: shopping for groceries
							FI_phone       	+ 	/// Difficulties: telephone calls 
							FI_medications 	+ 	/// Difficulties: taking medications
							FI_garden      	+ 	/// Difficulties: doing work around the house or garden
							FI_money         	// 	Difficulties: managing money
* 	3. number of limitations in mobility 
gen GrossMotorIndex 	= 	FI_walk100     	+ 	/// Difficulties: walking 100 metres
							FI_chair       	+ 	/// Difficulties: getting up from chair
							FI_stairs      	+ 	/// Difficulties: climbing one flight of stairs
							FI_arms        	+ 	/// Difficulties: reaching or extending arms above shoulder
							FI_lift5kg      	// 	Difficulties: lifting or carrying weights over 5 kilos

* 	4. number of chronic diseases
gen ChronicDiseases 	= 	FI_heartattack  + 	/// Heart attack: ever diagnosed
							FI_hypertension + 	/// High blood pressure or hypertension: ever diagnosed
							FI_stroke       + 	/// Stroke: ever diagnosed
							FI_diabetes     + 	/// Diabetes or high blood sugar: ever diagnosed
							FI_lungdisease  + 	/// Chronic lung disease: ever diagnosed
							FI_arthritis    + 	/// Arthritis: ever diagnosed
							FI_cancer       + 	/// Cancer: ever diagnosed
							FI_parkinson    + 	/// Parkinson disease: ever diagnosed
							FI_fracture      	//	Hip fracture or femoral fracture: ever diagnosed

* 	5. self-rated health
ta srh

* 	6. grip strength
ta maxgrip

* 	7. Depression 	// We adopt the widely adopted EURO-D threshold of 4 points (or higher) 
					// as a more accurate predictor of latent psychological issues. 
					// A EURO-D value of 4 (or higher) has been demonstrated to be associated 
					// with a clinically significant level of depression (Dewey & Prince, 2005).
ta eurod 

* 	Some descriptive statistics: 

sum ADL
sum IADL
sum GrossMotorIndex
sum ChronicDiseases
sum srh
sum maxgrip
sum eurod

egen z_ADL 				= std(ADL)
egen z_IADL 			= std(IADL)
egen z_GrossMotorIndex 	= std(GrossMotorIndex)
egen z_ChronicDiseases 	= std(ChronicDiseases)
egen z_srh 				= std(srh)
egen z_maxgrip 			= std(maxgrip)
egen z_eurod 			= std(eurod)

revrs z_maxgrip

*>> Analysis: 
* 	1. Limitations in activities of daily living (ADL)
* 	2. Limitations in instrumental activities of daily living (IADL)
* 	3. Number of limitations in mobility 
* 	4. Number of chronic diseases
* 	5. Self-rated health
* 	6. Grip strength
* 	7. Depression 

* 	Tables: 
eststo clear
eststo ADL_Men: 				xtreg z_ADL 				$IVars if sex==0, fe vce(robust)
eststo ADL_Women: 				xtreg z_ADL 				$IVars if sex==1, fe vce(robust)
eststo IADL_Men: 				xtreg z_IADL 				$IVars if sex==0, fe vce(robust)
eststo IADL_Women: 				xtreg z_IADL 				$IVars if sex==1, fe vce(robust)
eststo GrossMotorIndex_Men: 	xtreg z_GrossMotorIndex 	$IVars if sex==0, fe vce(robust)
eststo GrossMotorIndex_Women: 	xtreg z_GrossMotorIndex 	$IVars if sex==1, fe vce(robust)
eststo ChronicDiseases_Men: 	xtreg z_ChronicDiseases 	$IVars if sex==0, fe vce(robust)
eststo ChronicDiseases_Women: 	xtreg z_ChronicDiseases 	$IVars if sex==1, fe vce(robust)
eststo SRH_Men: 				xtreg z_srh 				$IVars if sex==0, fe vce(robust)
eststo SRH_Women: 				xtreg z_srh 				$IVars if sex==1, fe vce(robust)
eststo GRIP_Men: 				xtreg revz_maxgrip 			$IVars if sex==0, fe vce(robust)
eststo GRIP_Women: 				xtreg revz_maxgrip 			$IVars if sex==1, fe vce(robust)
eststo Depression_Men: 			xtreg z_eurod 				$IVars if sex==0, fe vce(robust)
eststo Depression_Women: 		xtreg z_eurod 				$IVars if sex==1, fe vce(robust)

esttab using "$tables_out/additionalAnalyses.txt", 									/// 
	tab replace plain star(+ 0.10 * 0.05  **  0.01 *** 0.001) b(3) wide not notes 	///
	label constant obslast  aic bic sca(rho sigma_u r2_a r2_w r2_o r2_b N_g groups N) sfmt(3)  


* 	Figures: 
coefplot 																																					///
(ADL_Men, 				label(ADL_Men)) 			(ADL_Women, 			label(ADL_Women)), bylabel("{bf:ADL}") 										|| 	///	
(IADL_Men, 				label(IADL_Men)) 			(IADL_Women, 			label(IADL_Women)), bylabel("{bf:IADL}")			 						|| 	///	
(GrossMotorIndex_Men,	label(GrossMotorIndex_Men)) (GrossMotorIndex_Women, label(GrossMotorIndex_Women)), bylabel(`""{bf:Gross Motor}" "{bf:Index}""') || 	///				
(ChronicDiseases_Men,	label(ChronicDiseases_Men)) (ChronicDiseases_Women, label(ChronicDiseases_Women)), bylabel(`""{bf:Chronic}" "{bf:Diseases}""') 	|| 	///				
(SRH_Men, 				label(SRH_Men)) 			(SRH_Women, 			label(SRH_Women)), bylabel(`""{bf:Self-Reported}" "{bf:Health}""') 			|| 	///	
(GRIP_Men, 				label(GRIP_Men)) 			(GRIP_Women, 			label(GRIP_Women)), bylabel("{bf:Grip Strength}") 							|| 	///	
(Depression_Men, 		label(Men)) 				(Depression_Women, 		label(Women)), bylabel("{bf:Depression}") 									|| 	///
, keep(pcarecumpos pcarecumneg) xline(0)																													///
coeflabel(pcarecumpos = `""{bf:Transition}" "{bf:Into Caregiving}""' 																						///
		  pcarecumneg = `""{bf:Transition}" "{bf:Out of Caregiving}""', labsize() labgap()) legend(col(2) size()) ylab(, labs())   							/// 
grid(glpattern(dash)) byopts(cols(4) title("")) xsize() aspect(1.15) yla(, ang(h))				

graph save "$figure_out/OtherFIdimensions", replace
graph export "$figure_out/OtherFIdimensions.png", as(png) width(1252) height(910) replace


*>> Reviewer 3 H5
xtreg FI $IVarsInteractionWelfare if sex==0, fe vce(cluster couplepid)
margins, dydx(pcarecumpos pcarecumneg) over(welfare_cluster) atmeans vsquish post
marginsplot, plotopts(connect(none)) yline(0)

xtreg FI $IVarsInteractionWelfare if sex==1, fe vce(cluster couplepid)
margins, dydx(pcarecumpos pcarecumneg) over(welfare_cluster) atmeans vsquish post  level(90)
marginsplot, plotopts(connect(none)) yline(0) 



*----	[ 7. Close ]---------------------------------------------------------------------------------------------*

*>> Timer
display "$S_TIME  $S_DATE"
timer off 1
timer list 1

*>> Log file
log close

