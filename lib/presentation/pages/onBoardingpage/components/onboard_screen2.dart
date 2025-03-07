// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class OnBoardScreen2 extends StatelessWidget {
  const OnBoardScreen2({Key? key, required this.animationController}) : super(key: key);
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final animation1 = Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset(
          0,
          0,
        )).animate(CurvedAnimation(parent: animationController, curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final animation2 = Tween<Offset>(
        begin: Offset(0, 0),
        end: Offset(
          -1,
          0,
        )).animate(CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    final title1Animation1 = Tween<Offset>(
        begin: Offset(2, 0),
        end: Offset(
          0,
          0,
        )).animate(CurvedAnimation(parent: animationController, curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final title2Animation2 = Tween<Offset>(
        begin: Offset(0, 0),
        end: Offset(
          -2,
          0,
        )).animate(CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    final image1Animation1 = Tween<Offset>(
        begin: Offset(4, 0),
        end: Offset(
          0,
          0,
        )).animate(CurvedAnimation(parent: animationController, curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final image2Animation2 = Tween<Offset>(
        begin: Offset(0, 0),
        end: Offset(
          -4,
          0,
        )).animate(CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));

    return SlideTransition(
      position: animation1,
      child: SlideTransition(
        position: animation2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            //title
            SlideTransition(
              position: title1Animation1,
              child: SlideTransition(
                position: title2Animation2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Get You Hotel Now',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),

            //image
            SlideTransition(
              position: image1Animation1,
              child: SlideTransition(
                position: image2Animation2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('assets/images/hotel2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

//des
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  'Find you hotel of your choice and get it right now',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
