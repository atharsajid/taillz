import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoWidget extends StatefulWidget {
  final String videoPath;
  final bool play;

  const FullScreenVideoWidget({Key key, @required this.videoPath, @required this.play}) : super(key: key);

  @override
  _FullScreenVideoWidgetState createState() => _FullScreenVideoWidgetState();
}

class _FullScreenVideoWidgetState extends State<FullScreenVideoWidget> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    super.initState();
    // _controller = VideoPlayerController.network(widget.url);
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });

    _controller.addListener(() {
      setState(() {});
    });

    if (widget.play) {
      _controller.play();
      _controller.setLooping(true);
    }
  }

  @override
  void didUpdateWidget(FullScreenVideoWidget oldWidget) {
    if (oldWidget.play != widget.play) {
      if (widget.play) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = _controller.value.size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        child: Container(width: size.width, height: size.height, child: VideoPlayer(_controller))),
                  ),
                  _FullScreenControls(
                    controller: _controller,
                    // model: widget.model,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class _FullScreenControls extends StatelessWidget {
  final VideoPlayerController controller;

  const _FullScreenControls({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Visibility(
          visible: controller.value.isPlaying,
          child: controller.value.isPlaying
              ? Positioned(
                  bottom: 0,
                  right: 4,
                  left: 0,
                  child: Container(
                    height: 35,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: controller.value != null
                                ? SliderTheme(
                                    data: SliderThemeData(
                                      thumbColor: Colors.blue,
                                      activeTrackColor: Colors.white,
                                    ),
                                    child: Slider(
                                      inactiveColor: Colors.white,
                                      onChanged: (v) {
                                        final position = v * controller.value.duration.inMilliseconds;
                                        controller.seekTo(Duration(milliseconds: position.round()));
                                      },
                                      value: (controller.value.duration != null)
                                          ? controller.value.position.inMilliseconds / controller.value.duration.inMilliseconds
                                          : 0.0,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              // controller.setVolume(0);
                              // print("volume: ${await VolumeControl.volume}");
                              // VolumeControl.setVolume(0);

                              controller.setVolume(controller.value.volume == 0 ? 1 : 0);
                            },
                            child: Icon(
                              controller.value.volume == 0 ? Icons.volume_off_outlined : Icons.volume_up_outlined,
                              color: Colors.white,
                            )),
                        /*Expanded(
                    child: Slider(
                        value: _val,
                        min: 0,
                        max: 1,
                        divisions: 100,
                        onChanged: (val) {
                          _val = val;
                          // setState(() {});
                          if (timer != null) {
                            timer?.cancel();
                          }

                          //use timer for the smoother sliding
                          timer = Timer(Duration(milliseconds: 200), () {
                            VolumeControl.setVolume(val);
                          });

                          print("val:$val");
                        }),
                  )*/
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
