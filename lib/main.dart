import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/controller/Youtube_Controller.dart';
import 'package:practical_advanceflutter/utils/MyRoutes.dart';
import 'package:practical_advanceflutter/views/screens/home_page.dart';
import 'package:practical_advanceflutter/views/screens/search_screen.dart';
import 'package:provider/provider.dart';

import 'controller/YoutubePlayerController.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => YoutubeController()),
      ChangeNotifierProvider(create: (context) => YoutubeVideoController()),
    ],
    child: MyApp(),
  ));
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
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.searchPage: (context) => SearchPage()
      },
    );
  }
}
