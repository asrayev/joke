import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke/screens/jokepage.dart';
import 'package:joke/screens/screen0.dart';
import 'package:joke/screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    // print(height);
    // print(width);

    return ScreenUtilInit(
      designSize: const Size(420,920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext contex, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: screen0(),
        );
      },
    );
  }
}
