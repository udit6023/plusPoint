import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plus_point/HomeScreen.dart';

import 'OtpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _formKey = GlobalKey<FormState>();
   
   String currentText = "";
   TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;
  bool phnVisibilty = true;
  bool textVisibility = true;
  bool text1Visibility=false;

  String verificationID = "";

    String input = '';

  void addToInput(String digit) {
    setState(() {
      phoneController.text+=digit;
    });
  }

  void clearInput() {
    setState(() {
      phoneController.clear();
    });
  }

  void submitInput() {
    // Do something with the input, e.g. save it to a database
    clearInput();
  }

  @override
  Widget build(BuildContext context) {

      double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
          children:[
            Padding(
              padding: EdgeInsets.only(top:height*0.05,right: height*.17),
              child: const Text("Pluspoint",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
           // SizedBox(height: height*0.10,),
            Padding(
              padding:EdgeInsets.only(left:00,right: height*.18,top: height*0.02),
              child: RichText(
                      text: const TextSpan(
              text: 'Enter Your\n',
              style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold), /*defining default style is optional */
              children: <TextSpan>[
                TextSpan(
                    text: 'mobile', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 24)),
                TextSpan(
                    text: ' number',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 24)),
              ],
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(left: height*.001,right:height*.045,top: height*0.01),
              child: const Text("we will send you confirmation code",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16)),
            ),
    //SizedBox(height: height*.001,),
            Padding(
              padding: EdgeInsets.only(left:height*.03,right:height*.03,top: height*.01),
              child: Form(
                                              key: _formKey,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.length != 10 || value.isEmpty) {
                                                    return 'Enter 10-digit phone number ';
                                                  }
                                                  return null;
                                                },
                                                autofocus: false,
                                                controller: phoneController,
                                                decoration: InputDecoration(
                                                  
                                                    filled: true,
                                                    fillColor: CupertinoColors.systemGrey6,
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                color: Colors.grey,
                width: 4.0,
                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(5)),
                                                    hintText: 'Enter phone number',
                                                    contentPadding: EdgeInsets.symmetric(
                                                        vertical: 0, horizontal: 10),
                                                    prefix: Padding(
                                                      padding: EdgeInsets.all(4),
                                                      child: Text("+91"),
                                                    )),
                                                maxLength: 10,
                                                keyboardType: TextInputType.none,
                                              ),
                                            ),
            ),
            
          GridView.count(
            padding: EdgeInsets.only(left:height*.11,right:height*.02,top:height*.0057),
            mainAxisSpacing:0,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: [
              
                InkWell(
                  onTap: () => {
                    addToInput('1'),
                  },
                  child: Text('1', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                
              
              InkWell(
                  onTap: () => {
                    addToInput('2'),
                  },
                  child: Text('2', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),

             InkWell(
                  onTap: () => {
                    addToInput('3'),
                  },
                  child: Text('3', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('4'),
                  },
                  child: Text('4', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('5'),
                  },
                  child: Text('5', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('6'),
                  },
                  child: Text('6', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('7'),
                  },
                  child: Text('7', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('8'),
                  },
                  child: Text('8', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('9'),
                  },
                  child: Text('9', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput(''),
                  },
                  child: Text('', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    addToInput('0'),
                  },
                  child: Text('0', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () => {
                    clearInput(),
                  },
                  child: Text('<-', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold))),
            ],
          ),

          // ElevatedButton(onPressed: ()=>{

          // }, child: Text("Continue->"))
            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side:
                                                BorderSide(color: Colors.blueAccent))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueAccent)),
                                onPressed: (() {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtpScreen(
                                                phone: phoneController.text,
                                              )),
                                    );
                                    print(phoneController.text);
                                  }
                                }),
                                child: Text(
                                  "   Continue->   ",
                                  style: TextStyle(fontSize: 30),
                                )),
                              //  SizedBox(height: 10,)

          ],
        )
    );
  }
// Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Card(
//               elevation: 5,
//               color: CupertinoColors.systemGrey6,
//                shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               child: Container(
//                 height: MediaQuery.of(context).size.height/2.5,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                      Container(
//                                 alignment: Alignment.center,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Text(
//                                   "Verification",
//                                   style: TextStyle(
//                                       color: CupertinoColors.black,
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                       SizedBox(height: 20.0,),
//                       Visibility(
//                         visible:textVisibility,
//                         child: Container(
//                                   alignment: Alignment.centerRight,
//                                   width: MediaQuery.of(context).size.width/1.5,
//                                   child: Text(
//                                     "Please enter your mobile number to get OTP",
//                                     style: TextStyle(
//                                         color: CupertinoColors.systemGrey,
//                                         fontSize:
//                                             MediaQuery.of(context).size.height /
//                                                 50),
//                                   ),
//                                 ),
//                       ),
//                       Visibility(
//                         visible:text1Visibility,
//                         child: Container(
//                                   alignment: Alignment.center,
//                                   width: MediaQuery.of(context).size.width/1.5,
//                                   child: Text(
//                                     "Please enter your OTP",
//                                     style: TextStyle(
//                                         color: CupertinoColors.systemGrey,
//                                         fontSize:
//                                             MediaQuery.of(context).size.height /
//                                                 50),
//                                   ),
//                                 ),
//                       ),
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height / 30,
//                               ),
//                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(left: 25, right: 25),
//                                       child: Visibility(
//                                         visible: phnVisibilty,
//                                         child: Form(
//                                           key: _formKey,
//                                           child: TextFormField(
//                                             validator: (value) {
//                                               if (value!.length != 10 || value.isEmpty) {
//                                                 return 'Enter 10-digit phone number ';
//                                               }
//                                               return null;
//                                             },
//                                             autofocus: false,
//                                             controller: phoneController,
//                                             decoration: InputDecoration(
//                                                 filled: true,
//                                                 fillColor: CupertinoColors.systemGrey6,
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(30)),
//                                                 hintText: 'Enter phone number',
//                                                 contentPadding: EdgeInsets.symmetric(
//                                                     vertical: 0, horizontal: 10),
//                                                 prefix: Padding(
//                                                   padding: EdgeInsets.all(4),
//                                                   child: Text("+91"),
//                                                 )),
//                                             maxLength: 10,
//                                             keyboardType: TextInputType.phone,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
                  
//                     Visibility(
//                       visible: otpVisibility,
//                       child: Form(
//                                 key: _formKey1,
//                                 child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 8.0, horizontal: 30),
//                                     child: PinCodeTextField(
//                                       appContext: context,
//                                       pastedTextStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       length: 6,
//                                       pinTheme: PinTheme(
//                                           shape: PinCodeFieldShape.box,
//                                           borderRadius: BorderRadius.circular(5),
//                                           fieldHeight: 50,
//                                           fieldWidth: 40,
//                                           activeFillColor: Colors.white,
//                                           disabledColor: Colors.white,
//                                           selectedColor:
//                                               CupertinoColors.systemGrey4,
//                                           activeColor:
//                                               CupertinoColors.systemGrey4,
//                                           inactiveColor:
//                                               CupertinoColors.systemGrey4,
//                                           errorBorderColor: Colors.black,
//                                           inactiveFillColor:
//                                               CupertinoColors.white,
//                                           selectedFillColor: Colors.white),
//                                       cursorColor: CupertinoColors.black,
//                                       enableActiveFill: true,
//                                       controller: otpController,
//                                       keyboardType: TextInputType.number,
//                                       boxShadows: const [],
//                                       onChanged: (value) {
//                                         setState(() {
//                                           currentText = value;
//                                         });
//                                       },
//                                     )),
//                               ),),
                  
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton(
//                                   style: ButtonStyle(
//                                       shape: MaterialStateProperty.all<
//                                               RoundedRectangleBorder>(
//                                           RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(18.0),
//                                               side:
//                                                   BorderSide(color: Colors.black))),
//                                       backgroundColor: MaterialStateProperty.all(
//                                           CupertinoColors.black)),
//                                   onPressed: (() async {
//                                     setState(() {
                                      
//                                     });
//                                           // setState(() {
//                                           //   loginWithPhone();
//                                           //   phnVisibilty=false;
                                            
//                                           //   otpVisibility=false;
//                                           // });
//                                        if(otpVisibility){
                                        
//                                             verifyOTP();
//                                           }
//                                           else{
                                             
//                                             loginWithPhone();
                                            
//                                           }
                                          
                                    
//                                   }),
//                                   child: Text(otpVisibility ? "Verify" : "Login",style:const TextStyle(fontSize: 20),),)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
  

}