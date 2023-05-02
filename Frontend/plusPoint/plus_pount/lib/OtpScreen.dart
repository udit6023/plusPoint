// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:plus_point/HomeScreen.dart';

class OtpScreen extends StatefulWidget {
  String phone;
  OtpScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}



class _OtpScreenState extends State<OtpScreen> {




   TextEditingController otpController = TextEditingController();
   final _formKey1 = GlobalKey<FormState>();
   String currentText="";

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;
  bool phnVisibilty = true;
  bool textVisibility = true;
  bool text1Visibility=false;

  String verificationID = "";

    String input = '';

  void addToInput(String digit) {
    setState(() {
      otpController.text+=digit;
    });
  }

  void clearInput() {
    setState(() {
      otpController.clear();
    });
  }

  void submitInput() {
    // Do something with the input, e.g. save it to a database
    clearInput();
  }

  @override
  void initState() {
    // TODO: implement initState
    loginWithPhone();
    super.initState();
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
              child:  Text("Pluspoint",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
           // SizedBox(height: height*0.10,),
            Padding(
              padding:EdgeInsets.only(left:00,right: height*.01,top: height*0.02),
              child: RichText(
                      text:  TextSpan(
              text: 'Enter verifiction code\n',
              style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold), /*defining default style is optional */
              children: <TextSpan>[
                TextSpan(
                    text: '\t\tsent to', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18)),
                TextSpan(
                    text: ' +91${widget.phone}',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize:18)),
              ],
                      ),
                    ),
            ),
            
    //SizedBox(height: height*.001,),
            Padding(
              padding: EdgeInsets.only(left:height*.03,right:height*.03,top: height*.01),
              child: Form(
                                key: _formKey1,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 20),
                                    child: PinCodeTextField(
                                      appContext: context,
                                      pastedTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      length: 6,
                                      pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius: BorderRadius.circular(5),
                                          fieldHeight: 50,
                                          fieldWidth: 40,
                                          activeFillColor: Colors.white,
                                          disabledColor: Colors.white,
                                          selectedColor:
                                              CupertinoColors.systemGrey4,
                                          activeColor:
                                              CupertinoColors.systemGrey4,
                                          inactiveColor:
                                              CupertinoColors.systemGrey4,
                                          errorBorderColor: Colors.black,
                                          inactiveFillColor:
                                              CupertinoColors.white,
                                          selectedFillColor: Colors.white),
                                      cursorColor: CupertinoColors.black,
                                      enableActiveFill: true,
                                      controller: otpController,
                                      keyboardType: TextInputType.none,
                                      boxShadows: const [],
                                      onChanged: (value) {
                                        setState(() {
                                          currentText = value;
                                        });
                                      },
                                    )),
                              ),
            ),

            Text("Resend code in:00:30",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize:18)),
            
          GridView.count(
            padding: EdgeInsets.only(left:height*.11,right:height*.02,top:height*.027),
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
                                  
                                    verifyOTP();
                      
                                }),
                                child: Text(
                                  "   Done->   ",
                                  style: TextStyle(fontSize: 30),
                                )),
                              //  SizedBox(height: 10,)

          ],
        )
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91"+widget.phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value){
          print("You are logged in successfully");
        
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        phnVisibilty=false;
        textVisibility=false;
        text1Visibility=true;
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }

  void verifyOTP() async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) async{
      print("You are logged in successfully"); 
      // await SharePreference.setBooleanValue(CONFIG.IS_LOGIN,true);
      // await SharePreference.setStringValue(CONFIG.USER_PHONENUMBER, phoneController.text.toString());
      // await SharePreference.setStringValue(CONFIG.USER_TYPE, phoneController.text.toString());
      // print("LoginScreen: "+await SharePreference.getStringValue(CONFIG.USER_TYPE)); 
       Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
        
    });
  }
}