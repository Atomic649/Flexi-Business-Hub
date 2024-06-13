import express from "express"
import { createProduct, getProducts, getProductById, updateProduct, deleteProduct } from "../controllers/productController"

// create express router
const router = express.Router()

// Create product route
router.post('/', createProduct)

// Get all products
router.get('/', getProducts)

// Get product by ID
router.get('/:id', getProductById)

// Delete product
router.delete('/:id', deleteProduct)

// Update product
router.put('/:id', updateProduct)

export default router