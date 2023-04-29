const express = require("express");
const mongoose = require("mongoose");
const app = express();
const Customer_data = require("./schema/add_customer");


app.use(express.json());

app.use(
    express.urlencoded({
        extended: true,
    })
);

mongoose.connect("mongodb://127.0.0.1:27017/plushpoint",{
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() =>{
    console.log("Connected Successfully"),

    // post api
    app.post("/api/add_customer", async(req, res) =>{
        console.log("Result", req.body);

        let data = Customer_data(req.body);
        try {
            let customerStore = await data.save();
            res.status(200).json(customerStore);
        } catch (error) {
            res.status(400).json({
                'status': error.message
            })
        }
    });
})
.catch((err) =>{
    console.error(err);
});


app.listen(2000,()=>{
    console.log("on port 2000");
})