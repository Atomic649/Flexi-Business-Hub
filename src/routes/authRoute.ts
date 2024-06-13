import express from "express"
import * as authController from "../controllers/authController"

// Create express router
const router = express.Router()
// Register
router.post('/register',authController.register)


// Login
router.post('/login', authController.login)

// Get Users
router.get('/users', authController.getUsers)

// Delete User
router.delete('/delete/:id', authController.deleteUser)

// Update User
router.put('/update/:id', authController.updateUser)

export default router
