import connection from "../utils/db";
import { Request, Response } from "express"
import multer from "multer"
import multerConfig from "../utils/multer_config"





const upload = multer(multerConfig.config).single(multerConfig.keyUpload)

//----------------------------------------
// Get all bills
//----------------------------------------
function getAllBills(req: Request, res: Response) {    
    try {
        connection.execute(
            "SELECT * FROM bills ORDER BY bill_id DESC",
            function (err, results) {
                if (err) {
                    res.json({ status: "error", message: err });
                    return;
                } else {
                    res.json(results)
                }
            }
        );
    } catch (err) {
        console.error("Error storing bills in the database: ", err);
        res.sendStatus(500);
    }
}
//----------------------------------------
// Get bills by id
//----------------------------------------
function getBillById(req: Request, res: Response) {
    try {
        connection.execute(
            "SELECT * FROM bills WHERE bill_id = ?",
            [req.params.billId],
            function (err, results) {
                if (err) {
                    res.json({ status: "error", message: err });
                    return;
                } else {
                    res.json(results);
                }
            }
        );
    } catch (err) {
        console.error("Error storing bills in the database: ", err);
        res.sendStatus(500);
    }
}
//----------------------------------------
// Create bill
//----------------------------------------
function createBill(req: Request, res: Response) {
    upload(req, res, async (err) => {
        if (err instanceof multer.MulterError) {
            console.log(`error: ${JSON.stringify(err)}`)
            return res.status(500).json({ message: err })
        } else if (err) {
            console.log(`error: ${JSON.stringify(err)}`)
            return res.status(500).json({ message: err })
        } else {
            // console.log(`file: ${JSON.stringify(req.file)}`)
            // console.log(`body: ${JSON.stringify(req.body)}`)
            try {
                const {
                    customer_name,
                    customer_phone,
                    customer_gender,
                    promotion,
                    buy_amount,
                    price,
                    adress,
                    provence,
                    post_id,   
                    payment, 
                    logistic_status, 
                    cash_in_date,
                    platform, 
                    sales_id, 
                    purchase_at,                    
                } = req.body
                const image_bill = req.file ? req.file.filename : null
                console.log(req.file)
                connection.execute("INSERT INTO bills (customer_name, image_bill, customer_phone, customer_gender, promotion, buy_amount, price, adress, provence, post_id, payment, logistic_status, cash_in_date, platform, sales_id, purchase_at) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [
                    customer_name,
                    image_bill,
                    customer_phone,
                    customer_gender,
                    promotion,
                    buy_amount,
                    price,
                    adress,
                    provence,
                    post_id,                    
                    payment, 
                    logistic_status, 
                    cash_in_date,
                    platform, 
                    sales_id, 
                    purchase_at,                   
                ],
                function (err, results : any) {
                    if (err) {
                        res.json({ status: "error", message: err });
                        return;
                    } else {
                        res.json({
                            status: "ok",
                            message: "Bill created successfully",
                            bill: {
                                bill_id: results.insertId,
                                customer_name : customer_name,
                                image_bill : image_bill,
                                customer_phone : customer_phone,
                                customer_gender : customer_gender,
                                promotion : promotion,
                                buy_amount : buy_amount,
                                price : price,
                                adress : adress,
                                provence : provence,
                                post_id : post_id,   
                                payment : payment,
                                logistic_status : logistic_status, 
                                cash_in_date : cash_in_date,
                                platform : platform,
                                sales_id : sales_id, 
                                purchase_at:purchase_at,                               
                            },
                        })
                    }
                }
            )
            } catch (err) {
                console.error("Error storing bills in the database: ", err);
                res.sendStatus(500);
            }
        }
    })
}
//----------------------------------------
// Update bill
//----------------------------------------

