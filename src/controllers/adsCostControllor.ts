import { Request,Response } from "express"
import { PrismaClient } from "@prisma/client"
import Joi  from "joi"


// Create  instance of PrismaClient
const prisma = new PrismaClient()


// Interface for request body from client
interface adsCostInput {
    date : Date
    memberId: string    
    adsCost: number
    platformId: number
    businessAcc: number
}

//  validate the request body
const schema = Joi.object({
    
    memberId: Joi.string().required(),    
    adsCost: Joi.number().required(),
    platformId: Joi.number().required(),
    businessAcc: Joi.number().required()
})

//  Create a new ads cost - Post
const createAdsCost = async (req: Request, res: Response) => {
    const adsCostInput: adsCostInput = req.body
    

    // Validate the request body
    const { error } = schema.validate(adsCostInput)
    
    if(error) {
        return res.status(400).json({ message: error.details[0].message })
    }
    try {
        const adsCost = await prisma.adsCost.create({
            data: {                                
                adsCost: adsCostInput.adsCost,
                memberId : adsCostInput.memberId,
                platformId : adsCostInput.platformId,
                businessAcc : adsCostInput.businessAcc
            }
        })
        res.json(adsCost)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to create ads cost" })
    }
}


// Get all ads costs - Get
const getAdsCosts = async (_: Request, res: Response) => {

    try {
        const adsCosts = await prisma.adsCost.findMany()
        res.json(adsCosts)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to get ads costs" })
    }
}

//--- Get a ads cost by platformId - Get
const getAdsCostById = async (req: Request, res: Response) => {
    const { id } = req.params
    try {
        const adsCost = await prisma.adsCost.findUnique({
            where: {
                id: Number(id)
            }
        })
        res.json(adsCost)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to get ads cost" })
    }
}

//----Search a ads cost by date - Get
const SearchAdsCostByDate = async (req: Request, res: Response) => {
    const { date } = req.params
    try {
        const adsCost = await prisma.adsCost.findMany({
            where: {
                date: date
            }
        })
        res.json(adsCost)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to get ads cost" })
    }
}

// Update a date by id - Put
const updateAdsDateById = async (req: Request, res: Response) => {
    const { id } = req.params
    const adsCostInput: adsCostInput = req.body
    try {
        const adsCost = await prisma.adsCost.update({
            where: {
                id: Number(id)
            },
            data: {
                date: adsCostInput.date
            }
        })
        res.json(adsCost)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to update ads cost" })
    }
}
//--- Update a ads cost by platformId - Put
const updateAdsCost = async (req: Request, res: Response) => {
    const { id} = req.params
    const adsCostInput: adsCostInput = req.body
    try {
        const adsCost = await prisma.adsCost.update({
            where: {
                id: Number(id)
            },
            data: {
                adsCost: adsCostInput.adsCost
            }
        })
        res.json(adsCost)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to update ads cost" })
    }
}

// Delete a ads cost by platformId - Delete
const deleteAdsCost = async (req: Request, res: Response) => {
    const { id } = req.params
    try {
        const adsCost = await prisma.adsCost.delete({
            where: {
                id: Number(id)
            }
        })
        res.json(adsCost)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to delete ads cost" })
    }
}
export {
    createAdsCost,
    getAdsCosts,
    getAdsCostById,
    SearchAdsCostByDate,
    updateAdsCost,
    deleteAdsCost,
    updateAdsDateById

}