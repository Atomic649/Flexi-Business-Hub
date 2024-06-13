import express from "express"
import { getMembers, getMemberById, deleteMember, updateMember, searchMember } from "../controllers/memberController"
import { createMember } from "../controllers/memberController"

// Create express router
const router = express.Router()

//Create route for creating a New Member - Post
router.post("/", createMember)

// Create route for getting all Members - Get
router.get("/", getMembers)

// Create route for getting a Member by ID - Get
router.get("/:uniqueId", getMemberById)

// Create route for deleting a Member by ID - Delete
router.delete("/:uniqueId", deleteMember)

// Create route for updating a Member by ID - Put
router.put("/:uniqueId", updateMember)

// Create route for searching Member by keyword - Get
router.get("/search/:keyword", searchMember)


export default router