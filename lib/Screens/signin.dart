import 'package:flutter/material.dart';
import 'package:music_app/Screens/home.dart';
import 'package:music_app/constant.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/RapAlbums.png",
              width: size.width,
              fit: BoxFit.fitWidth,
              height: size.height * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              height: size.height * .7,
              width: size.width,
              decoration: BoxDecoration(
                color: kbackgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: kbackgroundColor,
                      blurRadius: 12,
                      offset: Offset(0, -12),
                      spreadRadius: 12),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 1,
                    style: textFieldStyle,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: textFieldStyle,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: kAppbarColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 1,
                    style: textFieldStyle,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: textFieldStyle,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: kAppbarColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: checkBoxValue,
                              activeColor: kbuttonblue,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkBoxValue = newValue;
                                });
                              }),
                          Text(
                            'Remember me',
                            style: textStyle,
                          ),
                        ],
                      ),
                      Text(
                        "Forgot Password?",
                        style: textStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    minWidth: size.width * .5,
                    height: 44,
                    color: kbuttonblue,
                    child: Text(
                      "Log In",
                      style: textFieldStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OR",
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: size.width * .3,
                    height: 44,
                    color: kAppbarColor,
                    child: Text(
                      "Sign Up",
                      style: textFieldStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
