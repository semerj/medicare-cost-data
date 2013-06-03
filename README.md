CMS Hospital Charge Data Visualization
==================
Challenge #2 in the **Improve Healthcare** category of [National Day of Civic Hacking] (http://www.hackforchange.org/challenge/improve-healthcare)

**Goal:**

To visualize and link Centers for Medicare & Medicaid Services (CMS) inpatient cost-charge data with hospital quality (30-day outcomes readmission and deaths) and patient experience ratings in order creating a proxy for hospital value, with a specific focus on heart failure, heart attack, and pneumonia.

**Data Source:**

Before we begin, you must download/unzip:

1. The latest [CMS Hospital Compare data] (http://www.medicare.gov/Download/DownloadDB.asp) in .csv flatfile format. We're interested in `Outcome of Care Measures.csv` and `HCAHPS Measures.csv`
2. The newly released [CMS Inpatient Provider Charge data] (http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Inpatient.html) in .csv flatfile format.

**Data time periods:**

* [Inpatient cost/charge] (http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Inpatient.html) data are from FY2011 (10/1/2010 - 9/30/2011, I believe)
* [Readmission/mortality] (http://www.medicare.gov/HospitalCompare/Data/RCD/30-day-measures.aspx) data for all three conditions are from 7/1/2008 - 6/30/2011.
* [HCAHPS] (http://www.medicare.gov/HospitalCompare/Data/PatientSurvey/Overview.aspx) data, specifically top-box scores for *'Overall Hospital Rating'* and *'Recommend the Hospital'* questions, are from 7/1/2010 - 6/30/2011. (May consider averaging results with previous data.) 

**Notes:**

* All data is taken from the individual hospital level.
* Cost and quality data are not matched to individual patients. 
* DRGs are matched to conditions publically reported by CMS. 
* Measure time periods don't perfectly match across measures.
