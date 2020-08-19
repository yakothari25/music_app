import 'package:flutter/material.dart';
import 'package:music_app/Widget/round_bottom_nav_bar.dart';
import 'package:music_app/constant.dart';
import 'package:music_app/models/new_release.dart';
import 'package:music_app/models/playlistdata.dart';
import 'package:music_app/models/raw_data.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Release> newRelease = RawData.newRelease();
  List<Release> recentPlayed = RawData.recentPlayed();
  List<Catagory> catagories = RawData.catagoryList();
  List<PlayList> playlist = RawData.getplaylist();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: RoundBottomNavBar(
        index: 0,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  "New Relases",
                  style: titleStyle,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Release release = newRelease.elementAt(index);
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsetsDirectional.only(end: 16),
                      height: 60,
                      width: size.width * .37,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kAppbarColor),
                      child: newReleaseWidget(release),
                    );
                  },
                  itemCount: newRelease.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  "Recenty Played",
                  style: titleStyle,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Release release = recentPlayed.elementAt(index);
                    return recentlyPlayed(release);
                  },
                  itemCount: newRelease.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  "Categories",
                  style: titleStyle,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              catagoryBuilder(),
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
                              SizedBox(width: 6,),
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

  Container catagoryBuilder() {
    return Container(
        height: 140,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: .62),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 116,
                height: 60,
                decoration: BoxDecoration(
                  color: catagories.elementAt(index).color,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    catagories.elementAt(index).value,
                    style: songName,
                  )),
                ),
              ),
            );
          },
          itemCount: catagories.length,
        ));
  }

  Container recentlyPlayed(Release release) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 16),
      height: 140,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kSubwhiitetextColor,
              ),
            ),
            width: 100,
            height: 100,
            child: Image.asset(release.assets),
          ),
          Text(
            release.songName,
            style: songName,
            maxLines: 2,
          ),
          Text(
            release.singer,
            style: singerName,
          )
        ],
      ),
    );
  }

  Row newReleaseWidget(Release release) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: kSubwhiitetextColor,
          )),
          width: 44,
          height: 44,
          child: Image.asset(
            release.assets,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              release.songName,
              style: songName,
              maxLines: 2,
            ),
            Text(
              release.singer,
              style: singerName,
            )
          ],
        )
      ],
    );
  }
}

