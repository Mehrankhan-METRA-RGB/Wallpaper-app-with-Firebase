import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mehran_wallpaper_app/colors.dart';
class DrawerLeft extends StatefulWidget {
  @override
  _DrawerLeftState createState() => _DrawerLeftState();
}

class _DrawerLeftState extends State<DrawerLeft> {
  ColorsOfApp colors= new ColorsOfApp();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,

      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(

              color: colors.yellow,
            ),
          ),
          Container(margin: EdgeInsets.only(top: 0),
height:MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(

              gradient: LinearGradient(
          colors: [colors.redOrange, colors.golden]),


    ),
            child: Column(children: [ ListTile(
              title: Text('Item 1'),

              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),],),
          )

        ],
      ),
    );
  }
}
