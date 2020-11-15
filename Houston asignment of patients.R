
# #load the library "Minirand" (you can install the package from RStudio)
# library(Minirand)
# #ntrt is a variable in the Minirand package, asign 2 to the number of treatments (placebo, KE)
# ntrt <- 2; nsample <- 51
# # asign 50 to the variable for number in sample
# # populate the vector for treatment sequence with the values 1 and 2
# trtseq <- c(1, 2)
# # define the ratio of numbers wanted in each treatment
# ratio <- c(1, 1)
# # make up data for 50 patients
# # column 1 is gender  males=0 females=1. 
# c1 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.4, 0.6))
# # column 2 is non Smoker=0 smoker=1
# c2 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.3, 0.7))
# # column 3 is Oxygen status No oxygen =0, NC Low =1, NC High=2, BIPAP=3, Vent=4
# c3 <- c(sample(c(4, 3, 2, 1, 0), nsample, replace=TRUE, prob=c(0.2, 0.2, 0.3, 0.1, 0.2)))
# # column 4 is age cohort <20=0, 20-29=1, 30-44=2, 45-54=3,55-64=4, >65=5
# c4 <- c(sample(c(5, 4, 3, 2, 1, 0), nsample, replace=TRUE, prob=c(0.05, 0.2, 0.3, 0.3, 0.2, 0.2)))
# # make the four columns one matrix of covariate factors for the subjects
# covmat <- cbind(c1, c2, c3, c4)
# # label of the covariates
# colnames(covmat) = c("Gender", "Smoker", "O2 Support", "Age")
# # weight the covariates
# covwt <- c(1/8, 1/8, 1/2, 1/4) #more weight to O2 support and age 
# #copy 100 into the vector res of fifty values. We will replace these with 0s and 1s.
# res <- rep(100, nsample) # result is the treatment needed from minimization
# #generate random treatment assignment for the 1st subject
# 
# res[1] = sample(trtseq, 1, replace=TRUE, prob=ratio/sum(ratio))
# for (j in 2:nsample)
# {
#   # get treatment assignment sequentiall for all subjects
#   # This is the function we would use to get the next treatment.
#   res[j] <- Minirand(covmat=covmat, j, covwt=covwt, ratio=ratio,
#                      ntrt=ntrt, trtseq=trtseq, method="Range", result=res, p=0.9)
# }
# trt1 <- res
# #Display the number of randomized subjects at covariate factors
# balance1 <- randbalance(trt1, covmat, ntrt, trtseq)
# balance1
# covmat


######################################################################################
# Result was a succesful demonstration of adaption to the COVID-19 trial
################################################################################

#The following repeats the proof of concept with all the covariates we plan to test.
#My goal is to test weighting factors and groupings and validating that the distribution 
#of covariates is balanced.

# Indicators of current COVID-19 severity:
#   Oxygen support: None=0, Nasal Cannula low flow=1, Nasal Cannula high flow = 2
# Count of symptoms in past 24 hrs : 0 to 5=0, 6-10=1, >11=2)
# pO2:  100 to 97= 0, 96 to 93=1, 92 to 89 =2, 88 to 84=3, <83=4
# CRP level: Unknown = 0,  16 ??g/ml to  40 ??g/ml = 1, 41 ??g/ml to  70 ??g/ml=2, >70 ??g/ml=3
# Risk Factors
# Age 18-29=0, 30-39=1, 40-49=2, 50-59=3, 60-69=4, 70 and above=5
# Smoker No=0, Yes=1
# Obesity BMI: Underweight(BMI<18.5)=0, Healthy weight BMI (18.5-24.9)=1, Overweight (BMI 25-29)=2, Obese class I(BMI 30-34.9)=3, Obese class II (BMI 35-39.9)=4, Obese class III(BMI>=40)=5
# Alcohol None=0, Beer and Wine=1, Distilled Spirits=2
# Ethnicity Unknown=0, American Indian or Alaska Native=1, Asian=2, Caucasian=3, Hispanic=4, African American=5
# Gender Male=0, Female=1
# Comorbidities
# Cancer: False=0, True=1
# Chronic Kidney Disease: False=0, True=1
# Heart conditions such as heart failure, coronary artery disease or cardiomyopathies: False=0, True=1
# Immunocompromised state from organ transplant: False=0, True=1
# Sickle cell disease: False=0, True=1
# Type II diabetes mellitus: False=0, True=1
# Type I diabetes: False=0, True=1
# Asthma (moderate to severe) : False=0, True=1
# Cerebrovascular disease: False=0, True=1
# Cystic fibrosis: False=0, True=1
# Hypertension or high blood pressure: False=0, True=1
# Immunocompromised from blood or bone marrow transplant, immune deficiencies, HIV, Use of corticosteroids or other immune weakening medicines: False=0, True=1
# Neurological conditions such as dementia: False=0, True=1
# Liver disease: False=0, True=1
# Pulmonary fibrosis (damaged or scarred lung tissue) : False=0, True=1
# Thalassemia (a type of blood disorder): False=0, True=1

