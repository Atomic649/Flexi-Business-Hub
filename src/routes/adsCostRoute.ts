import express from "express"
import { getAdsCosts, getAdsCostById, createAdsCost, updateAdsCost, deleteAdsCost, SearchAdsCostByDate,updateAdsDateById } from "../controllers/adsCostControllor"

// Create express router
const router = express.Router()

// Create route for creating a New Ads Cost - Post
router.post("/", createAdsCost)

// Create route for getting all Ads Costs - Get
router.get("/", getAdsCosts)

// Create route for getting a Ads Cost by ID - Get
router.get("/:id", getAdsCostById)

// Create route for updating a Ads Cost by ID - Put
router.put("/:id", updateAdsCost)

// Create route for updating Date by ID - Put
router.put("/date/:id", updateAdsDateById)

// Create route for deleting a Ads Cost by ID - Delete
router.delete("/:id", deleteAdsCost)

// Create route for searching Ads Cost by date - Get
router.get("/search/:date", SearchAdsCostByDate)




export default router