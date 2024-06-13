/*
  Warnings:

  - You are about to drop the column `adsCostID` on the `Member` table. All the data in the column will be lost.
  - You are about to drop the column `billsID` on the `Member` table. All the data in the column will be lost.
  - You are about to drop the column `businessMemberID` on the `Member` table. All the data in the column will be lost.
  - You are about to drop the column `expenceID` on the `Member` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Member" DROP COLUMN "adsCostID",
DROP COLUMN "billsID",
DROP COLUMN "businessMemberID",
DROP COLUMN "expenceID";
