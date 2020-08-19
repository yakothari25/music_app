import 'package:flutter/material.dart';
import 'package:music_app/models/new_release.dart';
import 'package:music_app/models/playlistdata.dart';

class RawData {
  static List<Release> newRelease() {
    return ([
      Release("Senorita", "Shawn", "assets/images/Senorita.jpg"),
      Release("Dance \nMonkey", "Tones", "assets/images/Dance Monkey.jpg"),
      Release("Memories", "Maroon 5", "assets/images/Memories.jpg"),
    ]);
  }

  static List<Release> recentPlayed() {
    return ([
      Release("Sunflower", "Post Malone", "assets/images/sipderman.jpg"),
      Release("Senorita", "Shawn", "assets/images/Senorita.jpg"),
      Release("Stuck with U", "Arina Grande", "assets/images/Stuck with U.jpg")
    ]);
  }

  static List<Catagory> catagoryList() {
    return ([
      Catagory("Pop", Colors.purple),
      Catagory("Rock", Colors.redAccent[700]),
      Catagory("Edm", Colors.amber),
      Catagory("Hip-Hop", Colors.teal[600]),
      Catagory("Podcast", Colors.blueAccent[400]),
      Catagory("Jazz", Colors.deepOrangeAccent),
    ]);
  }

  static List<PlayList> getplaylist() {
    return ([
      PlayList("Liked Songs",
          "assets/icons/3af0e55ea66ea69e35145fb108b4a636.png", 123),
      PlayList("The Weekend",
          "assets/icons/3f9b1ab0095226f5af5f5720e1a49acd.png", 21),
      PlayList(
          "Hit 50", "assets/icons/8ddf985207de08d839f8d6e0afebd762.png", 50),
      PlayList(
          "International",
          "assets/icons/Casey-Roarty_Graphic-Designer_Art-Director-London_Oh-Wonder-Ultralife-Album-Artwork.png",
          45)
    ]);
  }
}
