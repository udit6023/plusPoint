const Vendor = require("../schema/add_vendor");

const addVendor = async(req,res) =>{
    try {
       const vender = new Vendor({
            vnum:req.body.vnum,
            vname:req.body.vname,
            vImage:req.file.filename
        });

        const vender_data = await vender.save();
        res.status(200).send({success:true,data:vender_data});

    } catch (error) {
        res.status(400).send(error.message);  
    }
}

module.exports = {
    addVendor
}