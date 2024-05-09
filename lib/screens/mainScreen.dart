import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_view_builder/screens/home3screen.dart';

import 'home2screen.dart';
import 'homeScreen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
    pageController.dispose();
  }
  PageController pageController=PageController(initialPage: 0);
  int activePage=0;
  Timer? timer;
  final  List<Widget>pages=[
    HomeScreen(),
    Home2Screen(),
    Home3Screen(),
  ];
  void startTimer(){
   timer= Timer.periodic(Duration(seconds: 3), (timer) {
      if(pageController.page==pages.length-1){
        pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
      else{
        pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  Widget build(BuildContext context) {


    return Scaffold(

      body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: pages.length,
                  onPageChanged: (value){
                    setState(() {
                      activePage=value;
                    });
                  },
                  itemBuilder: (context,index){
                    return pages[index];
                  }),

            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  List<Widget>.generate(pages.length, (index) => InkWell(
    onTap: (){
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor:  activePage==index? Colors.blue:Colors.grey,
                      ),
                    ),
                  ))
                  ,
                ),
              ),
            )
          ]
      ),
    );
  }
}
