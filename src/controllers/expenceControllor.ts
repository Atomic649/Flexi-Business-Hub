import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import Joi from "joi";

//Create  instance of PrismaClient
const prisma = new PrismaClient();

// Interface for request body from client
interface userInput {
    date: Date
    amount: number
    group : string
    image : string
    memberId : string
    businessAcc : number
}

// Validate the request body
const schema = Joi.object({
    date: Joi.date().required(),
    amount: Joi.number().required(),
    group : Joi.string().required(),
    image : Joi.string().required(),
    memberId : Joi.string().required(),
    businessAcc : Joi.number().required()
})

//  create a new expence - Post
const createExpence = async (req: Request, res: Response) => {
    const expenceInput: userInput = req.body
    console.log(expenceInput)

    // validate the request body
    const { error } = schema.validate(expenceInput)
    
    if(error) {
        return res.status(400).json({ message: error.details[0].message })
    }
    try {
        const expence = await prisma.expence.create({
            data: {
                date: expenceInput.date,
                amount: expenceInput.amount,
                group : expenceInput.group,
                image : expenceInput.image,
                memberId : expenceInput.memberId,
                businessAcc : expenceInput.businessAcc

                
            }
        })
        res.json(expence)
    } catch (e) {
        console.error(e)
}}

// Get All Expences - Get
const getExpences = async (_: Request, res: Response) => {
    try {
        const expences = await prisma.expence.findMany();
        res.json(expences);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to get expences" });
    }
}

// Get a Expence by ID - Get
const getExpenceById = async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const expence = await prisma.expence.findUnique({
            where: {
                id: Number(id),
            },
        });
        res.json(expence);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to get expence" });
    }
}

// Update a Expence by ID - Put
const updateExpenceById = async (req: Request, res: Response) => {
    const { id } = req.params;
    const expenceInput: userInput = req.body
    try {
        const expence = await prisma.expence.update({
            where: {
                id: Number(id),
            },
            data: {
                date: expenceInput.date,
                amount: expenceInput.amount,
                group : expenceInput.group,
                image : expenceInput.image,
                memberId : expenceInput.memberId
            },
        });
        res.json(expence);
    } catch (e) {
        console.error(e);

}}

// Delete a Expence by ID - Delete
const deleteExpenceById = async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const expence = await prisma.expence.delete({
            where: {
                id: Number(id),
            },
        });
        res.json(expence);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to delete expence" });
    }
}

// serch Expence by date - Get
const searchExpenceByDate = async (req: Request, res: Response) => {
    const { date } = req.params;
    try {
        const expence = await prisma.expence.findMany({
            where: {
                date: date,
            },
        });
        res.json(expence);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to search expence" });
    }
}


export{createExpence, getExpences, getExpenceById, updateExpenceById, deleteExpenceById, searchExpenceByDate}