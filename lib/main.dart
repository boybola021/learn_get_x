import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_get_x/screen/shop_page/htpp_service.dart';
import 'app/app.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  await GetStorage.init();
  runApp(const App());
}