String title = '''<?xml version="1.0" encoding="utf-8"?>
<svg width="106px" height="9px" viewBox="0 0 106 9" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
  <desc>Created with Lunacy</desc>
  <g id="radiohead-copy-2">
    <path d="M9.89874 0.601537C9.23062 0.200738 8.09945 0 6.50721 0L0 0L0 8.99932L2.66586 8.99932L2.66586 6.19305L6.09774 6.19305C6.72286 6.19305 7.19319 6.26833 7.51005 6.41888C7.82691 6.56944 7.98567 6.84071 7.98567 7.23337L7.98567 8.99932L10.7435 8.99932L10.7435 6.95057C10.7435 6.36802 10.5589 5.91772 10.1891 5.59898C9.81936 5.28091 9.25642 5.12087 8.49966 5.12087C9.28288 5.04016 9.87956 4.77635 10.2884 4.3308C10.6972 3.88524 10.9022 3.36915 10.9022 2.78389C10.9022 1.73001 10.5675 1.00234 9.89874 0.601537ZM24.467 9L19.9271 0L16.1129 0L11.6523 9L14.516 9L15.321 7.31678L20.838 7.31678L21.6827 9L24.467 9ZM37.2656 4.84621L37.2392 3.33931C37.2392 2.16336 36.833 1.31158 36.0187 0.787356C35.2044 0.26313 33.9184 0 32.1581 0L25.5854 0L25.5854 9L32.5934 9C34.4767 9 35.7263 8.64057 36.3422 7.92103C36.9574 7.20217 37.2656 6.17678 37.2656 4.84621ZM41.5999 0L41.5999 9L39.0313 9L39.0313 0L41.5999 0ZM55.068 2.70658L55.068 6.17135C55.068 7.09163 54.6519 7.79353 53.821 8.27571C52.9895 8.75857 52.0548 9 51.0163 9L49.934 9C48.957 9 48.3173 8.99796 48.0137 8.99661C47.7475 8.99443 47.4813 8.98833 47.2153 8.9783C46.221 8.9783 45.3604 8.72602 44.6347 8.22214C43.9091 7.7169 43.5459 7.03127 43.5459 6.16593L43.5459 2.70387C43.5459 1.9199 43.9196 1.27293 44.6671 0.764298C45.4153 0.254992 46.2157 0 47.0691 0L51.134 0C52.1898 0 53.1093 0.239394 53.8925 0.717504C54.6764 1.19561 55.068 1.85887 55.068 2.70658ZM68.2269 9L68.2269 0L65.4684 0L65.4684 3.43154L59.5433 3.43154L59.5433 0L56.8252 0L56.8252 9L59.5433 9L59.5433 5.37382L65.4684 5.37382L65.4684 9L68.2269 9ZM80.0001 7.09977L80.0001 9L70.8218 9L70.8218 0L79.934 0L79.934 1.98568L73.4532 1.98568L73.4532 3.51767L79.6304 3.51767L79.6304 5.24361L73.4532 5.24361L73.4532 7.09977L80.0001 7.09977ZM88.6626 0L93.2025 9L90.4169 9L89.5722 7.31678L84.0552 7.31678L83.2515 9L80.3872 9L84.8484 0L88.6626 0ZM105.974 3.33931L106 4.84621C106 6.17678 105.691 7.20217 105.076 7.92103C104.46 8.64057 103.211 9 101.328 9L94.3203 9L94.3203 0L100.893 0C102.653 0 103.939 0.26313 104.754 0.787356C105.568 1.31158 105.974 2.16336 105.974 3.33931ZM16.1665 5.37382L20.0072 5.37382L18.067 1.61879L16.1665 5.37382ZM88.7419 5.37382L84.9019 5.37382L86.801 1.61879L88.7419 5.37382ZM52.2973 3.69196L52.2973 5.32093C52.2973 5.94077 52.1359 6.40261 51.8158 6.70711C51.4943 7.01228 50.9598 7.16419 50.2123 7.16419L48.0214 7.16419C47.4221 7.16419 46.9828 7.00347 46.701 6.68066C46.4192 6.35649 46.2783 5.9028 46.2783 5.32025L46.2783 3.62414C46.2783 3.02329 46.4205 2.5567 46.707 2.2244C46.9927 1.89278 47.4307 1.72662 48.0207 1.72662L50.2116 1.72662C50.9505 1.72662 51.4824 1.89956 51.8085 2.24475C52.1339 2.58993 52.2973 3.07279 52.2973 3.69196ZM31.7629 7.20827C32.9066 7.20827 33.6409 7.0211 33.9663 6.64404C34.2924 6.26833 34.4545 5.66408 34.4545 4.83061L34.4545 3.4858C34.4545 2.97852 34.2786 2.59807 33.9273 2.34443C33.5747 2.0908 32.9066 1.9633 31.9216 1.9633L28.3052 1.9633L28.3052 7.20759L31.7629 7.20759L31.7629 7.20827ZM102.7 6.64404C102.375 7.0211 101.641 7.20827 100.496 7.20827L100.496 7.20759L97.0386 7.20759L97.0386 1.9633L100.655 1.9633C101.641 1.9633 102.309 2.0908 102.66 2.34443C103.013 2.59807 103.189 2.97852 103.189 3.4858L103.189 4.83061C103.189 5.66408 103.026 6.26833 102.7 6.64404ZM7.66138 4.02901C7.37561 4.17753 6.85434 4.25145 6.09758 4.25145L2.66504 4.25145L2.66504 1.98568L6.25568 1.98568C7.0647 1.98568 7.57273 2.06909 7.77978 2.23525C7.98617 2.4014 8.09003 2.6964 8.09003 3.1189C8.09003 3.57735 7.94714 3.88117 7.66138 4.02901Z" id="Shape" fill="#F9F8FF" fill-rule="evenodd" stroke="none" />
  </g>
</svg>''';
