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
*----	[ 0. Stata Version & Settings ]--------------------------------------------------------------------------*
*----	[ 1. Define paths ]--------------------------------------------------------------------------------------*
*----	[ 2. Execute do-files ]----------------------------------------------------------------------------------*
*----	[ 3. Close ]---------------------------------------------------------------------------------------------*


******************************************************************************************************************



*----	[ 0. Stata Version & Settings ]--------------------------------------------------------------------------*

*>> Clear results window
cls

*>> Stata version 
version 15.1 

*>> Log close 
capture log close

*>> Recording time Stata needs for running the do-file
display "$S_TIME  $S_DATE"
timer clear
timer on 1

*>> Other settings
clear
clear matrix
set max_memory .
set logtype text
set more off


*----	[ 1. Define paths ]--------------------------------------------------------------------------------------*

*>> Macro's for file save locations
*	Do-files' folders
global dataset_creation "C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Code/1. Dataset Creation"
global dataset_cleaning "C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Code/2. Data Cleaning"
global dataset_analysis "C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Code/3. Data Analysis"

*	Log files's folders 
global share_logfile 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/Log folder"

*	Dataset input
global share_w1_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew1_rel7-0-0_ALL_datasets_stata" 
global share_w2_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew2_rel7-0-0_ALL_datasets_stata"
global share_w3_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew3_rel7-0-0_ALL_datasets_stata"
global share_w4_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew4_rel7-0-0_ALL_datasets_stata" 
global share_w5_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew5_rel7-0-0_ALL_datasets_stata"
global share_w6_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew6_rel7-0-0_ALL_datasets_stata"
global share_w7_in  	"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharew7_rel7-0-0_ALL_datasets_stata"
global share_cv_r		"A:/Encrypted datasets/Source/SHARE/Release 7.0.0/sharewX_rel7-0-0_gv_allwaves_cv_r_stata"

*	Dataset output
global share_w1_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w1"
global share_w2_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w2"
global share_w3_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w3"
global share_w4_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w4"
global share_w5_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w5"
global share_w6_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w6"
global share_w7_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/w7"
global share_all_out 	"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/W_All"


*	Consistency controls between waves (Windows "Spreadsheet Compare 2016")
global codebook 		"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/Codebook"

*	Tables and Figures
global tables_out 		"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/Tables"
global figure_out 		"C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Output folder/Figures"


*----	[ 2. Execute do-files ]----------------------------------------------------------------------------------*

*>> Dataset Creation
do "$dataset_creation/[NIDI-CREW] - 02 - Second Paper - Dataset Creation.do"

*>> Data Cleaning
do "$dataset_cleaning/[NIDI-CREW] - 02 - Second Paper - Data Cleaning.do"

*>> Data analysis
do "$dataset_analysis/[NIDI-CREW] - 02 - Second Paper - Data Analysis.do"


*----	[ 3. Close ]---------------------------------------------------------------------------------------------*

*>> Timer 
display "$S_TIME  $S_DATE"
timer off 1
timer list 1


