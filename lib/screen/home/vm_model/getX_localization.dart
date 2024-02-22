

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocalizationGetXController extends GetxController{
  void changeLanguage(var param1,var param2){
    var locale = Locale(param1,param2);
    debugPrint("Ishladi changeLanguage");
    Get.updateLocale(locale);
  }
}


class KTLocalization extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": {
     "todo" : "Todo",
    },
     "ru_RU": {
     "todo" : "Примечание",
    },
     "uz_UZ": {
     "todo" : "Eslatma",
    },
  };
}

enum CategoryEnum {
  english("English"),
  rus("Russia"),
  uzbek("Uzbek");

  const CategoryEnum(this.text);

  final String text;
}