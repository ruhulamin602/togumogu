import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/appbar/language_toggle.dart';
import 'package:togumogu/src/bloc/appbar/tabbar_index_change.dart';
import 'package:togumogu/src/resources/icons/my_flutter_app_icons.dart';



  AppBar buildAppBar(BuildContext context) {
    return AppBar(
    // backwardsCompatibility: false,
    // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),

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
    // bottom: TabBar(
    //     labelColor: Colors.black,
    //     labelPadding: EdgeInsets.symmetric(vertical: 0),
    //     // unselectedLabelColor: Colors.grey.shade500,
    //     indicatorColor: Colors.white,
    //     indicatorSize: TabBarIndicatorSize.label,
    //     onTap: (int ind) {
    //       BlocProvider.of<TabbarBloc>(context).getIndex(ind);
    //       BlocProvider.of<TabbarBloc>(context).add(TabbarEvent.onTap);
    //       // ind==0? Navigator.of(context).pushReplacementNamed("/my-home-page"):Container();
    //     },
    //     tabs: [
    //       Tab(
    //           child: Icon(index == 0
    //               ? MyFlutterApp.home_onselect
    //               : MyFlutterApp.home)),
    //       Tab(
    //           icon: Icon(index == 1
    //               ? MyFlutterApp.heart_onselect
    //               : MyFlutterApp.heart)),
    //       Tab(
    //           icon: Icon(
    //         index == 2 ? MyFlutterApp.home_1 : MyFlutterApp.home_2,
    //       )),
    //       Tab(
    //           icon: Icon(index == 3
    //               ? MyFlutterApp.shopping_cart_onselect
    //               : MyFlutterApp.shopping_cart)),
    //       Tab(
    //         icon: Icon(index == 4
    //             ? MyFlutterApp.bell_onselect
    //             : MyFlutterApp.bell),
    //       ),
    //       Tab(
    //           icon: Icon(index == 5
    //               ? MyFlutterApp.menu_onselect
    //               : MyFlutterApp.menu)),
    //     ]),
  );
  }

