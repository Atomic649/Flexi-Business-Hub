/*
  Warnings:

  - You are about to drop the `products` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[product]` on the table `Bill` will be added. If there are existing duplicate values, this will fail.

*/
-- DropTable
DROP TABLE "products";

-- CreateTable
CREATE TABLE "Product" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "barcode" TEXT NOT NULL,
    "image" TEXT,
    "stock" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Bill_product_key" ON "Bill"("product");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_name_fkey" FOREIGN KEY ("name") REFERENCES "Bill"("product") ON DELETE RESTRICT ON UPDATE CASCADE;