function updateBill(req: Request, res: Response) {
    upload(req, res, async (err) => {
        if (err instanceof multer.MulterError) {
            console.log(`error: ${JSON.stringify(err)}`)
            return res.status(500).json({ message: err })
        } else if (err) {
            console.log(`error: ${JSON.stringify(err)}`)
            return res.status(500).json({ message: err })
        } else {
            console.log(`file: ${JSON.stringify(req.file)}`)
            console.log(`body: ${JSON.stringify(req.body)}`)
            try {
                const {
                    customer_name,
                    customer_phone,
                    customer_gender,
                    promotion,
                    buy_amount,
                    price,
                    adress,
                    provence,
                    post_id,   
                    payment, 
                    logistic_status, 
                    cash_in_date,
                    platform, 
                    sales_id, 
                    purchase_at,                    
                } = req.body
                const image_bill = req.file ? req.file.filename : null
                console.log(req.file)

                let sql = 
                "UPDATE bills SET customer_name = ?, customer_phone = ?, customer_gender =? , promotion = ?, buy_amount = ?, price = ?, adress = ?, provence = ?, post_id =?, payment = ?, logistic_status = ?, cash_in_date = ?, platform = ?, sales_id  = ?, purchase_at = ? WHERE bill_id = ?"
                let params = [
                    customer_name,                    
                    customer_phone,
                    customer_gender,
                    promotion,
                    buy_amount,
                    price,
                    adress,
                    provence,
                    post_id,                    
                    payment, 
                    logistic_status, 
                    cash_in_date,
                    platform, 
                    sales_id, 
                    purchase_at, 
                    req.params.billId,                    
                ]
                if (image_bill) {
                    sql =
                    "UPDATE bills SET customer_name = ?, image_bill = ?, customer_phone = ?, customer_gender =? , promotion =?, buy_amount = ?, price = ?, adress = ?, provence = ?, post_id =?, payment = ?, logistic_status = ?, cash_in_date = ?, platform = ?, sales_id  = ?, purchase_at = ? WHERE bill_id = ?"
                    params = [
                        customer_name,
                        image_bill,
                        customer_phone,
                        customer_gender,
                        promotion,
                        buy_amount,
                        price,
                        adress,
                        provence,
                        post_id,                    
                        payment, 
                        logistic_status, 
                        cash_in_date,
                        platform, 
                        sales_id, 
                        purchase_at, 
                        req.params.billId, 
                        
                    ]
                }

                connection.execute(sql,params,function (err) {
                    if (err) {
                        res.json({ status: "error", message: err })
                        return
                    } else {
                        res.json({
                            status: "ok",
                            message: "Bill updated successfully",
                            product: {
                                bills_id:  req.params.billId, 
                                customer_name : customer_name,
                                image_bill : image_bill,
                                customer_phone : customer_phone,
                                customer_gender : customer_gender,
                                promotion : promotion,
                                buy_amount : buy_amount,
                                price : price,
                                adress : adress,
                                provence : provence,
                                post_id : post_id,   
                                payment : payment,
                                logistic_status : logistic_status, 
                                cash_in_date : cash_in_date,
                                platform : platform,
                                sales_id : sales_id, 
                                purchase_at:purchase_at,
                            },
                        }) 
                     }
                })
            } catch (err) {
                console.error("Error storing bills in the database: ", err);
                res.sendStatus(500);
            }
        }
    })
}
//----------------------------------------
// delete bill
//----------------------------------------
function deleteBill(req: Request, res: Response) {
    try {
        connection.execute(
            "DELETE FROM bills WHERE bill_id = ?",
            [req.params.billId],
            function (err) {
                if (err) {
                    res.json({ status: "error", message: err })
                    return
                } else {
                    res.json({
                        status: "ok",
                        message: "Bill deleted successfully",
                        bill: {
                            id: req.params.billId,
                        },
                    })
                }
            }
        )
        // Delite file from server
        const fs = require("fs")
        const path = require("path")
        const filePath = path.join(
            __dirname,
            "../public/uploads/",
            req.params.billId
        )
    } catch (err) {
        console.error("Error storing bill in the database: ", err);
        res.sendStatus(500);
    }
}





export {
    getAllBills,
    getBillById,
    createBill,
    updateBill,
    deleteBill,

    
}
    