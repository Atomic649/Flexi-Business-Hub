/*
  Warnings:

  - Added the required column `image` to the `Expence` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Expence" ADD COLUMN     "image" TEXT NOT NULL;
