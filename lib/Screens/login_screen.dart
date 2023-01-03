import 'package:flutter/material.dart';
import 'package:library_management_system/Services/design.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

/// This screen is where the user can enter his username ans password to log in
/// after he has entered both a username and a password and hits login, it is first checked if the login information actually works
/// this is made by sending a login request to the webUntis server and if it works the user is redirected to the loading screen
/// if it doesnt work he simply gets a popup that the username/password was incorrect
/// if there is no answer withing 5 seconds then it is concluded that there is no active internet connection
/// in this case the user is stuck on this screen.
class _LoginState extends State<Login> {
  //using controllers to read the text in the textfields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Notifying the user that the username is incorrect is done by using an empty text and only setting it if the name is incorrect
  String incorrectUsername = '';
  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Library Management System',
                style: Design.mainTitleTextStyleYellow(),
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                '$incorrectUsername',
                style: TextStyle(color: Colors.red[600], fontSize: 16.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              //The Textfield for the username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                autocorrect: false,
                maxLength: 16,
                maxLengthEnforced: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              //the Textfield for the password
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                autocorrect: false,
                maxLength: 32,
                maxLengthEnforced: true,
                obscureText: true,
                obscuringCharacter: '*',
              ),
              SizedBox(
                height: 25.0,
              ),
              //using a row and an expanded widget with just one child each makes sure that the login button
              //doesnt go to the bottom of the screen and fills out the horizontal space available
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: RaisedButton(
                      elevation: 100.0,
                      padding: EdgeInsets.all(14.0),
                      color: Colors.blue[700],
                      onPressed: () async {
                        String username = usernameController.text.trim();
                        String password = passwordController.text;
                        if (username != null && password != null) {
                          Navigator.pushReplacementNamed(context, '/shelf');
                        }
                      },
                      child: Text(
                        'login',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
