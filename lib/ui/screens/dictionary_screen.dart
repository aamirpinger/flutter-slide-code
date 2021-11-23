import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/dictionary_services.dart';
import 'package:my_app/core/word.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  DictionaryService dictionaryService = DictionaryService();
  String searchingWord = '';

  void updateUI(String value) {
    setState(() {
      searchingWord = value;
    });
  }

  Future<void> getData() async {
    Word? response = await dictionaryService.getData(searchingWord);
    if (response != null) {
      print(response.word);
      print(response.meaning);
      print(response.audioUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            onChange: updateUI,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Icon(
                    Icons.near_me,
                    size: 32,
                  ),
                  onPress: () async {
                    print('fetching data');
                    await getData();
                    print('fetching data complete');
                  },
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.yellow,
          ),
          searchingWord.isNotEmpty
              ? Text(
                  '${AppStrings.searchingWord} $searchingWord',
                  style: Theme.of(context).textTheme.headline4,
                )
              : Container(),
        ],
      ),
    );
  }
}
