-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/ncRoedNoLEmxwiNvo0gVgw
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Balance" (
    "InvoiceID" int  NOT NULL ,
    "BalanceTypeID" string(6)  NOT NULL ,
    "Date" date  NOT NULL ,
    "Balance" money  NOT NULL ,
    CONSTRAINT "pk_Balance" PRIMARY KEY (
        "InvoiceID","BalanceTypeID","Date"
    )
)

GO

CREATE TABLE "BalanceType" (
    "CompanyID" string(6)  NOT NULL ,
    "BalanceTypeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "ISNormallyPositive" bit  NOT NULL ,
    "AllowOppositeSignBalance" bit  NOT NULL ,
    "BalanceCategoryID" string(6)  NOT NULL ,
    CONSTRAINT "pk_BalanceType" PRIMARY KEY (
        "CompanyID","BalanceTypeID"
    )
)

GO

CREATE TABLE "BalanceCategory" (
    "BalanceCategoryID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    CONSTRAINT "pk_BalanceCategory" PRIMARY KEY (
        "BalanceCategoryID"
    )
)

GO

CREATE TABLE "Transactions" (
    "TransactionID" int  NOT NULL ,
    "BatchNumber" int  NOT NULL ,
    "InvoiceID" int  NOT NULL ,
    "Date" date  NOT NULL ,
    "TransactionTypeID" string(6)  NOT NULL ,
    "PortfolioID" int  NOT NULL ,
    "BalanceTypeID(mv)" string(6)  NOT NULL ,
    "Amount(mv)" money  NOT NULL ,
    "BalanceTypeIDAfter(mv)" string(6)  NOT NULL ,
    "BalanceAfter(mv)" money  NOT NULL ,
    "NPDPrior" date  NOT NULL ,
    "IPDPrior" date  NOT NULL ,
    "IPDAfter" date  NOT NULL ,
    "NumberOfPayments" int  NOT NULL ,
    "SourceFile" string(20)  NOT NULL ,
    "SourceFileID" string(10)  NOT NULL ,
    "Who" string(12)  NOT NULL ,
    "CheckNumber" string(12)  NOT NULL ,
    "NSFTransactionID" int  NOT NULL ,
    "Remarks" string(30)  NOT NULL ,
    "ChangeCodeID" string(6)  NOT NULL ,
    "ChangeFrom" string(20)  NOT NULL ,
    "ChangeTo" string(20)  NOT NULL ,
    "AsOfDate" date  NOT NULL ,
    "PostDateTime" datetime  NOT NULL ,
    "DepositBankAccountID" int  NOT NULL ,
    "ApplyBankAccountID" int  NOT NULL ,
    "AverageDailyBalance" money  NOT NULL ,
    "AccountCodeID" string(6)  NOT NULL ,
    "CancelReasonID" int  NOT NULL ,
    "PromotionalInterest" money  NOT NULL ,
    "CurrencyExchangeTableID" string(6)  NOT NULL ,
    "CurrencyTypeID" string(6)  NOT NULL ,
    "CurrencyAmount" money  NOT NULL ,
    "ExchangeRate" decimal(5,4)  NOT NULL ,
    CONSTRAINT "pk_Transactions" PRIMARY KEY (
        "TransactionID"
    )
)

GO

CREATE TABLE "Bank" (
    "BankID" int  NOT NULL ,
    "EntityID" int  NOT NULL ,
    "BankName" string(100)  NOT NULL ,
    "BranchName" string(100)  NOT NULL ,
    "AllowDirectDebit" bit  NOT NULL ,
    CONSTRAINT "pk_Bank" PRIMARY KEY (
        "BankID"
    )
)

GO

CREATE TABLE "BankAccount" (
    "BankaccountID" int  NOT NULL ,
    "BankID" int  NOT NULL ,
    "AccountNumber" string(30)  NOT NULL ,
    "BankAccountTypeID" string(6)  NOT NULL ,
    "PrimaryEntityID" int  NOT NULL ,
    "PrenoteDate" date  NOT NULL ,
    "CurrencyTypeID" string(6)  NOT NULL ,
    CONSTRAINT "pk_BankAccount" PRIMARY KEY (
        "BankaccountID"
    )
)

GO

CREATE TABLE "BankAccountType" (
    "BankAccountTypeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "DebitCode" int  NOT NULL ,
    "Creditcode" int  NOT NULL ,
    "PrenoteCode" int  NOT NULL ,
    CONSTRAINT "pk_BankAccountType" PRIMARY KEY (
        "BankAccountTypeID"
    )
)

GO

CREATE TABLE "ChangeCode" (
    "ChangeCodeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "DataType" string(6)  NOT NULL ,
    CONSTRAINT "pk_ChangeCode" PRIMARY KEY (
        "ChangeCodeID"
    )
)

