-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/aR1ZJn9FXE-d0RAoHs5i1Q
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Company" (
    "CompanyID" string(6)  NOT NULL ,
    "CompanyName" string(50)  NOT NULL ,
    "EntityID" int  NOT NULL ,
    CONSTRAINT "pk_Company" PRIMARY KEY (
        "CompanyID"
    )
)

GO

CREATE TABLE "Customer" (
    "CompanyID" string(6)  NOT NULL ,
    "CustomerID" string(20)  NOT NULL ,
    "PrimaryEntityID" int  NOT NULL ,
    "OwnerNumber" string(20)  NOT NULL ,
    "DateSetup" date  NOT NULL ,
    "SecondaryEntityIDs(mv)" int  NOT NULL ,
    CONSTRAINT "pk_Customer" PRIMARY KEY (
        "CompanyID","CustomerID"
    )
)

GO

CREATE TABLE "Entity" (
    "EntityID" int  NOT NULL ,
    "FirstName" string(30)  NOT NULL ,
    "MiddleName" string(20)  NOT NULL ,
    "LastName" string(50)  NOT NULL ,
    "TaxID" string(30)  NOT NULL ,
    "Setupdate" Date  NOT NULL ,
    "IsPerson" bit  NOT NULL ,
    "PrimaryAddressID" int  NOT NULL ,
    "PrimaryPhoneID" int  NOT NULL ,
    "PrimaryEmailAddressID" int  NOT NULL ,
    "CSSamid" string(15)  NOT NULL ,
    "DateofBirth" date  NOT NULL ,
    "ForeignFlag" bit  NOT NULL ,
    "DriverLicense" string(20)  NOT NULL ,
    "DriverLicenseStateID" string(6)  NOT NULL ,
    CONSTRAINT "pk_Entity" PRIMARY KEY (
        "EntityID"
    )
)

GO

CREATE TABLE "State" (
    "StateID" string(6)  NOT NULL ,
    "CountryID" int  NOT NULL ,
    "Description" int  NOT NULL ,
    CONSTRAINT "pk_State" PRIMARY KEY (
        "StateID"
    )
)

GO

CREATE TABLE "Address" (
    "AddressID" int  NOT NULL ,
    "EnitytID" int  NOT NULL ,
    "AddressTypeID" string(6)  NOT NULL ,
    "CountryID" string(6)  NOT NULL ,
    "Active" bit  NOT NULL ,
    "Address1" string(50)  NOT NULL ,
    "Address2" string(50)  NULL ,
    "Address3" string(50)  NULL ,
    "city" string(50)  NOT NULL ,
    "stateID" string(6)  NOT NULL ,
    "zip" string(12)  NOT NULL ,
    CONSTRAINT "pk_Address" PRIMARY KEY (
        "AddressID"
    )
)

GO

CREATE TABLE "Country" (
    "CountryID" string(6)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    "Shortdescription" string(6)  NOT NULL ,
    "CountryCode" string(6)  NOT NULL ,
    "ISOCode" string(3)  NOT NULL ,
    "CreditReportingCode" string(2)  NOT NULL ,
    "TaxIDDescripton" string(50)  NOT NULL ,
    "BankIDQualifier" string(3)  NOT NULL ,
    "currencyTypeID" string(6)  NOT NULL ,
    "Isdomestic" bit  NOT NULL ,
    "DefineStates" bit  NOT NULL ,
    "UsePostalCode" bit  NOT NULL ,
    CONSTRAINT "pk_Country" PRIMARY KEY (
        "CountryID"
    )
)

GO

CREATE TABLE "CurrencyType" (
    "CurrencyTypeID" string(6)  NOT NULL ,
    "Description" string(100)  NOT NULL ,
    "CurrencyCode" string(10)  NOT NULL ,
    "Currencysymbol" string(5)  NOT NULL ,
    "DecimalMultiplier" decimal(3,2)  NOT NULL ,
    "DecimalPlaces" int  NOT NULL ,
    CONSTRAINT "pk_CurrencyType" PRIMARY KEY (
        "CurrencyTypeID"
    )
)

GO

CREATE TABLE "Addresstype" (
    "AddressTypeID" string(6)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    CONSTRAINT "pk_Addresstype" PRIMARY KEY (
        "AddressTypeID"
    )
)

GO

