import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_app/constants/app_strings.dart';

class AudioPlayerScreen extends StatelessWidget {
  static const routeName = '/audio_player';

  AudioPlayerScreen({required this.url});

  final String url;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.playAudio),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () async {
              await player.setUrl(url);
              await player.play();
            },
            child: Icon(
              Icons.play_arrow,
              size: 100,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          Text(
            AppStrings.play,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
    );
  }
}
