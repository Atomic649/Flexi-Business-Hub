import { Request,Response } from "express"
import { Payment, PrismaClient, SocialMedia, Gender } from "@prisma/client"
import Joi from "joi"





// Create  instance of PrismaClient
const prisma = new PrismaClient()

//Interface for request body from client
interface billInput {
    cName: string
    cLastname: string
    cPhone: string
    cGender: Gender
    cAdress: string
    cPostId: string
    cProvince: string
    product: string
    payment: Payment
    amount: number    
    platform: SocialMedia
    cashStatus: boolean 
    price : number
    memberId: string
    purcheseAt: Date
    businessAcc : number
    imageBill : string
  

}
    

// Validate the request body
const schema = Joi.object({
    cName: Joi.string().required(),
    cLastname: Joi.string().required(),
    cPhone: Joi.string().min(10).max(10).required(),
    cGender: Joi.string().valid('Female', 'Male').required(),
    cAdress: Joi.string().required(),
    cPostId: Joi.string().required(),
    cProvince: Joi.string().required(),
    product: Joi.string().required(),
    payment: Joi.string().valid('COD', 'Transfer', 'CaditCard').required(),
    amount: Joi.number().required(),    
    platform: Joi.string().valid('Facebook','Tiktok','Shopee','Instagram','Youtube','Lazada','Line','X','Google'),
    cashStatus: Joi.boolean().required(),
    price : Joi.number().required(),
    memberId : Joi.string().required(),
    businessAcc : Joi.number().required(),
    imageBill : Joi.string()
    
   

})

//Create a New Bill - Post
const createBill = async (req: Request, res: Response) => {
    const billInput : billInput = req.body
    
    // If the request body is invalid, return error 400 Bad request
    const { error } = schema.validate(billInput)
    if(error) {
        return res.status(400).json({ message: error.details[0].message })
    }

    // Create a new bill
    try {
        const bill = await prisma.bill.create(
            {
                data: {                    
                    cName: billInput.cName,
                    cLastname: billInput.cLastname,
                    cPhone: billInput.cPhone,
                    cGender: billInput.cGender,
                    cAdress: billInput.cAdress,
                    cPostId: billInput.cPostId,
                    cProvince: billInput.cProvince,
                    product: billInput.product,
                    payment: billInput.payment,
                    amount: billInput.amount,                
                    platform: billInput.platform,
                    cashStatus: billInput.cashStatus,
                    price : billInput.price,
                    memberId : billInput.memberId,                    
                    businessAcc : billInput.businessAcc,
                    imageBill : billInput.imageBill

                    
                }
            }
        )
        
        res.json(bill)
    } catch (e) {
        console.error(e)    
        res.status(500).json({ message: "failed to create bill" })

}}
// Get All Bills - Get
const getBills = async (_: Request, res: Response) => {
   
    console.log("get bills");
    
    try {
        const bills = await prisma.bill.findMany()
        res.json(bills)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to get bills" })
    }
}

// Get a Bill by ID - Get
const getBillById = async (req: Request, res: Response) => {
    const { id } = req.params
    try {
        const bill = await prisma.bill.findUnique({
            where: {
                id: Number(id)
            }
        })
        res.json(bill)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to get bill" })
    }
}



// Update a Bill - Put
const updateBill = async (req: Request, res: Response) => {
    const { id } = req.params
    const billInput : billInput = req.body

    // validate the request body
    const schema = Joi.object({
        cName: Joi.string(),
        cLastname: Joi.string(),
        cPhone: Joi.string().min(10).max(10),
        cAdress: Joi.string(),
        cPostId: Joi.string(),
        cProvince: Joi.string(),
        product: Joi.string(),
        Amount: Joi.number(),        
        platform: Joi.string().valid(
            'Facebook','Tiktok','Shopee','Instagram','Youtube','Lazada','Line','X','Google'),
        cashStatus: Joi.boolean(), 
        price : Joi.number(),
        memberId: Joi.number(),
        purcheseAt: Joi.date()
    })

    // If the request body is invalid, return error 400 Bad request
    const { error } = schema.validate(billInput)
    if(error) {
        return res.status(400).json({ message: error.details[0].message })
    }
    try {
        const bill = await prisma.bill.update({
            where: {
                id: Number(id)
            },
            data: billInput
        })
        res.json(bill)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to update bill" })
    }
    
}

// Update a cash status by id - Put
const updateCashStatusById = async (req: Request, res: Response) => {
    const { id } = req.params
    const billInput : billInput = req.body

    // validate the request body
    const schema = Joi.object({
        cashStatus: Joi.boolean()
    })

    // If the request body is invalid, return error 400 Bad request
    const { error } = schema.validate(billInput)
    if(error) {
        return res.status(400).json({ message: error.details[0].message })
    }
    try {
        const bill = await prisma.bill.update({
            where: {
                id: Number(id)
            },
            data: {
                cashStatus: billInput.cashStatus
            }
        })
        res.json(bill)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to update bill" })
    }
}

// Delete a Bill - Delete
const deleteBill = async (req: Request, res: Response) => {
    const { id } = req.params
    try {
        const bill = await prisma.bill.delete({
            where: {
                id: Number(id)
            }
        })
        res.json(bill)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to delete bill" })
    }}
// Search Bill by keyword - Get
const searchBill = async (req: Request, res: Response) => {
    const { keyword } = req.params
    try {
        const bill = await prisma.bill.findMany({
            where: {
                OR: [
                    {
                        cName: {
                            contains: keyword
                        }
                    },
                    {
                        cLastname: {
                            contains: keyword
                        }
                    },
                    {
                        cPhone: {
                            contains: keyword
                        }
                    },                    
                    
                    {
                        cProvince: {
                            contains: keyword
                        }
                    },
                    {
                        product: {
                            contains: keyword
                        }
                    }                   
                    
                    
                    
                ]
            }
        })      
        res.json(bill)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to search bill" })
    }

}
export { createBill, getBills, getBillById, deleteBill, updateBill, searchBill,updateCashStatusById }