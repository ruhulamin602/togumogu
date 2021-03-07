import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/appbar/language_toggle.dart';
import 'package:togumogu/src/bloc/appbar/tabbar_index_change.dart';
import 'package:togumogu/src/resources/icons/my_flutter_app_icons.dart';
import 'package:togumogu/src/screens/setting_screen.dart';
import 'package:togumogu/src/screens/shopping_screen.dart';
import 'package:togumogu/src/widgets/home_screen.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// int _selectedInd = 0;

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    // BlocProvider.of<TabbarBloc>(context).setSecondIndex;
    // BlocProvider.of<TabbarBloc>(context, listen: true).setFirstIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;
    int _selSecIndex =
        BlocProvider.of<TabbarBloc>(context, listen: true).setSecondIndex;
    
    int _selFirstInd =
        BlocProvider.of<TabbarBloc>(context,listen: true).setFirstIndex;
    List<List<Widget>> _listTabView = [
      [
        Container(
          child: HomeScreen(),
          // height: h * 3.9,
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        Container(
          child: ShoppingScreen(),
          // height: h * 3.9,
          padding: EdgeInsets.symmetric(horizontal: 0),
        ),
      ],
      [
        Center(child: Icon(Icons.directions_transit)),
      ],
      [
        Center(child: Icon(Icons.directions_bike)),
      ],
      [
        Center(child: Icon(Icons.directions_car)),
      ],
      [
        Center(child: Icon(Icons.directions_transit)),
      ],
      [
        Center(child: SettingScreen()),
        Container(
          child: ShoppingScreen(),
          // height: h * 3.9,
          padding: EdgeInsets.symmetric(horizontal: 0),
        ),

      ]
      // Icon(Icons.directions_bike),
    ];
    print(BlocProvider.of<TabbarBloc>(context).setFirstIndex);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(236, 239, 244, 1),
        body: Container(
          child: CustomScrollView(slivers: [
            MyAppBar(),
            SliverToBoxAdapter(
                // hasScrollBody: false,
                // fillOverscroll: false,
                child: _listTabView[_selFirstInd][_selSecIndex]),
          ]),
        ),
      ),
    );
  }

  // void setTabIndex(int ind) {
  //   setState(() {
  //     _selectedInd = ind;
  //   });
  // }

  // void _isSwitchedFn(bool value) {
  //   setState(() {
  //     _isSwitched = value;
  //   });
  // }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabbarBloc, List<int>>(
      builder: (_, index) {
        print(index);
        return SliverAppBar(
          // backwardsCompatibility: false,
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
          snap: true,
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
            BlocBuilder<LanguageBloc, bool>(
              builder: (_, value) {
                return Switch(
                  activeColor: Color.fromRGBO(115, 115, 214, .8),
                  activeTrackColor: Colors.grey.shade300,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Color.fromRGBO(102, 101, 208, .8),
                  inactiveThumbImage: AssetImage(
                    'assets/images/bn3.png',
                  ),
                  activeThumbImage: AssetImage("assets/images/en3.png"),
                  value: value,
                  onChanged: (val) {
                    BlocProvider.of<LanguageBloc>(context)
                        .add(LanguageEvent.change);
                    print(value);
                  },
                );
              },
            ),
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
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.bold),
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
              onTap: (int ind) {
                BlocProvider.of<TabbarBloc>(context).getfirstIndex(ind);
                BlocProvider.of<TabbarBloc>(context).getSecondIndex(0);
                BlocProvider.of<TabbarBloc>(context).add(TabbarEvent.onTap);
                // ind==0? Navigator.of(context).pushReplacementNamed("/my-home-page"):Container();
              },
              tabs: [
                Tab(
                    child: Icon(index[0] == 0
                        ? MyFlutterApp.home_onselect
                        : MyFlutterApp.home)),
                Tab(
                    icon: Icon(index[0] == 1
                        ? MyFlutterApp.heart_onselect
                        : MyFlutterApp.heart)),
                Tab(
                    icon: Icon(
                  index[0] == 2 ? MyFlutterApp.home_1 : MyFlutterApp.home_2,
                )),
                Tab(
                    icon: Icon(index[0] == 3
                        ? MyFlutterApp.shopping_cart_onselect
                        : MyFlutterApp.shopping_cart)),
                Tab(
                  icon: Icon(index[0] == 4
                      ? MyFlutterApp.bell_onselect
                      : MyFlutterApp.bell),
                ),
                Tab(
                    icon: Icon(index[0] == 5
                        ? MyFlutterApp.menu_onselect
                        : MyFlutterApp.menu)),
              ]),
        );
      },
    );
  }
}