#load the library "Minirand" (you can install the package from RStudio)
library(Minirand)
#ntrt is a variable in the Minirand package, asign 2 to the number of treatments (placebo, KE)
ntrt <- 2; nsample <- 51
# asign 50 to the variable for number in sample
# populate the vector for treatment sequence with the values 1 and 2
trtseq <- c(1, 2)
# define the ratio of numbers wanted in each treatment
ratio <- c(1, 1)
# make up data for 50 patients

# Indicators of current COVID-19 severity:
# column 1 is Oxygen status No oxygen =0, NC Low =1, NC High=2  BIPAP and vent are excluded
c1 <- c(sample(c(2, 1, 0), nsample, replace=TRUE, prob=c(0.3, 0.4, 0.3)))
# column 2 is Count of symptoms in past 24 hrs : 0 to 5=0, 6-10=1, >11=2)
c2 <- c(sample(c(2, 1, 0), nsample, replace=TRUE, prob=c(0.3, 0.4, 0.3)))
# column 3 is pO2:  100 to 97= 0, 96 to 93=1, 92 to 89 =2, 88 to 84=3, <83=4
c3 <- c(sample(c(4, 3, 2, 1, 0), nsample, replace=TRUE, prob=c(0.1, 0.2, 0.2, 0.3, 0.1)))
# column 4 is CRP level: Unknown = 0, 16 ??g/ml-40 ??g/ml = 1, 41 ??g/ml-70 ??g/ml=2, >70 ??g/ml=3
c4 <- c(sample(c( 3, 2, 1, 0), nsample, replace=TRUE, prob=c( 0.3, 0.3, 0.3, 0.1)))

# Risk Factors
# column 5 is Age 18-29=0, 30-39=1, 40-49=2, 50-59=3, 60-69=4, 70 and above=5
c5 <- c(sample(c(5, 4, 3, 2, 1, 0), nsample, replace=TRUE, prob=c(0.05, 0.2, 0.3, 0.3, 0.2, 0.2)))
# column 6 is Smoker No=0, Yes=1
c6 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.3, 0.7))
# column 7 is Obesity BMI: Underweight(BMI<18.5)=0, Healthy weight BMI (18.5-24.9)=1, 
# Overweight (BMI 25-29)=2, Obese class I(BMI 30-34.9)=3, Obese class II (BMI 35-39.9)=4, 
# Obese class III(BMI>=40)=5
c7 <- c(sample(c(5, 4, 3, 2, 1, 0), nsample, replace=TRUE, prob=c(0.05, 0.2, 0.3, 0.3, 0.2, 0.2)))
# Alcohol None=0, Beer and Wine=1, Distilled Spirits=2
c8 <- c(sample(c(2, 1, 0), nsample, replace=TRUE, prob=c(0.3, 0.4, 0.3)))
# Ethnicity Unknown=0, American Indian or Alaska Native=1, Asian=2, Caucasian=3, Hispanic=4, 
# African American=5
c9  <- c(sample(c(5, 4, 3, 2, 1, 0), nsample, replace=TRUE, prob=c(0.05, 0.2, 0.3, 0.3, 0.2, 0.2)))
# Gender Male=0, Female=1
c10 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.4, 0.6))

# Comorbidities
# Cancer: False=0, True=1
c11 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Chronic Kidney Disease: False=0, True=1
c12 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Heart conditions such as heart failure, coronary artery disease or cardiomyopathies: False=0, True=1
c13 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Immunocompromised state from organ transplant: False=0, True=1
c14 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Sickle cell disease: False=0, True=1
c15 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Type II diabetes mellitus: False=0, True=1
c16 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Type I diabetes: False=0, True=1
c17 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Asthma (moderate to severe) : False=0, True=1
c18 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Cerebrovascular disease: False=0, True=1
c19 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Cystic fibrosis: False=0, True=1
c20 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Hypertension or high blood pressure: False=0, True=1
c21 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Immunocompromised from blood or bone marrow transplant, immune deficiencies, HIV, Use of corticosteroids or other immune weakening medicines: False=0, True=1
c22 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Neurological conditions such as dementia: False=0, True=1
c23 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Liver disease: False=0, True=1
c24 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Pulmonary fibrosis (damaged or scarred lung tissue) : False=0, True=1
c25 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# Thalassemia (a type of blood disorder): False=0, True=1
c26 <- sample(seq(1, 0), nsample, replace=TRUE, prob=c(0.95, 0.05))
# make the four columns one matrix of covariate factors for the subjects
covmat <- cbind(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, 
                c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26)
