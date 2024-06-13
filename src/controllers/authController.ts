import jwt from "jsonwebtoken"
import bcrypt from "bcrypt"
import { Request, Response } from "express"
import { PrismaClient } from "@prisma/client"
import Joi from "joi"


// Ensure this file is also converted to TypeScript

// Define types for the user inputs
interface UserInput {
    email: string
    password: string
    firstName: string
    lastName: string
    avatar: string
    phone: string
}

// Register function by prisma and bcrypt and validation by joi
// Compare the password with the hashed password in the database
// Generate JWT token for the registered user

const connection = new PrismaClient()

const register = async (req: Request, res: Response) => {
  const userInput: UserInput = req.body
  const schema = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().required(),
    firstName: Joi.string().required(),
    lastName: Joi.string().required(),
    avatar: Joi.string().required(),
    phone: Joi.string().required().min(10).max(10),
  })
  const { error } = schema.validate(userInput)
  if (error) {
    return res.status(400).json({ message: error.details[0].message })
  }
  try {
    const salt = await bcrypt.genSalt(10)
    const hashedPassword = await bcrypt.hash(userInput.password, salt)
    const user = await connection.user.create({
      data: {
        email: userInput.email,
        password: hashedPassword,
        firstName: userInput.firstName,
        lastName: userInput.lastName,
        avatar: userInput.avatar,
        phone: userInput.phone,
      },
    })
    // Generate JWT token
    const token = jwt.sign({ id: user.id }, "secret")
    res.json({ token })
  } catch (e) {
    console.error(e)
    res.status(500).json({ message: "failed to register" })
  }
}


  

// Login function by prisma

const login = async (req: Request, res: Response) => {
  const userInput: UserInput = req.body
  const schema = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().required(),
  })
  const { error } = schema.validate(userInput)
  if (error) {
    return res.status(400).json({ message: error.details[0].message })
  }
  try {
    const user = await connection.user.findUnique({
      where: {
        email: userInput.email,
      },
    })
    if (!user) {
      return res.status(401).json({ message: "invalid credentials" })
    }
    const valid = await bcrypt.compare(userInput.password, user.password)
    if (!valid) {
      return res.status(401).json({ message: "Email and password does not match" })
    }
    const token = jwt.sign(
      { id: user.id }, "secret")

      
    res.json({ 
      status:"ok",
      message: "login successful",
      token: token,
    user: {
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
      phone: user.phone,
    }})



  } catch (e) {
    console.error(e)
    res.status(500).json({ message: "failed to login" })
  }
}

// get all users
const getUsers = async (_: Request, res: Response) => { 
    try {
        const users = await connection.user.findMany()
        res.json(users)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to get users" })
    }
}

// Delete  a user by id
const deleteUser = async (req: Request, res: Response) => {
    const { id } = req.params
    try {
        const user = await connection.user.delete({
            where: {
                id: Number(id)
            }
        })
        res.json(user)
    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to delete user" })
    }
}

// Update user by id by prisma validation by joi and bcrypt and jwt
const updateUser = async (req: Request, res: Response) => {
    const { id } = req.params
    const userInput: UserInput = req.body
    const schema = Joi.object({
        email: Joi.string().email().required(),
        password: Joi.string().required(),
        firstName: Joi.string().required(),
        lastName: Joi.string().required(),
        avatar: Joi.string().required(),
        phone: Joi.string().required().min(10).max(10),
    })
    const { error } = schema.validate(userInput)
    if (error) {
        return res.status(400).json({ message: error.details[0].message })
    }
    try {
        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(userInput.password, salt)
        const user = await connection.user.update({
            where: {
                id: Number(id)
            },
            data: {
                email: userInput.email,
                password: hashedPassword,
                firstName: userInput.firstName,
                lastName: userInput.lastName,
                avatar: userInput.avatar,
                phone: userInput.phone,
            }
        })
        res.json(user)
        // Generate JWT token
        const token = jwt.sign({ id: user.id }, "secret")
    res.json({ token })

    } catch (e) {
        console.error(e)
        res.status(500).json({ message: "failed to update user" })
    }
}



export { register, login , getUsers, deleteUser, updateUser}