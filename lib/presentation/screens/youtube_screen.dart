import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../data/models/meal.dart';

class YouTubeIframeItem extends StatefulWidget {
  static const routeArgs = '/youtube_items';

  YouTubeIframeItem({Key? key}) : super(key: key);

  @override
  State<YouTubeIframeItem> createState() => _YouTubeIframeItemState();
}

class _YouTubeIframeItemState extends State<YouTubeIframeItem>
    with SingleTickerProviderStateMixin {
  bool _setPosition = true;
  late YoutubePlayerController _controller;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animationController!.repeat();
    _controller = YoutubePlayerController(
      initialVideoId:
          BlocProvider.of<DummyMealsCubit>(context).refreshItem().videoId,
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    _controller.onExitFullscreen = () {};
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();

    Meal meal = BlocProvider.of<DummyMealsCubit>(context).refreshItem();

    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,

      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: player),
                  const SizedBox(
                    width: 500,
                    child: SingleChildScrollView(),
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  child: ListView(children: [
                    Stack(
                      children: [
                        player,
                        Positioned.fill(
                          child: YoutubeValueBuilder(
                            controller: _controller,
                            builder: (context, value) {
                              return AnimatedCrossFade(
                                firstChild: const SizedBox.shrink(),
                                secondChild: Material(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          YoutubePlayerController.getThumbnail(
                                            videoId: _controller.initialVideoId,
                                            quality: ThumbnailQuality.high,
                                          ),
                                        ),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                                crossFadeState: value.isReady
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 300),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onLongPress: () {
                          _controller.initialVideoId;
                        },
                        onPressed: () {
                          // _controller.nextVideo();
                          _controller.previousVideo();
                          // _controller.unMute();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          primary: Colors.indigo,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onLongPress: () {
                          _controller.initialVideoId;
                        },
                        onPressed: () {
                          // _controller.nextVideo();
                          !_setPosition
                              ? _controller.pause()
                              : _controller.play();
                          setState(() {
                            _setPosition = !_setPosition;
                          });
                          // _controller.unMute();
                        },
                        child: Icon(
                          _setPosition ? Icons.play_arrow : Icons.pause,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          primary: Colors.indigo,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onLongPress: () {
                          _controller.setPlaybackRate(1);
                        },
                        onPressed: () {
                          // _controller.nextVideo();
                          // _controller.unMute();
                          _controller.nextVideo();
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          primary: Colors.indigo,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    )),
                AnimatedBuilder(
                  animation: _animationController!.view,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationController!.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: GestureDetector(
                    onLongPress: () {
                      _animationController?.stop();
                    },
                    onTap: () {
                      _animationController?.reset();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(meal.imageUrl))),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    _animationController?.dispose();
    super.dispose();
  }
}
