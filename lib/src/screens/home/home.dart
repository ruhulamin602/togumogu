import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/widgets/home_screen.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool _isSwitched = true;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.blockSizeVertical;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            HomeScreen(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      title: Image.asset(
        "assets/images/togumogu.png",
        isAntiAlias: false,
        width: MediaQuery.of(context).size.width * .23,
        fit: BoxFit.fill,
      ),
      centerTitle: false,
      actions: [
        Switch(
            inactiveThumbImage: AssetImage('assets/images/en.png'),
            activeThumbImage: AssetImage("assets/images/bn.png"),
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            }),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey.shade200,
          child: IconButton(
            iconSize: 15,
            icon: Icon(Icons.search_rounded, color: Colors.black),
            onPressed: null,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(width: 1, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                "5",
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
      bottom: TabBar(
        labelColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(vertical: 20),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
        unselectedLabelColor: Colors.grey.shade500,
        tabs: [
          Icon(Icons.home),
          Icon(Icons.favorite_outline_sharp),
          Icon(Icons.location_on_sharp),
          Icon(Icons.card_travel_sharp),
          Icon(Icons.notification_important_sharp),
          Icon(Icons.menu),
        ],
      ),
    );
  }
}

