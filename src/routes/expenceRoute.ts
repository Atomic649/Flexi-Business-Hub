import express from "express"
import {  createExpence,getExpences, getExpenceById, updateExpenceById, deleteExpenceById, searchExpenceByDate } from "../controllers/expenceControllor"

// Create express router
const router = express.Router()

// Create route for creating a New Expence - Post
router.post("/", createExpence)

// Create route for getting all Expences - Get
router.get("/", getExpences )

// Create route for getting a Expence by ID - Get
router.get("/:id", getExpenceById )

// Create route for updating a Expence by ID - Put
router.put("/:id", updateExpenceById )

// Create route for deleting a Expence by ID - Delete
router.delete("/:id", deleteExpenceById )

// Create route for searching Expence by date - Get
router.get("/search/:date",searchExpenceByDate )



export default router