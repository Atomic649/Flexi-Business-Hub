import express from "express"
import { getBusinessAccs, getBusinessAccById, createBusinessAcc, updateBusinessAcc, deleteBusinessAcc, searchBusinessAcc } from "../controllers/businessAccController"

// Create express router
const router = express.Router()

// Create route for creating a New Business Account - Post
router.post("/", createBusinessAcc)

// Create route for getting all Business Accounts - Get
router.get("/", getBusinessAccs)

// Create route for getting a Business Account by ID - Get
router.get("/:id", getBusinessAccById)

// Create route for updating a Business Account by ID - Put
router.put("/:id", updateBusinessAcc)

// Create route for deleting a Business Account by ID - Delete
router.delete("/:id", deleteBusinessAcc)

// Create route for searching Business Account by keyword - Get
router.get("/search/:keyword", searchBusinessAcc)



export default router