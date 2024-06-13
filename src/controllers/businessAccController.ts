import { Request, Response } from "express";
import { PrismaClient, taxType } from "@prisma/client";
import Joi from "joi";

// Create  instance of PrismaClient
const prisma = new PrismaClient();

// Interface for request body from client
interface businessAccInput {
  businessName: string;
  vatId: string;
  businessType: string;
  taxType: taxType;
  userId: number;
  memberId: string;

}

// validate the request body
const schema = Joi.object({
  businessName: Joi.string().required(),
  vatId: Joi.string().min(13).max(13).required(),
  businessType: Joi.string().required(),
  taxType: Joi.string().valid("Juristic", "Individual").required(),
  userId: Joi.number().required(),
  memberId: Joi.string().required(),
});

// Create a Business Account - Post
const createBusinessAcc = async (req: Request, res: Response) => {
  const businessAccInput: businessAccInput = req.body;

  // Validate the request body
  const { error } = schema.validate(businessAccInput);
  if (error) {
    return res.status(400).json({ message: error.details[0].message });
  }
  try {
    const businessAcc = await prisma.businessAcc.create({
      data: {
        businessName: businessAccInput.businessName,
        vatId: businessAccInput.vatId,
        businessType: businessAccInput.businessType,
        taxType: businessAccInput.taxType,
        userId: businessAccInput.userId,
        memberId: businessAccInput.memberId,
      },
    });
    res.json(businessAcc);
  } catch (e) {
    console.error(e);
    res.status(500).json({ message: "failed to create business account" });
  }
};

// Get All Business Accounts - Get
const getBusinessAccs = async (_: Request, res: Response) => {
  console.log("get business accounts");

  try {
    const businessAccs = await prisma.businessAcc.findMany();
    res.json(businessAccs);
  } catch (e) {
    console.error(e);
    res.status(500).json({ message: "failed to get business accounts" });
  }
};
// Get a Business Account by ID - Get
const getBusinessAccById = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const businessAcc = await prisma.businessAcc.findUnique({
      where: {
        id: Number(id),
      },
    });
    res.json(businessAcc);
  } catch (e) {
    console.error(e);
    res.status(500).json({ message: "failed to get business account" });
  }
};

// Update a Business Account by ID - Put
const updateBusinessAcc = async (req: Request, res: Response) => {
  const { id } = req.params;
  const businessAccInput: businessAccInput = req.body;
  try {
    const businessAcc = await prisma.businessAcc.update({
      where: {
        id: Number(id),
      },
      data: businessAccInput,
    });
    res.json(businessAcc);
  } catch (e) {
    console.error(e);
    res.status(500).json({ message: "failed to update business account" });
  }
};

// Delete a Business Account by ID - Delete
const deleteBusinessAcc = async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    const businessAcc = await prisma.businessAcc.delete({
      where: {
        id: Number(id),
      },
    });
    res.json(businessAcc);
  } catch (e) {
    console.error(e);
    res.status(500).json({ message: "failed to delete business account" });
  }
};
// Search for a Business Account by keyword - Get
const searchBusinessAcc = async (req: Request, res: Response) => {
  const { keyword } = req.params;
  try {
    const businessAcc = await prisma.businessAcc.findMany({
      where: {
        OR: [
          {
            memberId: {
              contains: keyword,
            },
          },
          {
            businessName: {
              contains: keyword,
            },
          },
          {
            vatId: {
              contains: keyword,
            },
          },
          {
            businessType: {
              contains: keyword,
            },
          },
          
        ],
      },
    });
    res.json(businessAcc);
  } catch (e) {
    console.error(e);
    res.status(500).json({ message: "failed to search business account" });
  }
};



// Export the functions
export {
  createBusinessAcc,
  getBusinessAccs,
  getBusinessAccById,
  updateBusinessAcc,
  deleteBusinessAcc,
  searchBusinessAcc,
 
};
