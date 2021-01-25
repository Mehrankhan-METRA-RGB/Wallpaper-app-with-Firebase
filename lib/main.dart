import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mehran_wallpaper_app/drawer.dart';

import 'package:wallpaper_manager/wallpaper_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wallpapers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WallpaperSow(),
    );
  }
}

class WallpaperSow extends StatefulWidget {
  @override
  _WallpaperSowState createState() => _WallpaperSowState();
}

class _WallpaperSowState extends State<WallpaperSow> {
  DocumentSnapshot ds;
  DocumentSnapshot mm;
  DocumentSnapshot sub;
  bool _isLiked = false;
  DrawerLeft drwr=new DrawerLeft();
  var HW;
  var catey = "GENERAL";
  // ignore: deprecated_member_use
var _db;
  Stream<String> progressString;
  String res;
 // List<String> ArrData=[];
  var yellow = Color(0xFFfed428);
  var black = Color(0xFF1a1f25);
  var purple = Color(0xFF900C3F);
  final List<String> categories = [
    "GENERAL",
    "PUBG",
    "GAMING",
    "IPHONE",
    "SAMSUNG",
    "NOKIA",
    "GIRLS",
    "CARS",
    "JETS",
    "CHEMISTRY",
    "JOKER",
    "SPORTS",
    "CARDS",
    "BUBBLES",
    "FIRE",
    "GUNS",
    "HACKER",
    "IT",
    "SMOKE",
    "PROGRAMMING",
  ];
  @override
  void initState() {
    super.initState();
    // if (_isLiked == true) {
    setState(() {
      _isLiked = _isLiked;
    });
    // }
  }


