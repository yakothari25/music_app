import 'package:flutter/material.dart';
import 'package:music_app/Screens/home.dart';
import 'package:music_app/Screens/playlist.dart';
import 'package:music_app/Screens/search.dart';
import 'package:music_app/constant.dart';

class RoundBottomNavBar extends StatefulWidget {
  final int index;
  const RoundBottomNavBar({Key key, this.index}) : super(key: key);
  @override
  _RoundBottomNavBarState createState() => _RoundBottomNavBarState();
}

class _RoundBottomNavBarState extends State<RoundBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kAppbarColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: widget.index == 0 ? kbuttonblue : kSubwhiitetextColor,
              ),
              onPressed: () {
                if (widget.index != 0) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            HomeScreen(),
                      ));
                }
              }),
          IconButton(
              icon: Icon(
                Icons.search,
                color: widget.index == 1 ? kbuttonblue : kSubwhiitetextColor,
              ),
              onPressed: () {
                if (widget.index != 1) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          Search(),
                    ),
                  );
                }
              }),
          IconButton(
              icon: Icon(
                Icons.library_music,
                color: widget.index == 2 ? kbuttonblue : kSubwhiitetextColor,
              ),
              onPressed: () {
                if (widget.index != 2) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            PlayListScreen(),
                      ));
                }
              }),
        ],
      ),
    );
  }
}
