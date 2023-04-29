const mongoose = require("mongoose");

let dataSchema = new mongoose.Schema({
    'cnum':{
        required: true,
        type: String
    },
    'cname':{
        required:true,
        type : String
    }
});

module.exports = mongoose.model("customer", dataSchema);