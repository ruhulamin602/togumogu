import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:palette_generator/palette_generator.dart';

import 'package:togumogu/src/models/fruit_model.dart';
import 'package:togumogu/src/widgets/app_slider.dart';
import 'package:togumogu/src/widgets/article_card.dart';
import 'package:togumogu/src/widgets/menu_list.dart';
import 'package:togumogu/src/widgets/place_card.dart';
import 'package:togumogu/src/widgets/product_list.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';
import 'package:togumogu/src/widgets/traker.dart';

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

    _videoPlayerController = VideoPlayerController.network(
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
    await _videoPlayerController.pause();
    startedPlaying = false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;

    var sliverToBoxAdapter = Tracker(w: w, h: h);
    // final _itemExtent = 150.0;
    // final generatedList = List.generate(
    //     3, (index) => articleCard(fruitsData[index], index, colors, w, h));

    var appMenu = buildSliverToBoxAdapterForMenuList(w, h);
    // Main Screen...
    return Container(
      height: 3.5*h,
              child: Column(
        children: [
          sliverToBoxAdapter,
          appMenu,

          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 2,
                      spreadRadius: 1)
                ]),
            width: w,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: AppSlider(),
          ),
          buildSliverToBoxAdapterForTitle0(),
          buildSliverToBoxAdapterForProducts(w, h),
          GestureDetector(
            onTap: () {
              if (startedPlaying) {
                _videoPlayerController.pause();
                setState(() {
                  startedPlaying = !startedPlaying;
                });
              } else {
                _videoPlayerController.play();
              }
            },
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
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
                      return Container(
                          child: const Text('waiting for video to load'));
                    }
                  },
                ),
              ),
            ),
          ),
          buildSliverToBoxAdapterForTitle("Featured Articles"),
          Container(height: h*.64,child: buildSliverFixedExtentListOfArticles(h, w, 3)),
          buildSliverToBoxAdapterForTitle("Suggested Places"),
           Container(height: h*.8,child: buildSliverFixedExtentListOfPlaces(h, w, 3)),
        ],
      ),
    );
  }

  Container buildSliverToBoxAdapterForTitle0() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Suggested Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Spacer(),
          IconButton(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              icon: Icon(Icons.arrow_forward),
              onPressed: () => null),
        ],
      ),
    );
  }

  Container buildSliverToBoxAdapterForTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Spacer(),
          IconButton(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              icon: Icon(Icons.arrow_forward),
              onPressed: () => null),
        ],
      ),
    );
  }
}
