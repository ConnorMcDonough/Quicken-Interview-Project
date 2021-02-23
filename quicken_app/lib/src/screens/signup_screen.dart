import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:quicken_app/src/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up Page"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Go Back",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 18, right: 18),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.account_box,
                size: 120,
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Input Email here...",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Input Password here...",
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () async {
                  if (validateEmail(emailController.text.toString()) == false &&
                      validatePassword(passwordController.text.toString()) ==
                          false) {
                    Fluttertoast.showToast(
                      msg:
                          "Email and Password are not valid.\nCheck Help button for more info.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                    );
                  } else if (validateEmail(emailController.text.toString()) ==
                      false) {
                    Fluttertoast.showToast(
                      msg:
                          "Email is not valid.\nCheck Help button for more info.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                    );
                  } else if (validatePassword(
                          passwordController.text.toString()) ==
                      false) {
                    Fluttertoast.showToast(
                      msg:
                          "Password is not valid.\nCheck Help button for more info.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                    );
                  } else {
                    var box = await Hive.openBox("user");
                    box.put('email', emailController.text.toString());
                    box.put('password', passwordController.text.toString());
                    print("email: " + box.get('email'));
                    print("password: " + box.get('password'));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                child: Text("Sign up"),
              ),
              RaisedButton(
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Help"),
                        content: Text(
                            "- Email address should be in a valid standard email format " +
                                "\n\n- Password must be at least 9 characters long with at least 1 uppercase character, 1 lowercase character, and 1 number."),
                        actions: [
                          new FlatButton(
                            child: const Text("Go Back"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Help"))
            ],
          ),
        ),
      ),
    );
  }

  bool validatePassword(String value) {
    //Tests to see if password matchs requirements using regular expression
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{9,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateEmail(String value) {
    //Tests to see if email matchs requirements using regular expression
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
