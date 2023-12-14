import 'package:database_crud_revision/views/screens/addToContact.dart';
import 'package:database_crud_revision/views/screens/home_page.dart';
import 'package:database_crud_revision/views/screens/splashscreen.dart';
import 'package:database_crud_revision/views/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controllers/contact_controller.dart';
import 'helper/contact_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.dbHelper.init_DB();
  ContactsController contact_controller = Get.put(
    ContactsController(),
  );
  contact_controller.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.splashscreen,
      routes: {
        MyRoutes.homepage: (context) => HomePage(),
        MyRoutes.splashscreen: (context) => SplashScreen(),
        MyRoutes.addToContact: (context) => AddToContact(),
      },
    );
  }
}
