CREATE TABLE "Company" ( 
    "CompanyID" text,
    "CompanyName" text,
    "EntityID" int,
    PRIMARY KEY ("CompanyID"));


CREATE TABLE "Customer" ( 
    "CompanyID" text,
    "CustomerID" text,
    "PrimaryEntityID" int,
    "OwnerNumber" text,
    "DateSetup" date,
    "SecondaryEntityIDs_mv" list<int>,
    PRIMARY KEY ("CompanyID"));


CREATE TABLE "Entity" ( 
    "EntityID" int,
    "FirstName" text,
    "MiddleName" text,
    "LastName" text,
    "TaxID" text,
    "Setupdate" date,
    "IsPerson" boolean,
    "PrimaryAddressID" int,
    "PrimaryPhoneID" int,
    "PrimaryEmailAddressID" int,
    "CSSamid" text,
    "DateofBirth" date,
    "ForeignFlag" boolean,
    "DriverLicense" text,
    "DriverLicenseStateID" text,
    PRIMARY KEY ("EntityID"));


CREATE TABLE "State" ( 
    "StateID" text,
    "CountryID" int,
    "Description" int,
    PRIMARY KEY ("StateID"));


CREATE TABLE "Address" ( 
    "AddressID" int,
    "EnitytID" int,
    "AddressTypeID" text,
    "CountryID" text,
    "Active" boolean,
    "Address1" text,
    "Address2" text,
    "Address3" text,
    "city" text,
    "stateID" text,
    "zip" text,
    PRIMARY KEY ("AddressID"));


CREATE TABLE "Country" ( 
    "CountryID" text,
    "Description" text,
    "Shortdescription" text,
    "CountryCode" text,
    "ISOCode" text,
    "CreditReportingCode" text,
    "TaxIDDescripton" text,
    "BankIDQualifier" text,
    "currencyTypeID" text,
    "Isdomestic" boolean,
    "DefineStates" boolean,
    "UsePostalCode" boolean,
    PRIMARY KEY ("CountryID"));


CREATE TABLE "CurrencyType" ( 
    "CurrencyTypeID" text,
    "Description" text,
    "CurrencyCode" text,
    "Currencysymbol" text,
    "DecimalMultiplier" decimal,
    "DecimalPlaces" int,
    PRIMARY KEY ("CurrencyTypeID"));


CREATE TABLE "Addresstype" ( 
    "AddressTypeID" text,
    "Description" text,
    PRIMARY KEY ("AddressTypeID"));


CREATE TABLE "Phone" ( 
    "PhoneID" int,
    "EntityID" int,
    "PhoneTypeID" text,
    "Description" text,
    "EffectiveDate" date,
    "IsBad" boolean,
    "CountryID" text,
    "AreaCode" text,
    "PhoneNumber" text,
    "Extension" text,
    "IsExpressConsent" boolean,
    PRIMARY KEY ("PhoneID"));


CREATE TABLE "Phonetype" ( 
    "PhoneTypeID" text,
    "Description" text,
    PRIMARY KEY ("PhoneTypeID"));


CREATE TABLE "EmailAddress" ( 
    "EmailAddressID" int,
    "EntityID" int,
    "Description" text,
    "EmailAddress" text,
    "IsBillingAddress" boolean,
    "EmailAddresTypeID" text,
    "IsBad" boolean,
    "EffectiveDate" date,
    PRIMARY KEY ("EmailAddressID"));


CREATE TABLE "EmailAddressType" ( 
    "EmailAddressTypeID" text,
    "Description" text,
    PRIMARY KEY ("EmailAddressTypeID"));


CREATE TABLE "Account" ( 
    "AccountID" text,
    "CompanyIDCustomerID" text,
    "AccountTypeID" text,
    "PrimaryAccountCodeID" text,
    "PortfolioID" int,
    "ContractDate" date,
    "DelinquencyHistory" text,
    "LastPaymentAmount" decimal,
    "LastPaymentDate" date,
    "SetupDate" date,
    "CouponNumber" int,
    "AlternateAccountNumber" text,
    "Desc1" text,
    "Desc2" text,
    "Desc3" text,
    "ConversionAccountID" text,
    "SecurityQuestionsAnswered" boolean,
    "LegalName" text,
    PRIMARY KEY ("AccountID"));


CREATE TABLE "AccountType" ( 
    "AccountTypeID" text,
    "Description" text,
    PRIMARY KEY ("AccountTypeID"));


CREATE TABLE "AccountAccountCode" ( 
    "AccountAccountCodeID" int,
    "AccountID" text,
    "Date" date,
    "AccountCodeID" text,
    "BeginDate" date,
    "Enddate" date,
    PRIMARY KEY ("AccountAccountCodeID"));


CREATE TABLE "AccountAccountCodeIndex" ( 
    "AccountID" text,
    PRIMARY KEY ("AccountID"));


CREATE TABLE "AccountCode" ( 
    "AccountCodeID" text,
    "Description" text,
    "IsActive" boolean,
    PRIMARY KEY ("AccountCodeID"));


CREATE TABLE "Invoice" ( 
    "InvoiceID" int,
    "AccountID" text,
    "InterestTypeID" int,
    "InvoiceBillingtypeID" text,
    "SetupDate" date,
    "FirstpaymentDate" date,
    "NextPaymentDate" date,
    "BalloonDate" date,
    "InterestPaidThruDate" date,
    "InterestRemainder" decimal,
    "MaturityDate" date,
    "OriginalBalance" decimal,
    "OriginalTerm" int,
    "OriginalMaturityDate" date,
    "PaymentsMade" int,
    "PaymentsRemaining" int,
    "OriginalPaymentAmount" decimal,
    "OriginalAutopayAmount" decimal,
    "CSS_ID" text,
    "PromotionalInterestExpirationDate" date,
    "DueDayOfMonth" int,
    PRIMARY KEY ("InvoiceID"));


CREATE TABLE "InvoiceAccountIndex" ( 
    "AccountID" text,
    PRIMARY KEY ("AccountID"));


CREATE TABLE "InvoiceBillingType" ( 
    "CompanyID" text,
    "InvoiceBillingTypeID" text,
    "Description" text,
    "IsPlacementFee" boolean,
    "Allowplacement" boolean,
    "BillingYear" int,
    "BillingDate" date,
    PRIMARY KEY ("CompanyID"));


CREATE TABLE "Frequency" ( 
    "FrequencyID" text,
    "Description" text,
    "Months" int,
    "Weeks" int,
    "Days" int,
    "InvervalsPerYear" decimal,
    PRIMARY KEY ("FrequencyID"));


CREATE TABLE "InterestType" ( 
    "InterestTypeID" int,
    "Description" text,
    "IPDFollowsDueDate" boolean,
    "DaysPerYear" int,
    "DayInMonth" int,
    PRIMARY KEY ("InterestTypeID"));


CREATE TABLE "InvoiceDetail" ( 
    "InvoiceDetailID" int,
    "InvoiceID" int,
    "Date" date,
    "PaymentAmount" decimal,
    "InterestRate" decimal,
    "FrequencyID" text,
    PRIMARY KEY ("InvoiceDetailID"));


CREATE TABLE "InvoiceDetailInvoiceIndex" ( 
    "InvoiceID" int,
    PRIMARY KEY ("InvoiceID"));


