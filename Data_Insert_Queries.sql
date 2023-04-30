

-- Using the required Database:

use [Data Engineering]

ALTER TABLE response 
ALTER COLUMN response VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS;
ALTER TABLE staging_table 
ALTER COLUMN response VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS;
ALTER TABLE measure 
ALTER COLUMN measureIdChar VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS;
ALTER TABLE staging_table 
ALTER COLUMN measureId VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS;
ALTER TABLE age_group
ALTER COLUMN age VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS;
ALTER TABLE staging_table
ALTER COLUMN age VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS;

-- Data Load for Topic Table from Staging Table:

insert into Topic select distinct TopicType,TopicId,TopicDesc
from Staging_Table;


-- Data Load for Measure Table:

insert into Measure (measureIdChar,MeasureDesc,TopicId,response_id)
select distinct MeasureId,MeasureDesc,TopicId,r.response_id
From Staging_Table s
left join response r on s.response = r.response;

 -- Year Table Loading:
insert into Year
select distinct year
from Staging_Table;


-- Location Table Data Insert:

insert into Location
select distinct StateAbbr,States,Latitude,Longitude
from Staging_Table;

-- Data Insert for Response Table:

insert into Response(response)
select distinct response
from Staging_Table;

 -- Age Group:

insert into Age_Group
select distinct age
from Staging_Table;


-- Data Table Insert:

insert into data
select distinct indexnum,StateAbbr,year,measuredesc,r.response_id,data_value,standard_error,Low_Confidence,High_Confidence,Sample_Size,Gender,a.ageId,StratificationID1,StratificationID2,StratificationID3,StratificationID4,SubMeasureID,DisplayOrder
from Staging_Table s
left join response r on s.Response = r.Response
left join Age_Group a on s.Age = a.Age
order by indexnum;



-- Checking Data for all the tables:

select * from Topic;

select * from Measure;

select * from year;

select * from Location;

select * from Age_Group;

select * from data;

select * from Response;





