import 'package:flutter/material.dart';
import 'package:healthy/screens/videotile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  String url;
  YoutubeVideo(@required this.url);

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(initialVideoId: videoId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        ),
        body: Container(
            child: Column(
          children: [
            Expanded(flex: 1, child: YoutubePlayer(controller: _controller)),
            SizedBox(
              height: 50,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      VideoTile(
                          'Complete Beginer',
                          'https://www.shutterstock.com/image-photo/young-sporty-attractive-woman-practicing-260nw-1223884696.jpg',
                          "https://www.youtube.com/watch?v=0rJLF_qrd3k"),
                      VideoTile(
                          'Intermidiate Yoga',
                          'https://img.freepik.com/free-photo/beautiful-girl-is-engaged-yoga-studio_1157-29600.jpg',
                          "https://www.youtube.com/watch?v=v7AYKMP6rOE"),
                      VideoTile(
                          'Expert',
                          'https://media.istockphoto.com/id/1292399474/photo/woman-meditating-at-park.jpg?s=612x612&w=0&k=20&c=iWXLpMMYCWq59Z11E6qKqHBeTgzXedktGRmsObGvi7g=',
                          "https://www.youtube.com/watch?v=t2z8ZsAP2Vw"),
                      VideoTile(
                          'Extras',
                          'https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8eW9nYSUyMHdvbWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                          'https://www.youtube.com/watch?v=FcAl176dkU4')
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
