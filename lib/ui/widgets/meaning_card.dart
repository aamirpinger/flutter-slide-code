import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/word.dart';

class MeaningCard extends StatelessWidget {
  MeaningCard(this.word);

  Word word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 280,
        child: Card(
          color: Theme.of(context).cardTheme.color,
          elevation: Theme.of(context).cardTheme.elevation,
          shadowColor: Theme.of(context).cardTheme.shadowColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                word.word.isNotEmpty
                    ? Text(
                        '${AppStrings.word} ${word.word}',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    : Container(),
                word.meaning.isNotEmpty
                    ? Text(
                        word.word.isNotEmpty
                            ? '${word.meaning}'
                            : ErrorStrings.na,
                        style: Theme.of(context).textTheme.headline4,
                      )
                    : Container(),
                word.audioUrl.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/audio_player',
                            arguments: word.audioUrl,
                          );
                        },
                        child: Icon(
                          Icons.volume_up,
                          color: Colors.white,
                          size: 32,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
