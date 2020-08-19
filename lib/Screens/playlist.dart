import 'package:flutter/material.dart';
import 'package:music_app/Widget/round_bottom_nav_bar.dart';
import 'package:music_app/constant.dart';
import 'package:music_app/models/playlistdata.dart';
import 'package:music_app/models/raw_data.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PlayListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PlayList> playlist = RawData.getplaylist();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: RoundBottomNavBar(
        index: 2,
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .1, vertical: size.height * .02),
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  "Playlists",
                  style: titleStyle,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      height: 50,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(playlist.elementAt(index).assets),
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playlist.elementAt(index).name,
                                    style: songName,
                                  ),
                                  Text(
                                    "${playlist.elementAt(index).total} songs",
                                    style: singerName,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: playlist.length,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
