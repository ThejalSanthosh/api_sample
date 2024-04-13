import 'package:api_sample/controller/homescreencontroller.dart';
import 'package:api_sample/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}