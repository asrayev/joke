import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:joke/model/Jokes.dart';
import 'package:joke/model/Programming.dart';
import 'package:http/http.dart' as http;
import 'package:joke/screens/screen1.dart';
import 'package:joke/utils/Myfonts.dart';
import 'package:joke/utils/myimages.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class jokepage extends StatefulWidget {
  final link;
  const jokepage({Key? key,required this.link}) : super(key: key);

  @override
  State<jokepage> createState() => _jokepageState();
}

class _jokepageState extends State<jokepage> {


  Future<Programing?> getData() async {
    String url = widget.link;
    // https://v2.jokeapi.dev/joke/Any?type=single?blacklistFlags=nsfw,religious,racist,sexist,explicit&amount=50
    // https://v2.jokeapi.dev/joke/Programming?type=single&amount=50
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body) as Map<String, dynamic>;
      return Programing.fromJson(json);
    }
    return null;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Programing?>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<Programing?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        SizedBox(width: 20.w,),
                        Image.asset(MyImages.lefttop, height: 40.h, width: 40.w,),
                        SizedBox(width: 305.w,),
                        Image.asset(MyImages.share, height: 40.h, width: 40.w,),
                      ],
                    ), // tepa
                    SizedBox(height: 90.h,),
                    Container(
                      width: 380.w,
                      height: 500.h,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(color: Color(0xFF241a05), width: 3.w),
                          color: Colors.white
                      ),

                      child: Column(
                        children: [
                          Image.asset(MyImages.joke, height: 70.h, width: 70.w,),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20).r,
                            child: Lottie.asset("assets/images/waiting.json"),)
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    Row(
                      children: [
                        SizedBox(width: 150.w,),
                     Image.asset(MyImages.left, height: 50.h, width: 50.w,),
                        SizedBox(width: 20.w,),
                       Image.asset(MyImages.right, height: 50.h, width: 50.w,)
                      ],
                    ), // tepa
                  ],
                ),













                // child: Center(
                //   child: Text(users?.jokes?[0].joke??""),
                // ),

              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            Programing? users = snapshot.data;
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow
                ),
                 child: Column(
                   children: [
                     SizedBox(height: 20.h,),
                     Row(
                       children: [
                         SizedBox(width: 20.w,),
                         InkWell(
                           onTap: ((){
                             Navigator.push(
                                 context, MaterialPageRoute(builder: (context) => screen1()));

                           }),
                             child: Image.asset(MyImages.lefttop, height: 40.h, width: 40.w,)),
                         SizedBox(width: 305.w,),
                         InkWell(
                             onTap: ((){
                             Share.share(users?.jokes?[ForCount.tests[0].count].joke??"");

                             }),

                             child: Image.asset(MyImages.share, height: 40.h, width: 40.w,)),
                       ],
                     ), // tepa
                     SizedBox(height: 90.h,),
                     Container(
                       width: 380.w,
                       height: 500.h,

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(25.r),
                         border: Border.all(color: Color(0xFF241a05), width: 3.w),
                         color: Colors.white
                       ),

                       child: Column(
                         children: [
                           Image.asset(MyImages.joke, height: 70.h, width: 70.w,),
                           Container(
                               padding: EdgeInsets.only(left: 20, right: 20).r,
                               child: Text(users?.jokes?[ForCount.tests[0].count].joke??"", style: Myfonts.Viga.copyWith(color: Color(0xFF241a05))),)
                         ],
                       ),
                     ),
                     SizedBox(height: 40.h,),
                     Row(
                       children: [
                         SizedBox(width: 150.w,),
                         InkWell(
                             onTap: ((){
                               setState(() {
                                 ForCount.tests[0].count == 0 ? ForCount.tests[0].count = 6 : ForCount.tests[0].count -= 1;
                               });
                             }),


                             child: Image.asset(MyImages.left, height: 50.h, width: 50.w,)),
                         SizedBox(width: 20.w,),
                         InkWell(
                             onTap: ((){
                               setState(() {
                                 ForCount.tests[0].count == 6 ? ForCount.tests[0].count = 0 : ForCount.tests[0].count += 1;
                               });
                             }),

                             child: Image.asset(MyImages.right, height: 50.h, width: 50.w,)),
                       ],
                     ), // tepa
                   ],
                 ),













                // child: Center(
                //   child: Text(users?.jokes?[0].joke??""),
                // ),

              ),
            );
          }
          return Container();
        },

      ),
    );
  }
}
