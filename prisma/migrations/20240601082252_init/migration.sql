/*
  Warnings:

  - The primary key for the `AdsCost` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `adsId` on the `AdsCost` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "AdsCost" DROP CONSTRAINT "AdsCost_pkey",
DROP COLUMN "adsId",
ADD CONSTRAINT "AdsCost_pkey" PRIMARY KEY ("date");
