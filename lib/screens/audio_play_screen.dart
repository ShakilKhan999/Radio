import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:relaks_media/controller/home_controller.dart';
import 'package:relaks_media/controller/radio_controller.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;

  Duration position = Duration.zero;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  late final RecorderController recorderController;

  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        min: 0.0,
        // max: duration.inSeconds.toDouble(),
        max: 19,
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  @override
  void initState() {
    _initialiseControllers();

    // audioPlayer.onDurationChanged.listen((event) {
    //   setState(() {
    //     duration = event;
    //     log('duration: '+duration.toString());
    //   });
    // });
    du();
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
        log('position: ' + position.toString());
      });
    });

    super.initState();
  }

  Future<void> du() async {
    audioPlayer.setSourceUrl(
        'https://actions.google.com/sounds/v1/alarms/digital_watch_alarm_long.ogg');
    duration = (await audioPlayer.getDuration())!;
    log(duration.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: IconButton(
                        onPressed: () {
                          homeController.homestate.value = 0;
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0.sp),
                      child: Row(
                        children: [
                          Text(
                            'Audio',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Poppins'),
                          ),
                          IconButton(
                              onPressed: () {
                                homeController.liveRadio.value = 1;
                                homeController.homestate.value = 0;
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                                size: 30.sp,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      width: 60,
                    )
                  ],
                ),
                Image.asset(
                  'images/Rectangle 119.png',
                  width: MediaQuery.of(context).size.width - 100,
                ),
                Text(
                  'Kakababu Kindnap',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  'By Sagor Roy',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontFamily: 'Poppins'),
                ),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      position.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      duration.inSeconds.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ],
            ),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     AudioWaveforms(
            //         size: Size(MediaQuery.of(context).size.width / 2, 50),
            //         recorderController: recorderController),

            //   ],
            // ),

            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 70.h,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(95, 42, 40, 40),
                      Color.fromARGB(153, 217, 214, 214),
                      Color.fromARGB(153, 194, 191, 191),
                    ],
                  ),
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey),
                    child: Center(
                      child: const Text(
                        "10x",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: const Icon(
                      Icons.replay_10,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 50.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 35,
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 35,
                          color: Colors.white,
                        ),
                        iconSize: 50,
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            await audioPlayer.play(UrlSource(
                                'https://actions.google.com/sounds/v1/alarms/digital_watch_alarm_long.ogg'));
                            setState(() {
                              isPlaying = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: const Icon(
                      Icons.forward_10,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: const Icon(
                      Icons.file_download_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
