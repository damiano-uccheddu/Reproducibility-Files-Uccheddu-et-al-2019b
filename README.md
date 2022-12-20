# Reproducibility Files
# [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7462078.svg)](https://doi.org/10.5281/zenodo.7462078)

### Uccheddu, Damiano, Anne H. Gauthier, Nardi Steverink, and Tom Emery. ‘The Pains and Reliefs of the Transitions into and out of Spousal Caregiving. A Cross-National Comparison of the Health Consequences of Caregiving by Gender’. *Social Science & Medicine* 240 (2019b): 112517. https://doi.org/10.1016/j.socscimed.2019.112517.



# Instructions: 
1. Download the data (SHARE Release 7.0.0) from this link: https://releases.sharedataportal.eu/users/login
2. Unzip the downloaded compressed (zipped) folders
3. Open the master do-file "[NIDI-CREW] - 01 - First Paper - Master do-file.do"
4. Change all the paths to match your own computer's paths (rows from 66 to 99 in master the do-file). For instance, if you are using Microsoft Windows, change the path from "C:/Users/Damiano/Dropbox/NIDI/02 - Second paper/Reproducibility Files/Data Analysis/Code/1. Dataset Creation" to "C:/Users/[your_username]/[your_path]/Data Analysis/Code/1. Dataset Creation" and create the appropriate folders if necessary. 
5. Run the do-file "[NIDI-CREW] - 02 - Second Paper - Master do-file.do" to perform the data analysis
6. If Stata returns an error message related to the paths, you probably need to modify the paths only in the master do-file "[NIDI-CREW] - 01 - First Paper - Master do-file.do". 



# Notes:
- The do-file "[NIDI-CREW] - 02 - Second Paper - Dataset Creation.do" merges and appends all the necessary modules and waves of SHARE, creating a dataset in long format
- The do-file "[NIDI-CREW] - 02 - Second Paper - Data Cleaning.do" cleans the dataset, harmonizes some variables, creates the independent and dependent variables, and selects only the necessary variables that will be used in the main analysis. 
- The do-file "[NIDI-CREW] - 02 - Second Paper - Data Analysis.do" performs the analyses included in the study and the robustness checks asked by the reviewers. It also includes the "results available upon request" mentioned in the paper. 
- The tables will be shown in the Excel file "Tables.xlsx" contained within the folder "C:/Users/[your_username]/[your_path]/Data Analysis/Output folder/Tables"
- The figures will be shown in the folder "C:/Users/[your_username]/[your_path]/Data Analysis/Output folder/Figures"
