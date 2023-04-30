const mongoose = require("mongoose");

let addVendorSchema = new mongoose.Schema({
    vnum:{
        required: true,
        type: String
    },
    vname:{
        required:true,
        type : String
    },
    vImage:{
        required:true,
        type : String
    }
});

module.exports = mongoose.model("vendor", addVendorSchema);