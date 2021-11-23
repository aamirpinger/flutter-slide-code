import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/dictionary_services.dart';
import 'package:my_app/core/word.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';
import 'package:my_app/ui/widgets/meaning_card.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  DictionaryService dictionaryService = DictionaryService();
  String searchingWord = '';
  Word? word;

  void updateUI(String value) {
    setState(() {
      searchingWord = value;
      word = null;
    });
  }

  Future<void> getData() async {
    if (searchingWord.isEmpty) {
      return;
    }

    Word? response = await dictionaryService.getData(searchingWord);
    if (response != null) {
      setState(() {
        searchingWord = '';
        word = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: false,
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
                    await getData();
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
          word != null ? MeaningCard(word!) : Container(),
        ],
      ),
    );
  }
}
