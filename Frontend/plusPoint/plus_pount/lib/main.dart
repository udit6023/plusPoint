import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plus_point/HomeScreen.dart';
import 'package:plus_point/LoginScreen.dart';
import 'package:plus_point/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

  

  // This widget is the root of your application.
  
  
  

  class _MyAppState extends State<MyApp> {
   
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home:HomeScreen(),
    );
  }
  
  }
  class Intro extends StatelessWidget{

     List<PageViewModel> listPagesViewModel=[
    PageViewModel(
  title: "Get rewards From\n your local shops",
  body: "",
  
  image: Padding(
    padding: const EdgeInsets.only(top:0.0),

    
    child: SvgPicture.asset("assets/images/welcomeScreen1Logo.svg",height: 300,width: 400,),
  ),
  decoration:const PageDecoration(
    titlePadding: EdgeInsets.only(top:80),
   imageAlignment: Alignment.center,
    pageColor: Colors.white,
  ),
),
PageViewModel(
  title: "Check and Monitor\n your Credit Score",
  body: "",
  
  image: Padding(
    padding: const EdgeInsets.only(top:0.0),

    
    child: SvgPicture.asset("assets/images/welcomeScreen2Logo.svg",height: 300,width: 400,),
  ),
  decoration:const PageDecoration(
    titlePadding: EdgeInsets.only(top:80),
   imageAlignment: Alignment.center,
    pageColor: Colors.white,
  ),
),
PageViewModel(
  title: "Buy now or pay Later\n At any QR code",
  body: "(coming soon)",
  
  image: Padding(
    padding: const EdgeInsets.only(top:0.0),

    
    child: SvgPicture.asset("assets/images/welcomeScreen3Logo.svg",height: 300,width: 400,),
  ),
  decoration:const PageDecoration(
    titlePadding: EdgeInsets.only(top:80),
   imageAlignment: Alignment.center,
    pageColor: Colors.white,
  ),
)
  ];
  @override
  Widget build(BuildContext context) {
   return IntroductionScreen(
        globalBackgroundColor:CupertinoColors.white ,
        pages: listPagesViewModel,
  showSkipButton: true,
  showNextButton: false,
  skip: const Text("Skip",style: TextStyle(fontSize: 20)),
  done: const Text("Done",style: TextStyle(fontSize: 20),),
  onDone: () {
    // On button pressed
    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginScreen(
                                                
                                              )),
                                    );
  },
      );
  }

  }