  @override
  Widget build(BuildContext context) {
    HW = MediaQuery.of(context).size;

    switch (catey.toString())
    {
      case "GENERAL":
         // ignore: deprecated_member_use
         _db = Firestore.instance.collection(categories[0]).snapshots();
        break;
      case "PUBG":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[1]).snapshots();
        break;

      case "GAMING":
         // ignore: deprecated_member_use
         _db = Firestore.instance.collection(categories[2]).snapshots();
        break;
      case "IPHONE":
         // ignore: deprecated_member_use
         _db = Firestore.instance.collection(categories[3]).snapshots();
        break;
      case "SAMSUNG":
         // ignore: deprecated_member_use
         _db = Firestore.instance.collection(categories[4]).snapshots();
        break;
      case "NOKIA":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[5]).snapshots();
        break;
      case "GIRLS":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[6]).snapshots();
        break;
      case "CARS":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[7]).snapshots();
        break;
      case "JETS":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[8]).snapshots();
        break;
      case "CHEMISTRY":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[9]).snapshots();
        break;
      case "JOKER":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[10]).snapshots();
        break;
      case "SPORTS":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[11]).snapshots();
        break;
      case "CARDS":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[12]).snapshots();
        break;
      case "BUBBLES":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[13]).snapshots();
        break;
      case "FIRE":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[14]).snapshots();
        break;
      case "GUNS":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[15]).snapshots();
        break;
      case "HACKER":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[16]).snapshots();
        break;
      case "IT":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[17]).snapshots();
        break;
      case "SMOKE":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[18]).snapshots();
        break;
      case "PROGRAMMING":
      // ignore: deprecated_member_use
        _db = Firestore.instance.collection(categories[19]).snapshots();
        break;
    }

    void setwallpaper(String screen ) async {
      String resulty;
      var file;
      String url = mm['url'].toString();
      // print("url   ::::$url");
      int location ;
      file = await DefaultCacheManager().getSingleFile(url);
      if(screen=="Home"){location = WallpaperManager.HOME_SCREEN
      ;}
      else
       if(screen=="Lock"){
         location = WallpaperManager.LOCK_SCREEN;
         // progressString =
        //     Wallpaper.ImageDownloadProgress(url);
        // resulty = await Wallpaper.homeScreen(options: RequestSizeOptions.RESIZE_EXACT);
        // print
        //   (progressString);
        // progressString.listen((data) {
        //   setState(() {
        //     res = data;});
        //
        // });
      }

        else {location = WallpaperManager.BOTH_SCREENS;}

       file = await DefaultCacheManager().getSingleFile(url);
       resulty =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print("Result  :::: $resulty");
      String _message = "$resulty on ${screen}screen";

      Fluttertoast.showToast(
          msg: _message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: yellow,
          textColor: black,
          fontSize: 16.0);
    }




    void openDialog() {
      Navigator.of(context).push(new MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return Container(
              height: HW.height,
              width: HW.width,
              alignment: Alignment.bottomCenter,
              color: black,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: mm['url'],
                    fit: BoxFit.fill,
                    width: HW.width,
                    height: HW.height,
                    errorWidget: (context, url, error) => new Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),


                  Container(

                    margin: EdgeInsets.only(
                        left: 30, right: 30, bottom: 30, top: 30),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          color: black,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Theme(
                                  data:
                                      ThemeData(splashColor: Colors.brown[800]),
                                  child: Material(
                                    elevation: 0,
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.wallpaper,
                                          color: yellow,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () {
                                        setwallpaper("Home");
                                      },
                                    ),
                                  ),
                                ),
                                Spacer(),

                                Theme(
                                  data: ThemeData(splashColor: Colors.red[800]),
                                  child: Material(
                                    elevation: 0,
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.screen_lock_portrait,
                                          color:yellow,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () {
                                        setwallpaper("Lock");

                                      },
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Theme(
                                  data: ThemeData(splashColor: Colors.red[800]),
                                  child: Material(
                                    elevation: 0,
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.multiple_stop,
                                          color:yellow,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () {
                                        setwallpaper("Both");

                                      },
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Theme(
                                  data:
                                      ThemeData(splashColor: Colors.brown[800]),
                                  child: Material(
                                    elevation: 0,
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.close,
                                          color: yellow,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        )),
                  ),
Positioned(top: HW.height*0.030,

    child: Container(
        color: Colors.black38,
     padding: EdgeInsets.symmetric(horizontal: 10,),
     // color: Color(0xFF9709f6),
      width: HW.width,
        height: 50,
        child: Row(
          children: [
           Text("8696",style: TextStyle(color: Colors.white54,fontSize: 18,),),
            Spacer(),
            Icon(Icons.favorite,color: Colors.red,size: 50,),
          ],
        )))

                ],
              ), //
            );
          },
          fullscreenDialog: true));
    }

    return Builder(
      builder: (context) {
        return Scaffold(
          drawer:drwr,
          appBar: AppBar(
            backgroundColor: black,
            elevation: 0,
            title:  Row(
              children: [
               // Icon(Icons.menu, color: Colors.white,),
                Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: black,
                        ),
                        child: Row(
                          children: [
                            Text(catey, style: TextStyle(fontSize: 20, color: yellow),),

                          ],
                        ),
                    ),

              ],
            ),

          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: black,
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(_db.toString());
                            print(categories[index].toString());
                            setState(() {catey=categories[index].toString().toUpperCase();});
                            //fy();
                          },
                          child: Container(
                            // width: HW.width * 0.2,

                            child: Card(
                              color: black,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child:
                                      Text(
                                        categories[index].toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18.0),
                                      ),

                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  color: black,
                  height: HW.height - 110,
                  child:  StreamBuilder<QuerySnapshot>(
                    stream: _db,
                    builder: (context, snapshot) {
                      // ignore: deprecated_member_use
                      var ss = snapshot.data.documents.length;


                      if (snapshot.hasData) {

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              child: GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      //1/2 has max... height than 6/2
                                      childAspectRatio: 2 / 3,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1),
                                  itemCount: ss,
                                  itemBuilder: (context, index) {
                                    // ignore: deprecated_member_use
                                    ds = snapshot.data.documents[index];

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // ignore: deprecated_member_use
                                            mm = snapshot.data.documents[index];
                                            openDialog();
                                            print(mm['url']);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            height: 180,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(7),

                                            ),
                                            child: ClipRRect(
                                              //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),

                                              borderRadius: BorderRadius
                                                  .circular(7),
                                              child: CachedNetworkImage(
                                                imageUrl: ds['url'],
                                                // imageUrl: ArrData[index],
                                                fit: BoxFit.fill,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                    downloadProgress) =>
                                                    LinearProgressIndicator(

                                                        semanticsValue: url,

                                                        backgroundColor: yellow,
                                                        value: downloadProgress
                                                            .progress
                                                    ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                new Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );

                                  }),
                            );




                      } else if (!snapshot.hasData) {
                        return Center(child: Text('Loading...'));
                      } else {
                        return CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
