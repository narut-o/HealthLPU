import 'package:flutter/material.dart';
import 'package:healthy/screens/videos.dart';

class VideoTile extends StatelessWidget {
  String title;
  String url;
  String videoUrl;
  VideoTile(@required this.title, @required this.url, @required this.videoUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          child: Image.network(
            url,
            fit: BoxFit.fill,
          ),
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.amber,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.play_circle_fill_outlined,
            size: 35,
            color: Colors.amber,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => YoutubeVideo(videoUrl)));
          },
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
