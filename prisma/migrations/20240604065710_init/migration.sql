-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('Female', 'Male');

-- CreateEnum
CREATE TYPE "Payment" AS ENUM ('COD', 'Transfer', 'CaditCard');

-- AlterTable
ALTER TABLE "Bill" ADD COLUMN     "cGender" "Gender",
ADD COLUMN     "payment" "Payment";
