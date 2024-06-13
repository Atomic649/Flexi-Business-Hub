/*
  Warnings:

  - The primary key for the `Product` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Bill" DROP CONSTRAINT "Bill_product_fkey";

-- DropIndex
DROP INDEX "Product_name_key";

-- AlterTable
ALTER TABLE "Product" DROP CONSTRAINT "Product_pkey",
ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("name");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_name_fkey" FOREIGN KEY ("name") REFERENCES "Bill"("product") ON DELETE RESTRICT ON UPDATE CASCADE;
