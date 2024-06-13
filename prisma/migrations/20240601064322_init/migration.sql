-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('owner', 'marketing', 'acccountance', 'sales');

-- CreateEnum
CREATE TYPE "taxType" AS ENUM ('Juristic', 'Individual');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "avatar" TEXT,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "phone" TEXT NOT NULL,
    "businessId" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Member" (
    "uniqueId" TEXT NOT NULL,
    "role" "UserRole" NOT NULL DEFAULT 'owner',
    "permission" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "businessMemberID" INTEGER NOT NULL,
    "billsID" INTEGER NOT NULL,
    "adsCostID" INTEGER NOT NULL,
    "expenceID" INTEGER NOT NULL,

    CONSTRAINT "Member_pkey" PRIMARY KEY ("uniqueId")
);

-- CreateTable
CREATE TABLE "BusinessAcc" (
    "id" SERIAL NOT NULL,
    "businessName" TEXT NOT NULL,
    "vatId" TEXT NOT NULL,
    "businessType" TEXT NOT NULL,
    "taxType" "taxType" NOT NULL DEFAULT 'Individual',
    "userId" INTEGER NOT NULL,
    "memberId" TEXT NOT NULL,

    CONSTRAINT "BusinessAcc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bill" (
    "id" SERIAL NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "cName" TEXT NOT NULL,
    "cLastname" TEXT NOT NULL,
    "cPhone" TEXT NOT NULL,
    "cAdress" TEXT NOT NULL,
    "cProvince" TEXT NOT NULL,
    "cPostId" TEXT NOT NULL,
    "product" TEXT NOT NULL,
    "Amount" INTEGER NOT NULL,
    "purcheseAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "platform" TEXT NOT NULL,
    "cashStatus" BOOLEAN NOT NULL DEFAULT false,
    "price" INTEGER NOT NULL,
    "memberId" TEXT NOT NULL,

    CONSTRAINT "Bill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdsCost" (
    "date" TIMESTAMP(3) NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "adsId" INTEGER NOT NULL,
    "adsCost" INTEGER NOT NULL,
    "memberId" TEXT NOT NULL,

    CONSTRAINT "AdsCost_pkey" PRIMARY KEY ("adsId")
);

-- CreateTable
CREATE TABLE "Expence" (
    "date" TIMESTAMP(3) NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "id" SERIAL NOT NULL,
    "amount" INTEGER NOT NULL,
    "group" TEXT NOT NULL,
    "memberId" TEXT NOT NULL,

    CONSTRAINT "Expence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Platform" (
    "id" SERIAL NOT NULL,
    "platform" TEXT NOT NULL,
    "accName" TEXT NOT NULL,
    "accId" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Platform_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_email_key" ON "User"("phone", "email");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessAcc_businessName_key" ON "BusinessAcc"("businessName");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessAcc_vatId_key" ON "BusinessAcc"("vatId");

-- CreateIndex
CREATE UNIQUE INDEX "Platform_platform_key" ON "Platform"("platform");

-- CreateIndex
CREATE UNIQUE INDEX "Platform_accName_key" ON "Platform"("accName");

-- CreateIndex
CREATE UNIQUE INDEX "Platform_accId_key" ON "Platform"("accId");

-- AddForeignKey
ALTER TABLE "BusinessAcc" ADD CONSTRAINT "BusinessAcc_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessAcc" ADD CONSTRAINT "BusinessAcc_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Member"("uniqueId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bill" ADD CONSTRAINT "Bill_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Member"("uniqueId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdsCost" ADD CONSTRAINT "AdsCost_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Member"("uniqueId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Expence" ADD CONSTRAINT "Expence_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Member"("uniqueId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Platform" ADD CONSTRAINT "Platform_id_fkey" FOREIGN KEY ("id") REFERENCES "AdsCost"("adsId") ON DELETE RESTRICT ON UPDATE CASCADE;
