import express from "express"
import{ getPlatforms, getPlatformById, createPlatform, updatePlatform, deletePlatform, searchPlatform } from "../controllers/platformControllor"

// Create express router
const router = express.Router()

// Create route for creating a New Platform - Post
router.post("/", createPlatform)

// Create route for getting all Platforms - Get
router.get("/", getPlatforms)

// Create route for getting a Platform by ID - Get
router.get("/:id", getPlatformById)

// Create route for deleting a Platform by ID - Delete
router.delete("/:id", deletePlatform)

// Create route for updating a Platform by ID - Put
router.put("/:id", updatePlatform)

// Create route for searching Platform by keyword - Get
router.get("/search/:keyword", searchPlatform)

export default router