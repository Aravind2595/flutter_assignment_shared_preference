import 'package:flutter/material.dart';
import 'registartionPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userName = TextEditingController();
  final password = TextEditingController();
  late bool newUser;
  late SharedPreferences prefs;

  @override
  void initState() {
    checkUserAlreadyLoggedIn();
  }

  void checkUserAlreadyLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    //newUser=prefs.getBool('firstLogin')!;
    //if value of firstlogin is null newUser is true else newUser
    newUser = prefs.getBool('firstLogin') ?? true;
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home_Shared()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.green)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "User Name",
                      suffixIcon: const Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        "User Name",
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.green)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Password",
                      suffixIcon: const Icon(
                        Icons.password,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        "Password",
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            validateUser();
                          },
                          child: const Text("Login")),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegistrationPage()));
                          },
                          child: const Text(
                            "Not an User? Register",
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void validateUser() async{
    prefs = await SharedPreferences.getInstance();
    String uname = userName.text.trim();
    String pass = password.text.trim();
    String unameStored = prefs.getString('username')!;
    String passStored = prefs.getString('password')!;
    if (uname == unameStored && pass == passStored) {
      //first login false means user already looged in
      prefs.setBool('firstLogin', false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const Home_Shared()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        content: Text(
          "Invalid UserName or Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
