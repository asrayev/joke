import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke/screens/screen1.dart';
import 'package:joke/utils/myimages.dart';
import 'package:lottie/lottie.dart';

class screen0 extends StatefulWidget {
  const screen0({super.key});

  @override
  State<screen0> createState() => _screen0State();
}

class _screen0State extends State<screen0> {

  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage(){
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>screen1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/first1.png"),
            fit: BoxFit.cover),
      ),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 401.h,),
            Lottie.asset("assets/images/first2.json"),
          ],
        ),
      ),

    );
  }
}