CREATE TABLE "Phone" (
    "PhoneID" int  NOT NULL ,
    "EntityID" int  NOT NULL ,
    "PhoneTypeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "EffectiveDate" date  NOT NULL ,
    "IsBad" bit  NOT NULL ,
    "CountryID" string(6)  NOT NULL ,
    "AreaCode" string(5)  NOT NULL ,
    "PhoneNumber" string(10)  NOT NULL ,
    "Extension" string(10)  NOT NULL ,
    "IsExpressConsent" bit  NOT NULL ,
    CONSTRAINT "pk_Phone" PRIMARY KEY (
        "PhoneID"
    )
)

GO

CREATE TABLE "Phonetype" (
    "PhoneTypeID" string(6)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    CONSTRAINT "pk_Phonetype" PRIMARY KEY (
        "PhoneTypeID"
    )
)

GO

CREATE TABLE "EmailAddress" (
    "EmailAddressID" int  NOT NULL ,
    "EntityID" int  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "EmailAddress" string(50)  NOT NULL ,
    "IsBillingAddress" bit  NOT NULL ,
    "EmailAddresTypeID" string(6)  NOT NULL ,
    "IsBad" bit  NOT NULL ,
    "EffectiveDate" date  NOT NULL ,
    CONSTRAINT "pk_EmailAddress" PRIMARY KEY (
        "EmailAddressID"
    )
)

GO

CREATE TABLE "EmailAddressType" (
    "EmailAddressTypeID" string(6)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    CONSTRAINT "pk_EmailAddressType" PRIMARY KEY (
        "EmailAddressTypeID"
    )
)

GO

CREATE TABLE "Account" (
    "AccountID" string(15)  NOT NULL ,
    "CompanyIDCustomerID" string(26)  NOT NULL ,
    "AccountTypeID" string(6)  NOT NULL ,
    "PrimaryAccountCodeID" string(6)  NOT NULL ,
    "PortfolioID" int  NOT NULL ,
    "ContractDate" date  NOT NULL ,
    "DelinquencyHistory" string(max)  NOT NULL ,
    "LastPaymentAmount" money  NOT NULL ,
    "LastPaymentDate" date  NOT NULL ,
    "SetupDate" date  NOT NULL ,
    "CouponNumber" int  NOT NULL ,
    "AlternateAccountNumber" string(20)  NOT NULL ,
    "Desc1" string(6)  NOT NULL ,
    "Desc2" string(6)  NOT NULL ,
    "Desc3" string(6)  NOT NULL ,
    "ConversionAccountID" string(30)  NOT NULL ,
    "SecurityQuestionsAnswered" bit  NOT NULL ,
    "LegalName" string(1000)  NOT NULL ,
    CONSTRAINT "pk_Account" PRIMARY KEY (
        "AccountID"
    )
)

GO

CREATE TABLE "AccountType" (
    "AccountTypeID" string(6)  NOT NULL ,
    "Description" string(50)  NOT NULL ,
    CONSTRAINT "pk_AccountType" PRIMARY KEY (
        "AccountTypeID"
    )
)

GO

CREATE TABLE "AccountAccountCode" (
    "AccountAccountCodeID" int  NOT NULL ,
    "AccountID" string(15)  NOT NULL ,
    "Date" date  NOT NULL ,
    "AccountCodeID" string(6)  NOT NULL ,
    "BeginDate" date  NOT NULL ,
    "Enddate" date  NOT NULL ,
    CONSTRAINT "pk_AccountAccountCode" PRIMARY KEY (
        "AccountAccountCodeID"
    )
)

GO

CREATE TABLE "AccountAccountCodeIndex" (
    "AccountID" string(15)  NOT NULL ,
    CONSTRAINT "pk_AccountAccountCodeIndex" PRIMARY KEY (
        "AccountID"
    )
)

GO

CREATE TABLE "AccountCode" (
    "AccountCodeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "IsActive" bit  NOT NULL ,
    CONSTRAINT "pk_AccountCode" PRIMARY KEY (
        "AccountCodeID"
    )
)

GO

CREATE TABLE "Invoice" (
    "InvoiceID" int  NOT NULL ,
    "AccountID" string(15)  NOT NULL ,
    "InterestTypeID" int  NOT NULL ,
    "InvoiceBillingtypeID" string(6)  NOT NULL ,
    "SetupDate" date  NOT NULL ,
    "FirstpaymentDate" date  NOT NULL ,
    "NextPaymentDate" date  NOT NULL ,
    "BalloonDate" date  NOT NULL ,
    "InterestPaidThruDate" date  NOT NULL ,
    "InterestRemainder" money  NOT NULL ,
    "MaturityDate" date  NOT NULL ,
    "OriginalBalance" money  NOT NULL ,
    "OriginalTerm" int  NOT NULL ,
    "OriginalMaturityDate" Date  NOT NULL ,
    "PaymentsMade" int  NOT NULL ,
    "PaymentsRemaining" int  NOT NULL ,
    "OriginalPaymentAmount" money  NOT NULL ,
    "OriginalAutopayAmount" money  NOT NULL ,
    "CSS_ID" string(20)  NOT NULL ,
    "PromotionalInterestExpirationDate" date  NOT NULL ,
    "DueDayOfMonth" int  NOT NULL ,
    CONSTRAINT "pk_Invoice" PRIMARY KEY (
        "InvoiceID"
    )
)

