import 'package:flutter/material.dart';
import 'package:gym2/view/Home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GYM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(22, 178, 66, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(238, 238, 238, .45)),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          button:TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ) ,
      initialRoute: '/',
      routes: {
        '/':(ctx)=>MyHomePage(),

      },
    );
  }
}

