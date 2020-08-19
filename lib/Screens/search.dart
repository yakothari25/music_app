import 'package:flutter/material.dart';
import 'package:music_app/Widget/autocomplete_textfield.dart';
import 'package:music_app/Widget/round_bottom_nav_bar.dart';
import 'package:music_app/constant.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> recent = [
    "BLINDING LIGHTS",
    "DANCE MONKEY",
    "ROSES",
    "DON'T START NOW",
    "BEFORE YOU GO",
    "THE BOX",
    "OWN IT",
    "SOMEONE YOU LOVED",
    "SAY SO",
    "LONELY",
    "PHYSICAL",
    "ADORE YOU",
    "LIFE IS GOOD",
    "ROXANNE",
    "EVERYTHING I WANTED",
    "GODZILLA",
    "BRUISES",
    "DEATH BED",
    "TOOSIE SLIDE",
    "BAD GUY",
    "ROCKSTAR",
    "INTENTIONS",
    "MEMORIES",
    "YOU SHOULD BE SAD",
    "NO TIME TO DIE",
    "BETTER OFF WITHOUT YOU",
    "RAIN",
    "RIDE IT",
    "ROVER",
    "BLUEBERRY FAYGO",
    "FALLING",
    "CIRCLES",
    "LOSE CONTROL",
    "YUMMY",
    "I DON'T CARE",
    "MY OH MY",
    "HOLD ME WHILE YOU WAIT",
    "PUMP IT UP",
    "WATERMELON SUGAR",
    "FALLING",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: RoundBottomNavBar(
        index: 1,
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          alignment: Alignment.bottomLeft,
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              color: kAppbarColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: Container(
            width: size.width * .3,
            child: WebsafeSvg.asset(
              'assets/images/radiohead2.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .1, vertical: size.height * .02),
          child: SimpleAutoCompleteTextField(
            key: null,
            suggestions: recent,
            style: textFieldStyle,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: textFieldStyle,
              border: InputBorder.none,
              filled: true,
              fillColor: kAppbarColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide.none,
              ),
            ),
          )),
    );
  }
}

Widget getTextfield() {
  return TextField(
    enableSuggestions: true,
    maxLines: 1,
    style: textFieldStyle,
    decoration: InputDecoration(
      hintText: "Search",
      hintStyle: textFieldStyle,
      border: InputBorder.none,
      filled: true,
      fillColor: kAppbarColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
