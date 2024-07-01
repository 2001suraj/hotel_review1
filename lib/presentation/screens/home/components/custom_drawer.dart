// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_app/data/local_storage/share_preference.dart';
import 'package:review_app/presentation/screens/profile/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/signup.png'),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: FutureBuilder(
                        future: LocalStorage().readdata(),
                        builder: (context, snapshot) {
                          return Text(snapshot.data.toString());
                        }),
                  )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
