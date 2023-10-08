import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/provider/AttendanceProvider.dart';
import 'package:gym2/provider/LoseWeightProvider.dart';
import 'package:gym2/provider/NewPersonProvider.dart';
import 'package:gym2/provider/OverWeightProvider.dart';
import 'package:gym2/provider/searchProvider.dart';
import 'package:gym2/view/screens/AddPerson.dart';
import 'package:gym2/view/screens/Daily.dart';
import 'package:gym2/view/screens/Home.dart';
import 'package:gym2/view/screens/searchScreen.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io';

import 'model/db.dart';

//0>>  تخسيس
//0 >> payed
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (Platform.isWindows || Platform.isMacOS) {
   await WindowManager.instance.setMinimumSize(const Size(500, 400));
    await WindowManager.instance.setMaximumSize(const Size(500, 650));
  }
  await DBHelper.initDb();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        ChangeNotifierProvider(create: (_) => NewPersonProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => LosingProvider()),
        ChangeNotifierProvider(create: (_) => OveringProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'جيم',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: const Color.fromRGBO(22, 178, 66, 1),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: const Color.fromRGBO(238, 238, 238, .45)),
              textTheme:  TextTheme(
                headline1: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
                headline2: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
                button: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (ctx) => const MyHomePage(),
              DailyPage.routeName: (ctx) => DailyPage(),
              SearchScreen.routeName: (ctx) => SearchScreen(),
              AddPerson.routeName: (ctx) => AddPerson(),
            },
          );
        });
  }
}
