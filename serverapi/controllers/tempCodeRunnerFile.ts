function sumTotalBill(req: Request, res: Response) {
    try {
        connection.execute(
            "SELECT SUM(price) AS total FROM bills",
            function (err, results) {
                if (err) {
                    res.json({ status: "error", message: err })
                    return
                } else {
                    res.json(results)
                }
            }
        )
    } catch (err) {
        console.error("Error storing bill in the database: ", err);
        res.sendStatus(500);
    }
}
