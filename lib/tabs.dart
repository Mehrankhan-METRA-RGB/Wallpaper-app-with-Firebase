import 'package:flutter/material.dart';

class HideAppBarScroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HideAppBarScrollState();
  }
}

class _HideAppBarScrollState extends State<HideAppBarScroll>
    with TickerProviderStateMixin {
  //add with TickerProviderStateMixin at the end of  state declaration
  TabController tabController; //controller for tab

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
    //set tabcontroller with lengther
    //vsync:this will show error if you do not add with TickerProviderStateMixin above

    tabController.addListener(() {
      //listiner for tab events
      if (tabController.indexIsChanging) {
        //if tab is changed
        int tabindex = tabController.index;
        print("Current Tab is $tabindex");
        //or you can use driectrly
        //print("Current Tab is ${tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose(); //destroy tabcontroller to release memory
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool isscrolled) {
              return <Widget>[
                SliverAppBar(
                  title: new Text("TABBAR"),
                  backgroundColor: Colors.deepOrangeAccent,
                  pinned: true,
                  floating: true,
                  forceElevated: isscrolled,
                  leading: Icon(Icons.menu),
                  actions: <Widget>[
                    //button list at right side of appbar
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          //action for this button
                        }),

                    IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          //action for this button
                        })
                  ],

                  //set bottom if you want to add tabbar
                  bottom: new TabBar(
                    tabs: <Tab>[
                      new Tab(text: "PLACES TO VISIT"),
                      new Tab(text: "NAMES oF GUIDE"),
                    ],
                    controller: tabController,
                  ),
                ),
              ];
            },
            body: TabBarView(
                //set TabBarView  if you have added Tabbar at bottom of Appbar
                controller: tabController,
                children: <Widget>[
                  //place widget aranged like tab in tabbar

                  SingleChildScrollView(
                      //list of palces to visit
                      child: Column(
                    children: <Widget>[
                      democard("A"),
                      democard("B"),
                      democard("C"),
                      democard("D"),
                      democard("E"),
                    ],
                  )),

                  SingleChildScrollView(
                      //list of names of guides
                      child: Column(
                    children: <Widget>[
                      democard("A"),
                      democard("B"),
                      democard("C"),
                      democard("D"),
                      democard("E"),
                    ],
                  )),
                ])));
  }

  //widget to show name in card
  Widget democard(title) {
    return Card(
        child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
