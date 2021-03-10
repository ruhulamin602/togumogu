import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:togumogu/src/repository/authentication_repository.dart';
import 'package:togumogu/src/routes/router.gr.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:togumogu/src/widgets/menu_list.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
   String _userId= Provider.of<AuthenticationRepository>(context).getUserId;
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: h * .152,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ! Md. Ruhul $_userId',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View your profile',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text("5 stars"),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(right: 30),
                      child: CircleAvatar(
                        radius: h * .025,
                        backgroundColor: Colors.grey.shade200,
                        child: Container(
                          height: h * .025,
                          child: Image.asset(
                            "assets/images/edit.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // child: ListTile(
              //   title: Text('Hi ! Md. Ruhul'),
              //   subtitle: Text('View your profile'),
              //   trailing: CircleAvatar(
              //       child: Icon(Icons.arrow_forward_ios_rounded)),
              // ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: w * .85,
            child: Text("Tools",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          MenuItems(
            w: w,
            h: h,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: w * .85,
            child: Text("Options",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          // Option Area
          Container(
            height: h * .35,
            width: w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Flexible(
                            flex: 8,
                            child: OptionCard(
                              title: "Tracker Setting",
                              widget: Image.asset("assets/images/baby-boy.png"),
                            )),
                        Flexible(
                            flex: 4,
                            child: OptionCard(
                                title: "About us",
                                widget: Image.asset(
                                    "assets/images/information.png"))),
                        Flexible(
                            flex: 4,
                            child: OptionCard(
                              title: "Privacy Policy",
                              widget: Image.asset("assets/images/privacy.png"),
                            )),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Flexible(
                            flex: 4,
                            child: OptionCard(
                              title: "Order History",
                              widget: Image.asset(
                                  "assets/images/shopping-cart.png"),
                            )),
                        Flexible(
                          flex: 4,
                          child: OptionCard(
                            title: "Help Desk",
                            widget: Image.asset("assets/images/info.png"),
                          ),
                        ),
                        Flexible(
                            flex: 4,
                            child: OptionCard(
                              title: "Setting",
                              widget: Image.asset("assets/images/settings.png"),
                            )),
                        Flexible(
                            flex: 3,
                            child: OptionCard(
                              ontap: () async {
                                await Provider.of<AuthenticationRepository>(
                                        context,
                                        listen: false)
                                    .logout();
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.welcomeScreen,
                                    ModalRoute.withName(Routes.welcomeScreen));
                                print("logged out");
                              },
                              color: Colors.redAccent,
                              title: "Logout",
                              widget: Icon(
                                Icons.logout,
                                size: 14,
                                color: Colors.red,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50,)
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final Widget widget;
  final String title;
  final String url;
  final Color color;
  final Function ontap;
  const OptionCard({
    Key key,
    this.widget,
    this.title,
    this.url,
    this.color,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(left: 0),
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 2,
                  color: Colors.grey.shade300.withOpacity(.6))
            ]),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 0),
                child: widget ??
                    Icon(
                      Icons.developer_mode,
                      color: color ?? Colors.black,
                      size: 14,
                    ),
              ),
              Container(
                child: Text(title ?? "Title ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: color ?? Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
