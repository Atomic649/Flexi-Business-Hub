import express, { Router } from 'express'
import authenticateToken from '../middleware/authMiddleware'
import * as billsController from '../controllers/billsController'

// Initialize router
const router: Router = express.Router()


// Get all bills
router.get('/', authenticateToken, billsController.getAllBills)


// //Get bills by id
router.get('/:billId', authenticateToken, billsController.getBillById)

// //Create bill
router.post('/', authenticateToken, billsController.createBill)

// //Update bill
router.put('/:billId', authenticateToken, billsController.updateBill)

// //Delete bill
router.delete('/:billId', authenticateToken, billsController.deleteBill)



export default router