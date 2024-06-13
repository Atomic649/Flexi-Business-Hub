import express from "express"
import { getBills, getBillById,createBill , updateBill, deleteBill, searchBill,updateCashStatusById} from "../controllers/billController"


// Create express router
const router = express.Router()
 

router.post("/",createBill)

// Create route for getting all Bills - Get
router.get("/", getBills)

// Create route for getting a Bill by ID - Get
router.get("/:id", getBillById)

// Create route for updating a Bill by ID - Put
router.put("/:id", updateBill)

// Create route for deleting a Bill by ID - Delete
router.delete("/:id", deleteBill)

// Create route for searching Bill by keyword - Get
router.get("/search/:keyword", searchBill)

// Create route for updating Cash Status by ID - Put
router.put("/cash/:id", updateCashStatusById)

export default router