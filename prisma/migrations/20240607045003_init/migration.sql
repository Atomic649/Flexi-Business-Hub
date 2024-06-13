/*
  Warnings:

  - Changed the type of `platform` on the `Bill` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "SocialMedia" AS ENUM ('Facebook', 'Line', 'Tiktok', 'Shopee', 'Lazada');

-- AlterTable
ALTER TABLE "Bill" DROP COLUMN "platform",
ADD COLUMN     "platform" "SocialMedia" NOT NULL;
