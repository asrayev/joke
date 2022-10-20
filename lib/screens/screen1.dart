import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke/model/Jokes.dart';
import 'package:joke/screens/jokepage.dart';
import 'package:joke/utils/Myfonts.dart';
import 'package:joke/utils/myimages.dart';
import 'package:lottie/lottie.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _screen1State extends State<screen1> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
     key: _scaffoldKey,

      endDrawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: ListView(
            children: [
            Center(child: Text("Settings", style:  Myfonts.Viga.copyWith(fontSize: 25, color: Color(0xFF3B280F)),)),
           SizedBox(height: 20.h,),
              Row(
             children: [
               SizedBox(width: 20.w,),
               Text("Language"),
               SizedBox(width: 20.w,),
               InkWell(
                 onTap: ((){
                   setState(() {
                     ForCount.tests[0].isSelected = !ForCount.tests[0].isSelected;
                     ForCount.tests[1].isSelected = false;
                     ForCount.tests[2].isSelected = false;

                   });
                 }),
                 child: Container(
                   height: 35.h,
                   width: 50.w,
                   decoration:  BoxDecoration(
                     color:  ForCount.tests[0].isSelected?  Colors.yellow : Colors.grey,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: Center(
                     child: Text("EN"),
                   ),
                 ),
               ),
               SizedBox(width: 10.w,),
               InkWell(
                 onTap: ((){
                   setState(() {
                     ForCount.tests[1].isSelected = !ForCount.tests[1].isSelected;
                     ForCount.tests[0].isSelected = false;
                     ForCount.tests[2].isSelected = false;

                   });
                 }),

                 child: Container(
                   height: 35.h,
                   width: 50.w,
                   decoration: BoxDecoration(
                       color:  ForCount.tests[1].isSelected?  Colors.yellow  : Colors.grey,
                       borderRadius: BorderRadius.circular(10.r)
                   ),
                   child: Center(
                     child: Text("DE"),
                   ),
                 ),
               ),
               SizedBox(width: 10.w,),
               InkWell(

                 onTap: ((){
                   setState(() {
                     ForCount.tests[2].isSelected = !ForCount.tests[2].isSelected;
                     ForCount.tests[1].isSelected = false;
                     ForCount.tests[0].isSelected = false;

                   });
                 }),
                 child: Container(
                   height: 35.h,
                   width: 50.w,
                   decoration: BoxDecoration(
                       color:  ForCount.tests[2].isSelected?  Colors.yellow  : Colors.grey,
                       borderRadius: BorderRadius.circular(10.r)
                   ),
                   child: Center(
                     child: Text("FR"),
                   ),
                 ),
               ),
             ],
           )


            ],
          ),
        ),

      ),
      backgroundColor: Colors.amber,

      body: SafeArea(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 20).r,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 160.w,),
                      Text("Jokes", style: Myfonts.bentonBold400.copyWith(color: Color(0xFF3B280F), fontSize: 40.h),),
                      SizedBox(width: 100.w,),
                      InkWell(
                          onTap: ((){
                            _scaffoldKey.currentState!.openEndDrawer();
                            // Scaffold.of(context).openEndDrawer();
                          }),

                          child: Image.asset(MyImages.settings, height: 40.h,width: 40.w,))

                    ],
                  ),
                  Text("  funny jokes", style: Myfonts.bentonBook400.copyWith(color: Colors.white, fontSize: 20.h),),
                  SizedBox(height: 40.h,),
                  Row(
                    children: [
                      SizedBox(width: 20.w,),
                      InkWell(
                        onTap: ((){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => jokepage(link: "https://v2.jokeapi.dev/joke/Programming?type=single${ForCount.tests[1].isSelected ? "&lang=de": ForCount.tests[1].isSelected ? "&lang=fr" : ""}&amount=50",)));
                        }),
                        child: Container(
                          height: 250.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white,
                            border: Border.all(color: Color(0xFF3B280F),width: 3.w)
                          ),
                     child: Column(
                         children: [
                           Lottie.asset("assets/images/programming.json"),
                           SizedBox(height: 18.h,),
                           Text("Programming", style: Myfonts.Viga.copyWith(fontSize: 24.h, color: Color(0xFF3B280F)),)
                         ],
                     ),

                        ),
                      ),//Programming
                      SizedBox(width: 20.w,),
                      InkWell(
                        onTap: ((){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> jokepage(link: 'https://v2.jokeapi.dev/joke/Any?type=single${ForCount.tests[1].isSelected ? "&lang=de": ForCount.tests[1].isSelected ? "&lang=fr" : ""}&blacklistFlags=nsfw,religious,racist,sexist,explicit&amount=50') ));

                        }),
                        child: Container(
                          height: 250.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white,
                              border: Border.all(color: Color(0xFF3B280F),width: 3.w)
                          ),
                          child: Column(
                            children: [
                              Lottie.asset("assets/images/politic.json"),
                              SizedBox(height: 18.h,),
                              Text("Political", style: Myfonts.Viga.copyWith(fontSize: 24.h, color: Color(0xFF3B280F)),)
                            ],
                          ),


                        ),
                      ) //Political
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}


//
// https://v2.jokeapi.dev/joke/Any?type=single&lang=de&blacklistFlags=nsfw,religious,racist,sexist,explicit&amount=50
// https://v2.jokeapi.dev/joke/Programming?type=single&lang=de&amount=50