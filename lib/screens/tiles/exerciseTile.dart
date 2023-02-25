import 'package:flutter/material.dart';
import 'package:healthy/screens/videos.dart';

class ExerciseTile extends StatelessWidget {
  String title;
  String img;
  String url;
  ExerciseTile(@required this.title, @required this.img, @required this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 141, 245, 248),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => YoutubeVideo(url)));
                        },
                        icon: Icon(Icons.play_circle_fill),
                        label: Text(
                          "Play",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12))),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'images/img${img}.png',
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
