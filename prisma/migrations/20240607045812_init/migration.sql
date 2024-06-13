/*
  Warnings:

  - Made the column `cGender` on table `Bill` required. This step will fail if there are existing NULL values in that column.
  - Made the column `payment` on table `Bill` required. This step will fail if there are existing NULL values in that column.
  - Made the column `platform` on table `Bill` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Bill" ALTER COLUMN "cGender" SET NOT NULL,
ALTER COLUMN "payment" SET NOT NULL,
ALTER COLUMN "platform" SET NOT NULL;
