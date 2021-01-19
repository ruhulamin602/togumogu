import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:togumogu/src/resources/icons/my_flutter_app_icons.dart';
import 'package:togumogu/src/widgets/home_screen.dart';
import 'package:togumogu/src/widgets/menu_list.dart';
import 'package:togumogu/src/widgets/product_list.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool _isSwitched = true;
int _selectedInd = 0;

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.blockSizeVertical;
    List<Widget> _listTabView = [
      Container(
        child: HomeScreen(),
        height: h * 3.2,
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
      Center(child: Icon(Icons.directions_transit)),
      Center(child: Icon(Icons.directions_bike)),
      Center(child: Icon(Icons.directions_car)),
      Center(child: Icon(Icons.directions_transit)),
      Center(child: Icon(Icons.directions_bike)),
      // Icon(Icons.directions_bike),
    ];

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(236, 239, 244, 1),
        body: Container(
          child: CustomScrollView(slivers: [
            buildAppBar(context),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: false,
              child: _listTabView[_selectedInd],
            ),
          ]),
        ),
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      primary: true,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/images/togumogu.png",
          isAntiAlias: false,
          width: MediaQuery.of(context).size.width * .23,
          fit: BoxFit.fill,
        ),
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
          margin: EdgeInsets.only(top: 8, bottom: 8, right: 20, left: 10),
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(width: 1, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(30)),
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
                padding: const EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue,
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
          labelPadding: EdgeInsets.symmetric(vertical: 0),
          // unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          onTap: (int) {
            setState(() {
              _selectedInd = int;
            });
          },
          tabs: [
            Tab(
                child: Icon(_selectedInd == 0
                    ? MyFlutterApp.home_onselect
                    : MyFlutterApp.home)),
            Tab(
                icon: Icon(_selectedInd == 1
                    ? MyFlutterApp.heart_onselect
                    : MyFlutterApp.heart)),
            Tab(
                icon: Icon(
              _selectedInd == 2
                  ? MyFlutterApp.locator_onseclect
                  : MyFlutterApp.locator,
              size: 30,
            )),
            Tab(
                icon: Icon(_selectedInd == 3
                    ? MyFlutterApp.shopping_cart_onselect
                    : MyFlutterApp.shopping_cart)),
            Tab(
              icon: Icon(_selectedInd == 4
                  ? MyFlutterApp.bell_onselect
                  : MyFlutterApp.bell),
            ),
            Tab(
                icon: Icon(_selectedInd == 5
                    ? MyFlutterApp.menu_onselect
                    : MyFlutterApp.menu)),
          ]),
    );
  }
}
