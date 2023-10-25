import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Home_Shared extends StatefulWidget {
  const Home_Shared({super.key});

  @override
  State<Home_Shared> createState() => _Home_SharedState();
}

class _Home_SharedState extends State<Home_Shared> {
  late SharedPreferences prefs;
  String? userName;
  @override
  void initState(){
    getUserName();
  }


  void getUserName() async{
    prefs=await SharedPreferences.getInstance();
     setState(() {
      userName=prefs.getString('username')!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome ${userName}"),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              prefs.setBool('firstLogin', true);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: const Text("Log Out"))
          ],
        ),

      ),
    );
  }


}


