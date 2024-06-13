import express from "express"
import bodyParser from 'body-parser'
import cors from 'cors'
import dotenv from 'dotenv'

// Initialize dotenv
dotenv.config()


// Create a new express application instance
const app = express()

// Express middleware
app.use(express.json())

// Parse incoming JSON requests
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

// Use Cors
app.use(cors())

// Use Static Files
app.use('/uploads', express.static('uploads'))
app.use('/uploads/images', express.static('uploads/images'))

// --------------IMPORT ROUTES-----------------

// Import User Routes
import authRoutes from "./src/routes/authRoute"

// Import Bill Routes
import billRoutes from "./src/routes/billRoute"

// Import Member Routes
import memberRoutes from "./src/routes/memberRoute"

// Import Business Account Routes
import businessAccRoutes from "./src/routes/businessAccRoute"

// Import Ads Cost Routes
import adsCostRoutes from "./src/routes/adsCostRoute"

// Import platform Routes
import platformRoutes from "./src/routes/platformRoute"

// Import Expence Routes
import expenceRoutes from "./src/routes/expenceRoute"

// Import Product Routes
import productRoutes from "./src/routes/productRoute"


// --------------USE ROUTES-----------------

// User Routes
app.use('/auth', authRoutes)

// Bill Routes
app.use("/bill", billRoutes)

// Member Routes
app.use("/member", memberRoutes)

// Business Account Routes
app.use("/businessAcc", businessAccRoutes)

// Ads Cost Routes
app.use("/ads", adsCostRoutes)

// platform Routes
app.use("/platform", platformRoutes)

// Expence Routes
app.use("/expence", expenceRoutes)

// Product Routes
app.use("/product", productRoutes)



//---------- Start the server ----------------
const port = process.env.PORT || 3000
app.listen(port, () => console.log(`Server started on port ${port}`))