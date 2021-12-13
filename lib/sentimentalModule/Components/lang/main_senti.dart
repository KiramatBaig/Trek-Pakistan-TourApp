import 'package:remove_emoji/remove_emoji.dart';
import 'package:flutter_auth/sentimentalModule/Components/lang/Emoji.dart';
import 'package:flutter_auth/sentimentalModule/Components/lang/English.dart';

/// Language code
enum LanguageCode { english}

/// Sentiment class
class Sentiment {

  List<String> filterText(String text, bool emoji) {
    List<String> duList =     emoji
        ? text
        .toLowerCase()
        .replaceAll('\n', ' ')
        .replaceAll('s\s+', ' ')
        .replaceAll(RegExp(r'[.,\/#!?$%\^&\*;:{}=_`\"~()]'), '')
        .trim()
        .split(' ')
        : text
        .toLowerCase()
        .replaceAll('\n', ' ')
        .replaceAll('s\s+', ' ')
        .replaceAll(RegExp(r'[.,\/#!?$%\^&\*;:{}=_`\"~()]'), '')
        .removemoji
        .trim()
        .split(' ');

    Set<String> duSet ={};
    for (var element in duList) {
      duSet.add(element);
    }

    List<String> analysedList = [];
    for (var element in duSet) {
      analysedList.add(element);
    }

    return analysedList;
  }
  ///for array return use Map<String, dynamic>
  Map<String, dynamic> analysis(String text,
      {bool emoji = false, LanguageCode languageCode = LanguageCode.english}) {
    try {
      if (text.isEmpty) throw ('err');
      Map<dynamic, int> sentiments = {};
      if (emoji) sentiments.addAll(emojis);

      switch (languageCode) {

      /// english
        case LanguageCode.english:
          sentiments.addAll(en);
          break;

        default:
          throw ('err');
      }

      var score = 0;
      var goodwords = [], badwords = [];
      var wordlist = filterText(text, emoji);
      for (var i = 0; i < wordlist.length; i++) {
        sentiments.forEach((key, value) {
          if (key == wordlist[i]) {
            score += value;
            if (value < 0) {
              badwords.add([key, value]);
            } else {
              goodwords.add([key, value]);
            }
          }
        });
      }
      var result = {
        'score': score,
        'comparative': wordlist.isNotEmpty ? score / wordlist.length : 0,
        'tokens': wordlist,
        'positive': goodwords,
        'negative': badwords
      };
      return result;

    } catch (e) {
      throw Exception(e);
    }
  }
}