GO

CREATE TABLE "TransactionType" (
    "TransactionTypeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "IsCash" bit  NOT NULL ,
    "IsChange" bit  NOT NULL ,
    CONSTRAINT "pk_TransactionType" PRIMARY KEY (
        "TransactionTypeID"
    )
)

GO

CREATE TABLE "Autopay" (
    "AutopayID" int  NOT NULL ,
    "AccountID" string(15)  NOT NULL ,
    "AutopayType" int  NOT NULL ,
    "BankAccountID" int  NOT NULL ,
    "CreditCardID" int  NOT NULL ,
    "Amount" money  NOT NULL ,
    "BeginDate" date  NOT NULL ,
    "EndDate" date  NOT NULL ,
    "FrequencyID" string(4)  NOT NULL ,
    "MaxDrafts" int  NOT NULL ,
    "DraftsTaken" int  NOT NULL ,
    "NextAutopayDate" date  NOT NULL ,
    "Active" bit  NOT NULL ,
    CONSTRAINT "pk_Autopay" PRIMARY KEY (
        "AutopayID"
    )
)

GO

CREATE TABLE "AutopayType" (
    "AutopayTypeID" string(6)  NOT NULL ,
    "Description" string(30)  NOT NULL ,
    "TransactionTypeID" string(6)  NOT NULL ,
    CONSTRAINT "pk_AutopayType" PRIMARY KEY (
        "AutopayTypeID"
    )
)

GO

CREATE TABLE "CreditCard" (
    "CreditCardID" int  NOT NULL ,
    "Token" string(25)  NOT NULL ,
    "Expiration" string(6)  NOT NULL ,
    "EntityID" int  NOT NULL ,
    CONSTRAINT "pk_CreditCard" PRIMARY KEY (
        "CreditCardID"
    )
)

GO

ALTER TABLE "Balance" ADD CONSTRAINT "fk_Balance_BalanceTypeID" FOREIGN KEY("BalanceTypeID")
REFERENCES "BalanceType" ("BalanceTypeID")
GO

ALTER TABLE "BalanceType" ADD CONSTRAINT "fk_BalanceType_BalanceCategoryID" FOREIGN KEY("BalanceCategoryID")
REFERENCES "BalanceCategory" ("BalanceCategoryID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_TransactionTypeID" FOREIGN KEY("TransactionTypeID")
REFERENCES "TransactionType" ("TransactionTypeID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_BalanceTypeID(mv)" FOREIGN KEY("BalanceTypeID(mv)")
REFERENCES "BalanceType" ("BalanceTypeID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_BalanceTypeIDAfter(mv)" FOREIGN KEY("BalanceTypeIDAfter(mv)")
REFERENCES "BalanceType" ("BalanceTypeID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_NSFTransactionID" FOREIGN KEY("NSFTransactionID")
REFERENCES "Transactions" ("TransactionID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_ChangeCodeID" FOREIGN KEY("ChangeCodeID")
REFERENCES "ChangeCode" ("ChangeCodeID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_DepositBankAccountID" FOREIGN KEY("DepositBankAccountID")
REFERENCES "BankAccount" ("BankaccountID")
GO

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_ApplyBankAccountID" FOREIGN KEY("ApplyBankAccountID")
REFERENCES "BankAccount" ("BankaccountID")
GO

ALTER TABLE "BankAccount" ADD CONSTRAINT "fk_BankAccount_BankID" FOREIGN KEY("BankID")
REFERENCES "Bank" ("BankID")
GO

ALTER TABLE "BankAccount" ADD CONSTRAINT "fk_BankAccount_BankAccountTypeID" FOREIGN KEY("BankAccountTypeID")
REFERENCES "BankAccountType" ("BankAccountTypeID")
GO

ALTER TABLE "Autopay" ADD CONSTRAINT "fk_Autopay_AutopayType" FOREIGN KEY("AutopayType")
REFERENCES "AutopayType" ("AutopayTypeID")
GO

ALTER TABLE "Autopay" ADD CONSTRAINT "fk_Autopay_BankAccountID" FOREIGN KEY("BankAccountID")
REFERENCES "BankAccount" ("BankaccountID")
GO

ALTER TABLE "Autopay" ADD CONSTRAINT "fk_Autopay_CreditCardID" FOREIGN KEY("CreditCardID")
REFERENCES "CreditCard" ("CreditCardID")
GO

ALTER TABLE "AutopayType" ADD CONSTRAINT "fk_AutopayType_TransactionTypeID" FOREIGN KEY("TransactionTypeID")
REFERENCES "TransactionType" ("TransactionTypeID")
GO

