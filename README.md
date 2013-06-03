HHS Data Challenge
==================

Goal:

Join Heart Failure, Heart Attack, and Pneumonia cost (inpatient charges by DRG) and quality data (30-day outcomes readmission and deaths) together and generate a rough proxy for value

Before we begin, you must download/unzip:

1. The latest [CMS Hospital Compare data] (http://www.medicare.gov/Download/DownloadDB.asp) in csv flatfile format. We're only interested in `Outcome of Care Measures.csv`.
2. The newly released [CMS Inpatient Provider Charge data] (http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Inpatient.html) in csv flatfile format

Data time periods:

* Readmission/mortality data for all three conditions are from 7/1/2008 - 6/30/2011
* Inpatient cost/charge data are from FY2011 (10/1/2010 - 9/30/2011, I believe)

Dates don't perfectly match across measures, and nor will cost and quality at the patient-level. The point is to approximate value (quality/cost) at the hospital-level. 
