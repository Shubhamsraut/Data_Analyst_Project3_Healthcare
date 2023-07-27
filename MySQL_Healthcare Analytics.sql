create database healthcare_analytics;
use healthcare_analytics;

#1. Number of Patients across various summaries
select sum(Patients_in_hypercalcemia_summary) as Patients_in_hypercalcemia_summary,
sum(Patient_months_hypercalcemia_summary) as Patient_months_hypercalcemia_summary,
sum(`Patients_in_Serum_phosphorus summary`) as Patients_in_Serum_phosphorus_summary,
sum(Patient_months_in_Serum_phosphorus_summary) as Patient_months_in_Serum_phosphorus_summary,
sum(Patients_included_in_hospitalization_summary) as Patients_included_in_hospitalization_summary,
sum(Hospitalizations_included_in_hospital_readmission_summary) as Hospitalizations_included_in_hospital_readmission_summary,
sum(Patients_included_in_survival_summary) as Patients_included_in_survival_summary,
sum(Patients_included_in_fistula_summary) as Patients_included_in_fistula_summary,
sum(Patients_in_long_term_catheter_summary) as Patients_in_long_term_catheter_summary,
sum(Patient_months_in_long_term_catheter_summary) as Patient_months_in_long_term_catheter_summary,
sum(Patients_in_nPCR_summary) as Patients_in_nPCR_summary,
sum(Patient_months_in_nPCR_summary) as Patient_months_in_nPCR_summary,
sum(Patients_included_in_the_transfusion_summary) as Patients_included_in_the_transfusion_summary
from 
healthcare_analytics.health__care__analytics;

#2. Profit Vs Non-Profit Stats
select count(case when `Profit_or_Non-Profit`="Profit" then 1 end) as Profit_Count,
count(case when `Profit_or_Non-Profit`="Non-Profit" then 1 end) as Non_Profit_Count
from 
healthcare_analytics.health__care__analytics;

#3. Chain Organizations w.r.t. Total Performance Score as No Score
select Chain_Organization,sum(case when Total_Performance_Score = "No score" then 1 end) as Chain_Organization_Count
from
healthcare_analytics.health__care__analytics
group by Chain_Organization
order by Chain_Organization_count desc;

select Chain_Organization,count(*) as Chain_Organization_Count
from
healthcare_analytics.health__care__analytics
where Total_Performance_Score = "No score"
group by Chain_Organization
order by Chain_Organization_count desc;

select Chain_Organization,count(*) as Chain_Organization_Count
from
healthcare_analytics.health__care__analytics
where Total_Performance_Score="No score"
group by Chain_Organization
order by Chain_Organization_count desc;

#4. Dialysis Stations Stats
select `Facility_Not Availableme` as Facility,
sum(Count_of_Dialysis_Stations) as Dialysis_Station_Count
from 
healthcare_analytics.health__care__analytics
group by facility
order by Dialysis_Station_Count desc
limit 10;

#5. # of Category Text  - As Expected
select sum(case when Patient_hospitalization_category_text="As Expected" then 1 end) as Patient_hospitalization_category_text,
sum(case when Patient_Survival_Category_Text="As Expected" then 1 end) as Patient_Survival_Category_Text,
sum(case when Fistula_Category_Text="As Expected" then 1 end) as Fistula_Category_Text,
sum(case when SWR_category_text="As Expected" then 1 end) as SWR_category_text,
sum(case when PPPW_category_text="As Expected" then 1 end) as PPPW_category_text,
sum(case when Patient_Infection_category_text="As Expected" then 1 end) as Patient_Infection_category_text,
sum(case when Patient_Transfusion_category_text="As Expected" then 1 end) as Patient_Transfusion_category_text
from
healthcare_analytics.health__care__analytics;
 
#6. Average Payment Reduction Rate
select concat(round(avg((Payment_Reduction_Rate))*100,3),"%") as Avg_Payment_Reduction_Rate
from 
healthcare_analytics.health__care__analytics;