import 'package:flutter/material.dart';
import 'package:quicken_app/src/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Create an Account",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupScreen()));
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
                onPressed: () {},
                child: Text("Login"),
              ),
              RaisedButton(
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Help"),
                        content: Text(
                            "- Email address should be in a valid standard email format "+
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
}
