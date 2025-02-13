import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void showVideoPopup(BuildContext context, String assetVideoPath) {
  showDialog(
    context: context,
    builder: (context) => VideoPopup(assetVideoPath: assetVideoPath),
  );
}

class VideoPopup extends StatefulWidget {
  final String assetVideoPath;
  
  const VideoPopup({
    super.key, 
    required this.assetVideoPath
  });

  @override
  VideoPopupState createState() => VideoPopupState();
}

class VideoPopupState extends State<VideoPopup> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetVideoPath)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play(); // Auto-play après initialisation
      }).catchError((error) {
        print("Erreur de chargement de la vidéo : $error");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.black,
    contentPadding: const EdgeInsets.all(8),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bouton en haut à droite
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, size: 30, color: Colors.white,),
            ),
          ],
        ),
        
        // Contenu vidéo
        _isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(
                height: 200,
                width: 300,
                color: Colors.grey[900],
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
      ],
    ),
  );
}
}
