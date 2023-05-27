import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.menu,color: Colors.black,size: 30,),
          title: Center(child: Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 27),)),
          actions:[
            Icon(
              Icons.balance_outlined,
              color: Colors.black,
              size: 30,
            ),

            Icon(
              Icons.balance_outlined,
              
            )
          
          ],
        ),
        body: Center(
          child: _buildPage(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
           //unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 14),
           iconSize: 30,
           unselectedItemColor: Colors.black,
           selectedItemColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.speed),
              label: 'Credit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen1();
      case 1:
        return HomeScreen1();
      case 2:
        return HomeScreen1();
      case 3:
        return HomeScreen1();
      default:
        return HomeScreen1();
    }
  }
}
class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}