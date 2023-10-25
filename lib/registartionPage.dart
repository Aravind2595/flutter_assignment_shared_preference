import 'package:flutter/material.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final userName=TextEditingController();
  final emailId=TextEditingController();
  final password=TextEditingController();
  final cPassword=TextEditingController();

  late SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "User Name",
                      suffixIcon: Icon(Icons.account_circle,color: Colors.blue,),
                      label: Text("User Name",style: TextStyle(color: Colors.blue),)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailId,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Email",
                      suffixIcon: Icon(Icons.account_circle,color: Colors.blue,),
                      label: Text("Email",style: TextStyle(color: Colors.blue),)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Password",
                      suffixIcon: Icon(Icons.password,color: Colors.blue,),
                      label: Text("Password",style: TextStyle(color: Colors.blue),)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: cPassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Confirm Password",
                      suffixIcon: Icon(Icons.password,color: Colors.blue,),
                      label: Text("Confirm Password",style: TextStyle(color: Colors.blue),)
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: () async{
                    prefs=await SharedPreferences.getInstance();
                    String uname=userName.text.trim();
                    String email=emailId.text.trim();
                    String pass=password.text.trim();
                    String cpass=cPassword.text.trim();
                    if(uname!='' && pass!='' && email!='' && pass==cpass){
                      prefs.setString('username', uname);
                      prefs.setString('email', email);
                      prefs.setString('password', pass);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
                    }
                  }, child: Text("Register")))
            ],
          ),
        ),
      ),
    );
  }
}
