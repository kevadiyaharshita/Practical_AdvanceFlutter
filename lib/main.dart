import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/controller/Recipe_Controller.dart';
import 'package:practical_advanceflutter/utils/MyRoutes.dart';
import 'package:practical_advanceflutter/views/screens/home_page.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(create: (context) => RecipeController(),
    child: MyApp(),),

  );
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
      },
    );
  }
}
