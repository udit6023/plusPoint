const express = require("express");
const vendor_route = express();

const bodyParser = require("body-parser");

vendor_route.use(bodyParser.json());
vendor_route.use(bodyParser.urlencoded({extended:true}));

const multer = require("multer");
const path = require("path");

vendor_route.use(express.static('public'));

const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null,path.join(__dirname,'../public/vendor_img'),function(error,success){
            if(error) throw error
        });
    },
    filename:function(req,file,cb){
       const name =  Date.now()+'-'+file.originalname;
       cb(null,name,function(error1,success1){
        if(error1) throw error1
       })
    }
});

const upload = multer({storage:storage});

const vendor_controller = require("../controllers/vendorController");

vendor_route.post('/add_vendor',upload.single('vImage'),vendor_controller.addVendor);

module.exports = vendor_route;