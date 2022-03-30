import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../bussines_logic/cubits/cart_dart_cubit.dart';
import '../../data/models/meal.dart';
class YouTubeItem extends StatefulWidget {





  @override
  State<YouTubeItem> createState() => _YouTubeItemState();
}

class _YouTubeItemState extends State<YouTubeItem> {
  late YoutubePlayerController _controller;
  bool _setPosition=false;





    @override
    Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();

    Meal meal = BlocProvider.of<DummyMealsCubit>(context).refreshItem();
    @override
    void initState() {
      super.initState();
      _controller = YoutubePlayerController(
        initialVideoId: meal.videoId,
        params: const YoutubePlayerParams(

          startAt: const Duration(minutes: 1, seconds: 36),
          showControls: true,
          showFullscreenButton: true,
          desktopMode: false,
          privacyEnhanced: true,
          useHybridComposition: true,
        ),
      );
      _controller.onEnterFullscreen = () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      };
      _controller.onExitFullscreen = () {};
    }

      return Column(
        children: <Widget>[
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height * .3,
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
                                      videoId:
                                      _controller.initialVideoId,
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
          SizedBox(height: 10,),
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
                    !_setPosition ? _controller.pause() : _controller.play();
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
          )
        ],
      );
    }
  }
