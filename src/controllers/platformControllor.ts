import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import Joi from "joi";

// Create  instance of PrismaClient
const prisma = new PrismaClient()


// Interface for request body from client
interface platformInput {
    platform: string
    accName: string
    accId: string
    
}

//  validate the request body
const schema = Joi.object({
    platform: Joi.string().required(),
    accName: Joi.string().required(),
    accId: Joi.string().required()
})

//  Create a New platform - Post
const createPlatform = async (req: Request, res: Response) => {
    const platformInput: platformInput = req.body;
    console.log(platformInput);

    // Validate the request body
    const { error } = schema.validate(platformInput);
    if (error) {
        return res.status(400).json({ message: error.details[0].message });
    }
    try {
        const platform = await prisma.platform.create({
            data: {
                platform: platformInput.platform,
                accName: platformInput.accName,
                accId: platformInput.accId
            },
        });
        res.json(platform);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to create platform" });
    }
}

//  get all platforms - Get
const getPlatforms = async (_: Request, res: Response) => {
    try {
        const platforms = await prisma.platform.findMany();
        res.json(platforms);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to get platforms" });
    }
}
// Get a platform by ID - Get
const getPlatformById = async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const platform = await prisma.platform.findUnique({
            where: {
                id: Number(id),
            },
        });
        res.json(platform);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to get platform" });
    }
}

// Delete a platform - Delete
const deletePlatform = async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const platform = await prisma.platform.delete({
            where: {
                id: Number(id),
            },
        });
        res.json(platform);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to delete platform" });
    }
}

// Update a platform - Put
const updatePlatform = async (req: Request, res: Response) => {
    const { id } = req.params;
    const platformInput: platformInput = req.body;
    try {
        const platform = await prisma.platform.update({
            where: {
                id: Number(id),
            },
            data: {
                platform: platformInput.platform,
                accName: platformInput.accName,
                accId: platformInput.accId
            },
        });
        res.json(platform);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to update platform" });
    }
}

// Search platforms - Get
const searchPlatform = async (req: Request, res: Response) => {
    const { search } = req.params;
    try {
        const platforms = await prisma.platform.findMany({
            where: {
                platform: {
                    contains: search,
                },
            },
        });
        res.json(platforms);
    } catch (e) {
        console.error(e);
        res.status(500).json({ message: "failed to search platforms" });
    }
}

export {
    createPlatform,
    getPlatforms,
    getPlatformById,
    deletePlatform,
    updatePlatform,
    searchPlatform,
}