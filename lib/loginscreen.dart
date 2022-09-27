import 'package:flutter/material.dart';
import 'package:login_page/homepage.dart';
import 'var.dart' as globals;

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = "rami@gmail.com";

  String password = "123";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text("Enter your email"),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      hintText: "example@gmail.com"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Enter your password"),
                        prefixIcon: Icon(Icons.password_rounded),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        hintText: "Password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(20)),
                          onPressed: () {
                            setState(() {
                              if (emailController.text == globals.email &&
                                  passController.text == globals.password) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SecondScreen();
                                  },
                                ));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          Text("Invalid email or password"),
                                    );
                                  },
                                );
                              }
                            });
                          },
                          icon: Icon(Icons.login),
                          label: Text("Login")),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(20)),
                          onPressed: () {},
                          icon: Icon(Icons.login),
                          label: Text("sign in")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
