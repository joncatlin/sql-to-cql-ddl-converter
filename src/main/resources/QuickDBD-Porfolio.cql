CREATE TABLE "PortfolioLevel" ( 
    "CompanyID" text,
    "Level" int,
    "Description" text,
    "ValueRequired" boolean,
    PRIMARY KEY ("CompanyID"));


CREATE TABLE "Portfolio" ( 
    "PortfolioID" int,
    "CompanyID" text,
    "Level1" text,
    "Level2" text,
    "Level3" text,
    "Level4" text,
    "Level5" text,
    "Level6" text,
    "Level7" text,
    "Level8" text,
    PRIMARY KEY ("PortfolioID"));


CREATE TABLE "PortfolioLevelValue" ( 
    "CompanyID" text,
    "Level" int,
    "PortfolioLevelValue" text,
    "Description" text,
    PRIMARY KEY ("CompanyID"));


CREATE TABLE "PortfolioFlag" ( 
    "PortfolioFlagID" text,
    "PortfolioID" int,
    "AccountID" text,
    "PortfolioFlagMasterID" text,
    "Value" text,
    "BeginDate" date,
    "EndDate" date,
    PRIMARY KEY ("PortfolioFlagID"));


CREATE TABLE "PortfolioFlagMaster" ( 
    "PortfolioFlagMasterID" text,
    "Description" text,
    "DataType" text,
    "ValidValues" text,
    "MultiValued" boolean,
    "RangeMin" int,
    "RangeMax" int,
    "Required" boolean,
    "ValidationFile" text,
    "ControlType" text,
    "DescriptionField" int,
    "DefaultValue" text,
    "ValidationProgram" text,
    "ExtendedDescription" text,
    "ValidationSelect" text,
    "ValidValueDescriptions" text,
    "SelectionProgram" text,
    PRIMARY KEY ("PortfolioFlagMasterID"));


CREATE TABLE "PortfolioFlagLog" ( 
    "PortfolioFlagLogID" int,
    "PortfolioFlagID" text,
    "Date" date,
    "Time" time,
    "OldValue" text,
    "NewValue" text,
    "OldBeginDate" date,
    "NewBeginDate" date,
    "OldEndDate" date,
    "NewEnddate" date,
    "Who" text,
    PRIMARY KEY ("PortfolioFlagLogID"));