GO

CREATE TABLE "InvoiceAccountIndex" (
    "AccountID" string(15)  NOT NULL ,
    CONSTRAINT "pk_InvoiceAccountIndex" PRIMARY KEY (
        "AccountID"
    )
)

GO

CREATE TABLE "InvoiceBillingType" (
    "CompanyID" string(6)  NOT NULL ,
    "InvoiceBillingTypeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "IsPlacementFee" bit  NOT NULL ,
    "Allowplacement" bit  NOT NULL ,
    "BillingYear" int  NOT NULL ,
    "BillingDate" date  NOT NULL ,
    CONSTRAINT "pk_InvoiceBillingType" PRIMARY KEY (
        "CompanyID","InvoiceBillingTypeID"
    )
)

GO

CREATE TABLE "Frequency" (
    "FrequencyID" string(4)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "Months" int  NOT NULL ,
    "Weeks" int  NOT NULL ,
    "Days" int  NOT NULL ,
    "InvervalsPerYear" decimal(5,2)  NOT NULL )

GO

CREATE TABLE "InterestType" (
    "InterestTypeID" int  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "IPDFollowsDueDate" bit  NOT NULL ,
    "DaysPerYear" int  NOT NULL ,
    "DayInMonth" int  NOT NULL ,
    CONSTRAINT "pk_InterestType" PRIMARY KEY (
        "InterestTypeID"
    )
)

GO

CREATE TABLE "InvoiceDetail" (
    "InvoiceDetailID" int  NOT NULL ,
    "InvoiceID" int  NOT NULL ,
    "Date" date  NOT NULL ,
    "PaymentAmount" money  NOT NULL ,
    "InterestRate" decimal(5,4)  NOT NULL ,
    "FrequencyID" string(4)  NOT NULL ,
    CONSTRAINT "pk_InvoiceDetail" PRIMARY KEY (
        "InvoiceDetailID"
    )
)

GO

CREATE TABLE "InvoiceDetailInvoiceIndex" (
    "InvoiceID" int  NOT NULL ,
    CONSTRAINT "pk_InvoiceDetailInvoiceIndex" PRIMARY KEY (
        "InvoiceID"
    )
)

GO

ALTER TABLE "Company" ADD CONSTRAINT "fk_Company_EntityID" FOREIGN KEY("EntityID")
REFERENCES "Entity" ("EntityID")
GO

ALTER TABLE "Customer" ADD CONSTRAINT "fk_Customer_CompanyID" FOREIGN KEY("CompanyID")
REFERENCES "Company" ("CompanyID")
GO

ALTER TABLE "Customer" ADD CONSTRAINT "fk_Customer_PrimaryEntityID" FOREIGN KEY("PrimaryEntityID")
REFERENCES "Entity" ("EntityID")
GO

ALTER TABLE "Entity" ADD CONSTRAINT "fk_Entity_PrimaryAddressID" FOREIGN KEY("PrimaryAddressID")
REFERENCES "Address" ("AddressID")
GO

ALTER TABLE "Entity" ADD CONSTRAINT "fk_Entity_PrimaryPhoneID" FOREIGN KEY("PrimaryPhoneID")
REFERENCES "Phone" ("PhoneID")
GO

ALTER TABLE "Entity" ADD CONSTRAINT "fk_Entity_PrimaryEmailAddressID" FOREIGN KEY("PrimaryEmailAddressID")
REFERENCES "EmailAddress" ("EmailAddressID")
GO

ALTER TABLE "Entity" ADD CONSTRAINT "fk_Entity_DriverLicenseStateID" FOREIGN KEY("DriverLicenseStateID")
REFERENCES "State" ("StateID")
GO

ALTER TABLE "State" ADD CONSTRAINT "fk_State_CountryID" FOREIGN KEY("CountryID")
REFERENCES "Country" ("CountryID")
GO

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_EnitytID" FOREIGN KEY("EnitytID")
REFERENCES "Entity" ("EntityID")
GO

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_AddressTypeID" FOREIGN KEY("AddressTypeID")
REFERENCES "Addresstype" ("AddressTypeID")
GO

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_CountryID" FOREIGN KEY("CountryID")
REFERENCES "Country" ("CountryID")
GO

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_stateID" FOREIGN KEY("stateID")
REFERENCES "State" ("StateID")
GO

