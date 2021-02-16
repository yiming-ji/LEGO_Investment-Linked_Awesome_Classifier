# LEGO Investment-Linked Awesome Classifier (LILAC)

## Table of contents
* [Introduction](#Introduction)
* [Prerequisites](#Prerequisites)
* [File Directory](#File-Directory)
* [Data Dictionary](#Data-Dictionary)
* [Contact Info](#Contact-Info)
***

### Introduction

This project was inspired by a random encounter with the website  https://www.bricklink.com/. Bricklink is the world's largest secondary marketplace to buy and sell LEGO products. After some research, it was discovered that not only can LEGO be a viable alternative investment, but its annualized investment returns for the past 10 years have also been very comparable to the S&P500 index.

&nbsp;
<div>
<img src="attachment:image.png" width="500"/>
</div>
&nbsp;

Just like some stocks perform better than others, picking the right LEGO set will also generate better returns. With that, a business problem was framed as such: 

Can one leverage data science (machine learning in particular) to identify good LEGO investment opportunities to outperform the general stock market?
***

### Prerequisites

The project was run on a 64-bit `Windows` machine, and Python (`ver 3.8.5`) was the language used. The environment with all the required packages has also been included in the repository as `environment.yml`. 
***

### File Directory

This project followed the recommended Data Analysis process outlined in Drs. `Roger Peng` and `Elizabeth Matsui`'s book `The Art of Data Science` (https://leanpub.com/artofdatascience). The project folders and files have also been organized to reflect the 5 core activities (of data analysis) that were detailed in their book: 
- Starting and refining the question
- Exploring the data
- Building formal statistical models
- Interpreting the results
- Communicating the results

**1. Data_Gathering**

Data used in this project was 100% scraped from a number of LEGO-themed websites. Files in this foler have detailed the process. 

  * `1-1 Rebrickable.ipynb` contains webscraping process of https://rebrickable.com/.

  * `1-2 Brickinsights_Brickowl_Brickeconomy.ipynb` contains webscraping process of https://brickinsights.com/, https://www.brickowl.com/, and https://www.brickeconomy.com/.

  * `1-3 Brickset_Legocom_Bricklink.ipynb` contains webscraping process of https://brickset.com/, https://www.lego.com/, and https://www.bricklink.com/.

  * `1-4 Brickeconomy_additional_details.ipynb` contains additional information scraped from https://www.brickeconomy.com/.

**2. Data_Cleaning**

Web-scraped data in their original forms were difficult to use in analysis. The data cleaning and management processes can be found in this folder. 

  * `MySQL` contains a schema created for data storage and data management. 

  * `2. Data_Cleaning.ipynb` notebook containing data cleaning and preprocessing steps.

**3. Exploratory_Data_Analysis**

  * `3. Exploratory_Data_Analysis (EDA).ipynb` notebook containing the steps of exploratory data analysis, feature selection, and feature engineering. 

**4. Modelling**

  * `4. Classification Modelling.ipynb` notebook detailing the modelling process using a range of classifiers of different complexities.

**data**

All the data scraped or processed are saved in the form of (23) `csv`'s in this folder. 

**LILAC_Final_Report**

  * `LILAC_Final_Report` is the complete report of the project.
***

### Data Dictionary

Some key features are explained below for people who might not be knowledgeable about LEGO.

  * `LEGO set`: a plastic construction set produced by LEGO for making mechanical models.  

  * `set_num`: short for "set number", it is a unique identifier assigned to each LEGO set.

  * `set_name`: alongside the set number, this is another identifier of a LEGO set.

  * `rrp`: short for "Recommended Retail Price", it is LEGO's original retail price in the primary market. All prices, unless otherwise specified, are in Canadian dollars.

  * `release_year`: the year when a LEGO set was released to the primary market.

  * `part`: LEGO is a construction toy and each building piece is referred to as a "part" in this project. "num_parts" is the number of building pieces in each LEGO set.

  * `part_cat`: each part is uniquely identified by a number/name and belongs to a grouped category.

  * `color`: color is a key feature of a LEGO set/part. It is uniquely identified by a number (ID) and a name. In addition, `color_trans` identifies the parts that are transparent.    

  * `theme`: a certain subject which a number of LEGO sets are produced and branded around. `parent_theme`: LEGO themes have two tiers - some more specific themes are nested under other more general ones. The more general themes are referred to as the "parent themes".

  * `inventory`: a term used by the website Rebrickable and it refers to the smaller bags of parts that come with a LEGO set.

  * `mini-figures`: a small plastic articulated figurine produced by LEGO. Some mini-figures are included as part of a LEGO set, while others are sold on their own.

  * `annual_growth`: the annualized value growth is calculated as
$\large\left(\frac{current.price}{original.price}\right)^{\frac{1}{years.since.release}}-1$.
***

### Contact Info
If you have any questions or suggestions, please do not hesitate to reach out to me at:
- yiming8185@gmail.com, or

- https://www.linkedin.com/in/yiming-ji/
***
