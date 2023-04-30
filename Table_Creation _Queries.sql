
use [Data Engineering]
-- Creating the Tables 

-- Topic Table:

CREATE TABLE Topic (
TopicType NVARCHAR(50),
TopicId NVARCHAR(20),
TopicDesc NVARCHAR(50),
PRIMARY KEY (TopicId)
);

-- Measure Table:
CREATE TABLE Measure (
measureId int identity (1,1),
MeasureIdChar nvarchar(20),
MeasureDesc NVARCHAR(50),
TopicId NVARCHAR(20),
Response_id int,
PRIMARY KEY ( MeasureId),
FOREIGN KEY (TopicId) REFERENCES Topic(TopicId),
foreign key (response_id) references response(response_id)
);


-- Year Table:

CREATE TABLE Year (
YEAR date Primary Key,
);

-- Age Group Table:
CREATE TABLE Age_Group(
AgeId int identity(1,1),
Age nvarchar(20),
PRIMARY KEY (AgeID)
);

-- Location Table:

CREATE TABLE Location (
StateAbbr char(10),
States nvarchar(50),
Latitude float not null,
Longitude float not null,
PRIMARY KEY (StateAbbr)
);

-- Response Table:
Create Table Response(
Response_Id int Not null Primary key identity(1,1),
Response nvarchar(20) not null);

-- Data Table :
create Table Data(
indexno int not null primary key default 0,
locationabbr char(10),
yeartodate date,
Measuredesc nvarchar(50),
response_id int,
Data_Value float,
Standard_Error	float,
Low_Confidence	float,
High_Confidence	float,
Sample_Size	 int,
Gender	varchar (10),
ageId int,
StratificationID1 nchar(10),
StratificationID2 nchar(10),
StratificationID3 nchar(10),
StratificationID4 nchar(10),
SubMeasureID nchar(10),
DisplayOrder int,
constraint [fk_data_response] foreign key(response_id) references response(response_id),
constraint [fk_data_age_group] foreign key (ageId) references age_group(ageId),
constraint [fk_data_year] foreign key (yeartodate) references year(year),
constraint [fk_data_location] foreign key (locationabbr) references location(stateAbbr));


 