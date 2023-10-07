import 'package:flutter/material.dart';
import 'package:practical_advanceflutter/controller/Recipe_Controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: Consumer<RecipeController>(builder: (context, p, _) {
          return Column(
            children: (p.rm != null)
                ? List.generate(p.rm!.ingredients.length,
                    (index) => Text(p.rm!.ingredients[index]))
                : [CircularProgressIndicator()],
          );
        }),
      ),
    );
  }
}
