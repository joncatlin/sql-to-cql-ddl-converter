CREATE TABLE "Balance" ( 
    "InvoiceID" int,
    "BalanceTypeID" text,
    "Date" date,
    "Balance" decimal,
    PRIMARY KEY ("InvoiceID"));


CREATE TABLE "BalanceType" ( 
    "CompanyID" text,
    "BalanceTypeID" text,
    "Description" text,
    "ISNormallyPositive" boolean,
    "AllowOppositeSignBalance" boolean,
    "BalanceCategoryID" text,
    PRIMARY KEY ("CompanyID"));


CREATE TABLE "BalanceCategory" ( 
    "BalanceCategoryID" text,
    "Description" text,
    PRIMARY KEY ("BalanceCategoryID"));


CREATE TABLE "Transactions" ( 
    "TransactionID" int,
    "BatchNumber" int,
    "InvoiceID" int,
    "Date" date,
    "TransactionTypeID" text,
    "PortfolioID" int,
    "BalanceTypeID_mv" list<text>,
    "Amount_mv" list<decimal>,
    "BalanceTypeIDAfter_mv" list<text>,
    "BalanceAfter_mv" list<decimal>,
    "NPDPrior" date,
    "IPDPrior" date,
    "IPDAfter" date,
    "NumberOfPayments" int,
    "SourceFile" text,
    "SourceFileID" text,
    "Who" text,
    "CheckNumber" text,
    "NSFTransactionID" int,
    "Remarks" text,
    "ChangeCodeID" text,
    "ChangeFrom" text,
    "ChangeTo" text,
    "AsOfDate" date,
    "PostDateTime" timestamp,
    "DepositBankAccountID" int,
    "ApplyBankAccountID" int,
    "AverageDailyBalance" decimal,
    "AccountCodeID" text,
    "CancelReasonID" int,
    "PromotionalInterest" decimal,
    "CurrencyExchangeTableID" text,
    "CurrencyTypeID" text,
    "CurrencyAmount" decimal,
    "ExchangeRate" decimal,
    PRIMARY KEY ("TransactionID"));


CREATE TABLE "Bank" ( 
    "BankID" int,
    "EntityID" int,
    "BankName" text,
    "BranchName" text,
    "AllowDirectDebit" boolean,
    PRIMARY KEY ("BankID"));


CREATE TABLE "BankAccount" ( 
    "BankaccountID" int,
    "BankID" int,
    "AccountNumber" text,
    "BankAccountTypeID" text,
    "PrimaryEntityID" int,
    "PrenoteDate" date,
    "CurrencyTypeID" text,
    PRIMARY KEY ("BankaccountID"));


CREATE TABLE "BankAccountType" ( 
    "BankAccountTypeID" text,
    "Description" text,
    "DebitCode" int,
    "Creditcode" int,
    "PrenoteCode" int,
    PRIMARY KEY ("BankAccountTypeID"));


CREATE TABLE "ChangeCode" ( 
    "ChangeCodeID" text,
    "Description" text,
    "DataType" text,
    PRIMARY KEY ("ChangeCodeID"));


CREATE TABLE "TransactionType" ( 
    "TransactionTypeID" text,
    "Description" text,
    "IsCash" boolean,
    "IsChange" boolean,
    PRIMARY KEY ("TransactionTypeID"));


CREATE TABLE "Autopay" ( 
    "AutopayID" int,
    "AccountID" text,
    "AutopayType" int,
    "BankAccountID" int,
    "CreditCardID" int,
    "Amount" decimal,
    "BeginDate" date,
    "EndDate" date,
    "FrequencyID" text,
    "MaxDrafts" int,
    "DraftsTaken" int,
    "NextAutopayDate" date,
    "Active" boolean,
    PRIMARY KEY ("AutopayID"));


CREATE TABLE "AutopayType" ( 
    "AutopayTypeID" text,
    "Description" text,
    "TransactionTypeID" text,
    PRIMARY KEY ("AutopayTypeID"));


CREATE TABLE "CreditCard" ( 
    "CreditCardID" int,
    "Token" text,
    "Expiration" text,
    "EntityID" int,
    PRIMARY KEY ("CreditCardID"));


