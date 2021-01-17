import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:togumogu/src/models/fruit_model.dart';
import 'package:togumogu/src/screens/detailspage.dart';
import 'package:togumogu/src/widgets/app_slider.dart';
import 'package:togumogu/src/widgets/product_card.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> img = [];
  List<PaletteColor> colors;

  @override
  void initState() {
    super.initState();
    colors = [];
    createArray();
    _updatePalette();
    super.initState();

    _videoPlayerController =
        VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  void createArray() {
    for (var i = 0; i < fruitsData.length; i++) {
      img.add(fruitsData[i].image);
    }
  }

  void _updatePalette() async {
    for (String image in img) {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(AssetImage(image),
              size: Size(200, 100));
      colors.add(generator.lightMutedColor != null
          ? generator.lightMutedColor
          : PaletteColor(Colors.orange[200], 2));
    }

    setState(() {});
  }

  VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;

    var sliverToBoxAdapter = AppSlider(w: w);

    var appMenu = SliverToBoxAdapter(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          width: w * .8,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 1),
                    blurRadius: 2.0,
                    spreadRadius: 2.0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildMenuItem(w, h, Colors.blueAccent, "Shopping"),
                    buildMenuItem(w, h, Colors.tealAccent, "Parenting Guid"),
                    buildMenuItem(w, h, Colors.blue, "Camera"),
                    buildMenuItem(w, h, Colors.blueAccent, "Shopping")
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMenuItem(w, h, Colors.green, "Madicine"),
                  buildMenuItem(w, h, Colors.purpleAccent, "Places for Kids"),
                  buildMenuItem(w, h, Colors.redAccent, "Service"),
                  buildMenuItem(w, h, Colors.lightGreenAccent, "Medicine")
                ],
              )
            ],
          )),
    );
    // Main Screen...
    return Container(
      margin: EdgeInsets.all(10),
      child: CustomScrollView(
        slivers: [
          sliverToBoxAdapter,
          appMenu,
          SliverToBoxAdapter(
            child: Container(
              width: w,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: LatestNewsSliders(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sugested Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () => null),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: w * (1.45 + 1.5) * .49,
              width: w,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: new StaggeredGridView.countBuilder(
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                itemCount: fruitsData.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    //When user click the card
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                color: Colors.white,
                                fruitModel: fruitsData[i],
                              )));
                    },
                    child: card(fruitsData[i], i, colors, w, h),
                  );
                },
                staggeredTileBuilder: (i) {
                  return new StaggeredTile.count(1, i.isEven ? 1.5 : 1.45);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Material(
              elevation: 0,
              child: Center(
                child: FutureBuilder<bool>(
                  future: started(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.data == true) {
                      return AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      );
                    } else {
                      return const Text('waiting for video to load');
                    }
                  },
                ),
              ),
            ),
          ),
          sliverToBoxAdapter,
        ],
      ),
    );
  }

  Container buildMenuItem(double w, double h, Color color, String title) {
    return Container(
        height: h * .10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        spreadRadius: 2)
                  ]),
              child: CircleAvatar(
                backgroundColor: color,
                minRadius: w * .07,
                maxRadius: w * .07,
                child: Placeholder(
                  color: Colors.transparent,
                ),
              ),
            ),
            Container(
                width: w * .20,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: h * .012, fontWeight: FontWeight.w600),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                )),
          ],
        ));
  }
}

class AppSlider extends StatelessWidget {
  const AppSlider({
    Key key,
    @required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 100,
          width: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              elevation: 2,
              child: Placeholder(
                color: Colors.transparent,
              )),
        ),
      ),
    );
  }
}