ALTER TABLE "Country" ADD CONSTRAINT "fk_Country_currencyTypeID" FOREIGN KEY("currencyTypeID")
REFERENCES "CurrencyType" ("CurrencyTypeID")
GO

ALTER TABLE "Phone" ADD CONSTRAINT "fk_Phone_EntityID" FOREIGN KEY("EntityID")
REFERENCES "Entity" ("EntityID")
GO

ALTER TABLE "Phone" ADD CONSTRAINT "fk_Phone_PhoneTypeID" FOREIGN KEY("PhoneTypeID")
REFERENCES "Phonetype" ("PhoneTypeID")
GO

ALTER TABLE "Phone" ADD CONSTRAINT "fk_Phone_CountryID" FOREIGN KEY("CountryID")
REFERENCES "Country" ("CountryID")
GO

ALTER TABLE "EmailAddress" ADD CONSTRAINT "fk_EmailAddress_EntityID" FOREIGN KEY("EntityID")
REFERENCES "Entity" ("EntityID")
GO

ALTER TABLE "EmailAddress" ADD CONSTRAINT "fk_EmailAddress_EmailAddresTypeID" FOREIGN KEY("EmailAddresTypeID")
REFERENCES "EmailAddressType" ("EmailAddressTypeID")
GO

ALTER TABLE "Account" ADD CONSTRAINT "fk_Account_CompanyIDCustomerID" FOREIGN KEY("CompanyIDCustomerID")
REFERENCES "Customer" ("CustomerID")
GO

ALTER TABLE "Account" ADD CONSTRAINT "fk_Account_AccountTypeID" FOREIGN KEY("AccountTypeID")
REFERENCES "AccountType" ("AccountTypeID")
GO

ALTER TABLE "Account" ADD CONSTRAINT "fk_Account_PrimaryAccountCodeID" FOREIGN KEY("PrimaryAccountCodeID")
REFERENCES "AccountCode" ("AccountCodeID")
GO

ALTER TABLE "AccountAccountCode" ADD CONSTRAINT "fk_AccountAccountCode_AccountID" FOREIGN KEY("AccountID")
REFERENCES "Account" ("AccountID")
GO

ALTER TABLE "AccountAccountCode" ADD CONSTRAINT "fk_AccountAccountCode_AccountCodeID" FOREIGN KEY("AccountCodeID")
REFERENCES "AccountCode" ("AccountCodeID")
GO

ALTER TABLE "AccountAccountCodeIndex" ADD CONSTRAINT "fk_AccountAccountCodeIndex_AccountID" FOREIGN KEY("AccountID")
REFERENCES "Account" ("AccountID")
GO

ALTER TABLE "Invoice" ADD CONSTRAINT "fk_Invoice_AccountID" FOREIGN KEY("AccountID")
REFERENCES "Account" ("AccountID")
GO

ALTER TABLE "Invoice" ADD CONSTRAINT "fk_Invoice_InterestTypeID" FOREIGN KEY("InterestTypeID")
REFERENCES "InterestType" ("InterestTypeID")
GO

ALTER TABLE "Invoice" ADD CONSTRAINT "fk_Invoice_InvoiceBillingtypeID" FOREIGN KEY("InvoiceBillingtypeID")
REFERENCES "InvoiceBillingType" ("InvoiceBillingTypeID")
GO

ALTER TABLE "InvoiceAccountIndex" ADD CONSTRAINT "fk_InvoiceAccountIndex_AccountID" FOREIGN KEY("AccountID")
REFERENCES "Account" ("AccountID")
GO

ALTER TABLE "InvoiceDetail" ADD CONSTRAINT "fk_InvoiceDetail_InvoiceID" FOREIGN KEY("InvoiceID")
REFERENCES "Invoice" ("InvoiceID")
GO

ALTER TABLE "InvoiceDetail" ADD CONSTRAINT "fk_InvoiceDetail_FrequencyID" FOREIGN KEY("FrequencyID")
REFERENCES "Frequency" ("FrequencyID")
GO

ALTER TABLE "InvoiceDetailInvoiceIndex" ADD CONSTRAINT "fk_InvoiceDetailInvoiceIndex_InvoiceID" FOREIGN KEY("InvoiceID")
REFERENCES "Invoice" ("InvoiceID")
GO

