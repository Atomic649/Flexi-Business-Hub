/*
  Warnings:

  - Added the required column `businessAcc` to the `AdsCost` table without a default value. This is not possible if the table is not empty.
  - Added the required column `businessAcc` to the `Expence` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "AdsCost" ADD COLUMN     "businessAcc" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Expence" ADD COLUMN     "businessAcc" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "AdsCost" ADD CONSTRAINT "AdsCost_businessAcc_fkey" FOREIGN KEY ("businessAcc") REFERENCES "BusinessAcc"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Expence" ADD CONSTRAINT "Expence_businessAcc_fkey" FOREIGN KEY ("businessAcc") REFERENCES "BusinessAcc"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
