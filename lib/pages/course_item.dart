import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseItem extends StatelessWidget {
  final String title;
  final String youtubeUrl;

  const CourseItem({super.key, required this.title, required this.youtubeUrl});

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayer.convertUrlToId(youtubeUrl) ?? "";

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          "https://img.youtube.com/vi/$videoId/0.jpg",
          width: 80,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Tap to watch"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => YoutubePlayerScreen(videoId: videoId, title: title),
            ),
          );
        },
      ),
    );
  }
}

class YoutubePlayerScreen extends StatelessWidget {
  final String videoId;
  final String title;

  const YoutubePlayerScreen({
    super.key,
    required this.videoId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
