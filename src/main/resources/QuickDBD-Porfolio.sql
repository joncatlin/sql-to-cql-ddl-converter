-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/yJHns4VOTE-5bZc_KWpiXw
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "PortfolioLevel" (
    "CompanyID" string(6)  NOT NULL ,
    "Level" int(5)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "ValueRequired" bit  NOT NULL ,
    CONSTRAINT "pk_PortfolioLevel" PRIMARY KEY (
        "CompanyID","Level"
    )
)

GO

CREATE TABLE "Portfolio" (
    "PortfolioID" int(6)  NOT NULL ,
    "CompanyID" string(6)  NOT NULL ,
    "Level1" string(6)  NOT NULL ,
    "Level2" string(6)  NOT NULL ,
    "Level3" string(6)  NOT NULL ,
    "Level4" string(6)  NOT NULL ,
    "Level5" string(6)  NOT NULL ,
    "Level6" string(6)  NOT NULL ,
    "Level7" string(6)  NOT NULL ,
    "Level8" string(6)  NOT NULL ,
    CONSTRAINT "pk_Portfolio" PRIMARY KEY (
        "PortfolioID"
    )
)

GO

CREATE TABLE "PortfolioLevelValue" (
    "CompanyID" string(6)  NOT NULL ,
    "Level" int(5)  NOT NULL ,
    "PortfolioLevelValue" string(6)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    CONSTRAINT "pk_PortfolioLevelValue" PRIMARY KEY (
        "CompanyID","Level","PortfolioLevelValue"
    )
)

GO

CREATE TABLE "PortfolioFlag" (
    "PortfolioFlagID" string(20)  NOT NULL ,
    "PortfolioID" int(6)  NOT NULL ,
    "AccountID" string(15)  NOT NULL ,
    "PortfolioFlagMasterID" string(20)  NOT NULL ,
    "Value" string(100)  NOT NULL ,
    "BeginDate" date  NOT NULL ,
    "EndDate" date  NOT NULL ,
    CONSTRAINT "pk_PortfolioFlag" PRIMARY KEY (
        "PortfolioFlagID","PortfolioID","AccountID","PortfolioFlagMasterID"
    )
)

GO

CREATE TABLE "PortfolioFlagMaster" (
    "PortfolioFlagMasterID" string(20)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    "DataType" string(12)  NOT NULL ,
    "ValidValues" string(15)  NOT NULL ,
    "MultiValued" bit  NOT NULL ,
    "RangeMin" int(7)  NOT NULL ,
    "RangeMax" int(7)  NOT NULL ,
    "Required" bit  NOT NULL ,
    "ValidationFile" string(25)  NOT NULL ,
    "ControlType" string(15)  NOT NULL ,
    "DescriptionField" int(3)  NOT NULL ,
    "DefaultValue" string(15)  NOT NULL ,
    "ValidationProgram" string(50)  NOT NULL ,
    "ExtendedDescription" string(200)  NOT NULL ,
    "ValidationSelect" string(50)  NOT NULL ,
    "ValidValueDescriptions" string(50)  NOT NULL ,
    "SelectionProgram" string(50)  NOT NULL ,
    CONSTRAINT "pk_PortfolioFlagMaster" PRIMARY KEY (
        "PortfolioFlagMasterID"
    )
)

GO

CREATE TABLE "PortfolioFlagLog" (
    "PortfolioFlagLogID" int(12)  NOT NULL ,
    "PortfolioFlagID" string(20)  NOT NULL ,
    "Date" date  NOT NULL ,
    "Time" time  NOT NULL ,
    "OldValue" string(100)  NOT NULL ,
    "NewValue" string(100)  NOT NULL ,
    "OldBeginDate" date  NOT NULL ,
    "NewBeginDate" date  NOT NULL ,
    "OldEndDate" date  NOT NULL ,
    "NewEnddate" date  NOT NULL ,
    "Who" string(12)  NOT NULL ,
    CONSTRAINT "pk_PortfolioFlagLog" PRIMARY KEY (
        "PortfolioFlagLogID"
    )
)

GO

ALTER TABLE "PortfolioFlag" ADD CONSTRAINT "fk_PortfolioFlag_PortfolioID" FOREIGN KEY("PortfolioID")
REFERENCES "Portfolio" ("PortfolioID")
GO

ALTER TABLE "PortfolioFlag" ADD CONSTRAINT "fk_PortfolioFlag_PortfolioFlagMasterID" FOREIGN KEY("PortfolioFlagMasterID")
REFERENCES "PortfolioFlagMaster" ("PortfolioFlagMasterID")
GO

ALTER TABLE "PortfolioFlagLog" ADD CONSTRAINT "fk_PortfolioFlagLog_PortfolioFlagID" FOREIGN KEY("PortfolioFlagID")
REFERENCES "PortfolioFlag" ("PortfolioFlagID")
GO

