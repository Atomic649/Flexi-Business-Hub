/*
  Warnings:

  - You are about to drop the column `businessId` on the `User` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "User_phone_email_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "businessId";
