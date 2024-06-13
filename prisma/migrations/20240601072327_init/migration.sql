/*
  Warnings:

  - Added the required column `platformId` to the `AdsCost` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Platform" DROP CONSTRAINT "Platform_id_fkey";

-- AlterTable
ALTER TABLE "AdsCost" ADD COLUMN     "platformId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "AdsCost" ADD CONSTRAINT "AdsCost_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
