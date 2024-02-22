import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learn_get_x/screen/home/vm_model/getX_localization.dart';
import 'package:learn_get_x/screen/home/pages/home_page.dart';
import 'package:learn_get_x/screen/shop_page/shop_page.dart';

import '../screen/getx_local_storage/login_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      title: "Todo App",
      locale: const Locale("en","US"),
      fallbackLocale: const Locale("en","US"),
      translations: KTLocalization(),
     // home: const HomePage(),
      home: const GetXStorageLearn(),
    );
  }
}
