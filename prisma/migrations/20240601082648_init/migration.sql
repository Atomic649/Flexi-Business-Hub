/*
  Warnings:

  - The primary key for the `AdsCost` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "AdsCost" DROP CONSTRAINT "AdsCost_pkey",
ADD CONSTRAINT "AdsCost_pkey" PRIMARY KEY ("platformId");