# label of the covariates
colnames(covmat) = c("Oxygen support", "Count of symptoms", "pO2", "CRP", 
                     "Age", "Smoker", "Obesity", "Alcohol", "Race/Ethnicity", "Gender",
                     "Cancer", "Chronic Kidney Disease", "Heart conditions",
                     "Immunocompromised from transplant", "Sickle cell disease", "Type II diabetes",
                     "Type I diabetes", "Asthma (moderate to severe)", "Cerebrovascular disease", 
                     "Cystic fibrosis", "Hypertension", "Immunocompromised other", 
                     "Neurological", "Liver disease", "Pulmonary fibrosis", "Thalassemia")
# weight the covariates
covwt <- c(21/260, 21/260, 22/260, 22/260, 21/260, 21/260, 21/260, 21/260, 21/260, 21/260, 3/260, 
           3/260, 3/260, 3/260, 3/260, 3/260, 3/260, 3/260, 3/260, 
           3/260, 3/260, 3/260, 3/260, 3/260, 3/260, 3/260) #more weight to O2 support and age 
#copy 100 into the vector res of fifty values. We will replace these with 0s and 1s.
res <- rep(100, nsample) # result is the treatment needed from minimization
#generate random treatment assignment for the 1st subject

res[1] = sample(trtseq, 1, replace=TRUE, prob=ratio/sum(ratio))
for (j in 2:nsample)
{
  # get treatment assignment sequentiall for all subjects
  # This is the function we would use to get the next treatment.
  res[j] <- Minirand(covmat=covmat, j, covwt=covwt, ratio=ratio,
                     ntrt=ntrt, trtseq=trtseq, method="Range", result=res, p=0.9)
}
trt1 <- res
#Display the number of randomized subjects at covariate factors
balance1 <- randbalance(trt1, covmat, ntrt, trtseq)
balance1
covmat

##################################################################################
#Running the above 4 times showed excellent even distribution between treatment and 
# Placebo. Remaining tasks: read from data export on google drive
# Convert to live assignment in a dashboard.
###################################################################
#This script establishes the covariant matrix and promts for the next patients data.
#load the library "Minirand" (you can install the package from RStudio)
library(Minirand)
#ntrt is a variable in the Minirand package, asign 2 to the number of treatments (placebo, KE)
ntrt <- 2
# asign 50 to the variable for number in sample
nsample <- 50
# populate the vector for treatment sequence with the values 1 and 2
trtseq <- c(1, 2)
# define the ratio of numbers wanted in each treatment
ratio <- c(1, 1)

# Ask for data for initial patient:
set_wd <- function() {
  library(rstudioapi) # make sure you have it installed
  current_path <- getActiveDocumentContext()$path
  setwd(dirname(current_path ))
  print( getwd() )
}

# I will run the function
set_wd()

# Read csv skip x lines, get rownames and columnames, First column has no name.
patientallocation.data <-read.csv(file = "PatientAllocationData.csv")

# patientallocation.data [1:1,1:2]
# patientallocation.data$Smoker
# patientallocation.data$O2Status
# patientallocation.data$?..PatientEnrollmentSequence
# # make  all the columns the right data type:
# typeof(patientallocation.data$AgeCohort )
# 




# make the four columns one matrix of covariate factors for the subjects
covmat <- cbind(patientallocation.data$AgeCohort, patientallocation.data$Smoker,
                patientallocation.data$O2Status, patientallocation.data$CRPCohort)
# label of the covariates
colnames(covmat) = c("Age", "Smoker", "O2 Support", "CRP")
# weight the covariates
covwt <- c(1/8, 1/8, 1/2, 1/4) #more weight to O2 support and age 
#copy 100 into the vector res of fifty values. We will replace these with 0s and 1s.
res <- rep(100, nsample) # result is the treatment needed from minimization
#generate random treatment assignment for the 1st subject

res[1] = sample(trtseq, 1, replace=TRUE, prob=ratio/sum(ratio))
res[1]
# Write the result to a file.
 c01 <- c("Patientsequence","1")
c02 <- c("TreatmentAssigned",res[1])
OutputData <- rbind(c01,c02,covmat)

for (j in 2:nsample)
{
  # get treatment assignment sequentiall for all subjects
  # This is the function we would use to get the next treatment.
  res[j] <- Minirand(covmat=covmat, j, covwt=covwt, ratio=ratio,
                     ntrt=ntrt, trtseq=trtseq, method="Range", result=res, p=0.9)
}
trt1 <- res
#Display the number of randomized subjects at covariate factors
balance1 <- randbalance(trt1, covmat, ntrt, trtseq)
balance1
covmat

update.packages(ask = FALSE, checkBuilt = TRUE)
R.version
install.packages("installr")
library(installr)
updateR()
install.packages("gitcreds")
3

install.packages("credentials")
library(credentials)

set_github_pat()