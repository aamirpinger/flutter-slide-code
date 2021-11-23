import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/word.dart';

class DictionaryService {
  Future<Word?> getData(String word) async {
    String url = '${Configs.baseUrl}${word.trim()}?key=${Configs.apiKey}';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      dynamic parsedData = jsonDecode(data)[0];
      if (parsedData == null) {
        throw new Exception(ErrorStrings.invalidData);
      }
      String meaning =
          parsedData['shortdef'].length != 0 ? parsedData['shortdef'][0] : '';
      String audioName = parsedData['hwi']['prs'].length != 0
          ? parsedData['hwi']['prs'][0]['sound']['audio']
          : '';

      return Word(
          word: word, meaning: meaning, audioUrl: getAudioUrl(audioName));
      // getAudioUrl
    } else {
      print(response.statusCode);
      return null;
    }
  }

  String getAudioUrl(String audioFileName) {
    String folderName = '';
    final startWithAlphabetsOnly = RegExp(r'^[A-Za-z]');

    if (audioFileName.isEmpty) {
      throw new Exception(ErrorStrings.invalidAudioFile);
    }

    if (audioFileName.startsWith('gg')) {
      folderName = 'gg';
    } else if (audioFileName.startsWith('bix')) {
      folderName = 'bix';
    } else if (!startWithAlphabetsOnly.hasMatch(audioFileName)) {
      folderName = '_';
    } else {
      folderName = audioFileName[0];
    }

    return '${Configs.audioBaseUrl}${folderName}/${audioFileName}${Configs.audioFileExtension}';
  }
}
