import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  ChewieItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }):super(key: key);
  @override
  _ChewieItemState createState() => _ChewieItemState();
}

class _ChewieItemState extends State<ChewieItem> {
  ChewieController _chewieController;
  
  @override
  void initState(){
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context,errorMessage){
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color:Colors.white),
          ),
        );
      }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(0.0),
    child: Chewie(controller: _chewieController,
    ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}