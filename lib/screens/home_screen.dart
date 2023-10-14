import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/screens/job/view/career_screen.dart';
import 'package:relaks_media/screens/downlode_screen.dart';
import 'package:relaks_media/screens/live_radio_screen.dart';
import 'package:relaks_media/screens/others_services_screen.dart';
import 'package:relaks_media/utils/glass_box.dart';
import 'package:relaks_media/utils/payment_way.dart';
import 'package:relaks_media/utils/relaks_premium.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/home_controller.dart';
import '../models/upcoming_show_model.dart';
import '../provider/home_page_provider.dart';
import '../utils/carousel_slider.dart';
import 'audio_play_screen.dart';
import 'fund_raising_screen].dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final List<String> images = [
    'images/image1.png',
    'images/image1.png',
    'images/image1.png',
  ];

  final List<String> imageList = [
    'images/Rectangle 119.png',
    'images/Rectangle 120.png',
    'images/Rectangle 121.png',
    'images/Rectangle 122.png',
  ];
  final List<String> buttonList = [
    'Suspense',
    'Romance',
    'System',
    'Fantasy',
    'Drama',
    'Drama',
    'Drama',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());
    homeController.getUserSubscribedAudio();
    final AudioPlayer _audioPlayer = AudioPlayer();
    return Obx(
      () => homeController.homestate.value == 1
          ? NewsScreen()
          : homeController.homestate.value == 4
              ? FundRaisingScreen()
              : homeController.homestate.value == 6
                  ? OtherServicesScreen()
                  : homeController.homestate.value == 5
                      ? CareerScreen()
                      : homeController.homestate.value == 7
                          ? DownloadScreen()
                          : homeController.homestate.value == 8
                              ? LiveRadioScreen()
                              : homeController.homestate.value == 9
                                  ? AudioPlayerScreen()
                                  : homeController.homestate.value == 0
                                      ? Scaffold(
                                          floatingActionButton:
                                              homeController.liveRadio.value ==
                                                      1
                                                  ? Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              30,
                                                      child: GlassBox(
                                                        radius: 15.0,
                                                        child:
                                                            FloatingActionButton
                                                                .extended(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          onPressed: () {
                                                            homeController
                                                                    .homestate
                                                                    .value ==
                                                                8;
                                                          },
                                                          label: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                40,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              // Aligns items at both ends
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          40,
                                                                      width: 40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(90),
                                                                      ),
                                                                      child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(90),
                                                                          child: Image.asset(
                                                                            'images/readio_Floting.png',
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                40,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          )),
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            8),
                                                                    Text(
                                                                      '${radioController.getSelectedChName()} - Live',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Obx(
                                                                  () =>
                                                                      IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      // homeController.radioplaying.value ? homeController
                                                                      //     .radioplaying.value=false : homeController.radioplaying.value=true;
                                                                      // await _audioPlayer.setUrl(
                                                                      //   '${radioController.selectedRadioLink.value}',
                                                                      // );
                                                                      // if(radioController.playing.value)
                                                                      //   {
                                                                      //     await _audioPlayer.stop().then((value) => radioController.playing.value==false);
                                                                      //   }
                                                                      // else{
                                                                      //   await _audioPlayer.playing?
                                                                      //   await _audioPlayer.stop():
                                                                      //   await _audioPlayer.play();
                                                                      //   radioController.playing.value=true;
                                                                      // }
                                                                      // radioController.playing.value=radioController.playing.value?
                                                                      // radioController.playing.value==false:radioController.playing.value=true;
                                                                      // await _audioPlayer.setUrl(
                                                                      //   '${radioController.selectedRadioLink.value}',
                                                                      // );
                                                                      // await _audioPlayer.stop();
                                                                      // radioController.playing.value==false? await _audioPlayer.stop():
                                                                      // await _audioPlayer.stop().then((value) async => await _audioPlayer.play());

                                                                      radioController
                                                                          .playRadio();
                                                                    },
                                                                    icon: radioController
                                                                            .playing
                                                                            .value
                                                                        ? Icon(Icons
                                                                            .pause)
                                                                        : ImageIcon(
                                                                            AssetImage('images/play.png'),
                                                                            size:
                                                                                15.sp,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                          backgroundColor: Colors.black,
                                          body: SingleChildScrollView(
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              children: [
                                                Consumer<UpcomingShowProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                    if (provider.isLoading) {
                                                      Provider.of<UpcomingShowProvider>(
                                                              context,
                                                              listen: false)
                                                          .fetchUpcomingShows();
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    } else {
                                                      final List<UpcomingShow>
                                                          upcomingShows =
                                                          provider
                                                              .upcomingShows;
                                                      return CarouselSliderWidget(
                                                          objects:
                                                              upcomingShows);
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                buildIndicator(),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // homeController.homestate.value =
                                                        // 8;
                                                        Get.to(
                                                            LiveRadioScreen(),
                                                            transition: Transition
                                                                .noTransition);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'images/live.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(width: 3.w),
                                                          Text('Live Radio'),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'images/info.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(width: 3.w),
                                                          const Text(
                                                            'More Info',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Consumer<
                                                            ApiProvider>(
                                                          builder: (context,
                                                              provider, child) {
                                                            if (provider
                                                                .isLoading) {
                                                              Provider.of<ApiProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .fetchData();
                                                              return const Center(
                                                                  child:
                                                                      CircularProgressIndicator());
                                                            } else {
                                                              final List<
                                                                      Results>?
                                                                  dataList =
                                                                  provider
                                                                      .dataList;
                                                              return Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        15.h,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: 220
                                                                            .sp),
                                                                    child: Text(
                                                                      'Relaks Top 50',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              20.sp),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        200.h,
                                                                    child: ListView
                                                                        .builder(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          dataList?.length ??
                                                                              0,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        final Results
                                                                            data =
                                                                            dataList![index];
                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            // if (homeController.isItSubcribedAudio(audioId: data.id!)) {
                                                                            //   log('subs audio : ' + data.id!.toString());
                                                                            // } else {
                                                                            //   log('free audio : ' + data.id!.toString());
                                                                            // }
                                                                            if (homeController.isPremium(des: data.description!)) {
                                                                              if (homeController.isItSubcribedAudio(audioId: data.id!)) {
                                                                                // log('subs audio : ' + data.id!.toString());
                                                                                homeController.homestate.value = 9;
                                                                                audioIndex = index;
                                                                                setState(() {});
                                                                              } else {
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return RelaksPremium(audioId: data.id!);
                                                                                  },
                                                                                );
                                                                                // paymentForSong(audioId: data.id!);
                                                                                // log(DateTime.now().microsecondsSinceEpoch.toString());
                                                                              }
                                                                            } else {
                                                                              homeController.homestate.value = 9;
                                                                              audioIndex = index;
                                                                              setState(() {});
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            // color: Colors.red,
                                                                            margin:
                                                                                EdgeInsets.all(5),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Image.network(
                                                                                  data.image ?? 'https://isowall.co.za/wp-content/uploads/2017/12/demo-image.jpg',
                                                                                  fit: BoxFit.cover,
                                                                                  height: 100.h,
                                                                                  width: 150.w,
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 15.h,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      data.title!,
                                                                                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5.h,
                                                                                    ),
                                                                                    Row(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        const Icon(
                                                                                          Icons.play_circle_outline_outlined,
                                                                                          color: Colors.grey,
                                                                                          size: 15,
                                                                                        ),
                                                                                        Text(
                                                                                          '${data.playCount} Play',
                                                                                          style: TextStyle(fontSize: 15.sp, color: Colors.white.withOpacity(0.4)),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                homeController.isPremium(des: data.description!)
                                                                                    ? Icon(
                                                                                        Icons.workspace_premium,
                                                                                        color: Colors.white,
                                                                                      )
                                                                                    : Container()
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child:
                                                          Consumer<ApiProvider>(
                                                        builder: (context,
                                                            provider, child) {
                                                          if (provider
                                                              .isLoading) {
                                                            Provider.of<ApiProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .fetchData();

                                                            return const Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          } else {
                                                            final List<Results>?
                                                                dataList =
                                                                provider
                                                                    .dataList;
                                                            return Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 15.h,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: 250
                                                                          .sp),
                                                                  child: Text(
                                                                    'Trending',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20.sp),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    height:
                                                                        180.h,
                                                                    child: ListView
                                                                        .builder(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          dataList?.length ??
                                                                              0,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        final Results
                                                                            data =
                                                                            dataList![index];
                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            homeController.homestate.value =
                                                                                9;
                                                                            // provider.setIndex(index: index);
                                                                            audioIndex =
                                                                                index;
                                                                            setState(() {});
                                                                            // ff
                                                                            // Navigator.push(
                                                                            //   context,
                                                                            //   MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
                                                                            // );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.all(5),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Image.network(
                                                                                  data.image ?? 'https://isowall.co.za/wp-content/uploads/2017/12/demo-image.jpg',
                                                                                  fit: BoxFit.cover,
                                                                                  height: 100.h,
                                                                                  width: 150.w,
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 15.h,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      data.title!,
                                                                                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5.h,
                                                                                    ),
                                                                                    Row(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        const Icon(
                                                                                          Icons.play_circle_outline_outlined,
                                                                                          color: Colors.grey,
                                                                                          size: 15,
                                                                                        ),
                                                                                        Text(
                                                                                          '${data.playCount} Play',
                                                                                          style: TextStyle(fontSize: 15.sp, color: Colors.white.withOpacity(0.4)),
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        200.sp),
                                                            child: Text(
                                                              'Relaks Radio Live',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Container(
                                                            height: 150.h,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child:
                                                                YoutubePlayerBuilder(
                                                              player:
                                                                  YoutubePlayer(
                                                                controller:
                                                                    YoutubePlayerController(
                                                                  initialVideoId:
                                                                      'G9F8VtqNhzo',
                                                                  flags:
                                                                      YoutubePlayerFlags(
                                                                    autoPlay:
                                                                        true,
                                                                    mute: false,
                                                                  ),
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  player) {
                                                                return Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    player,
                                                                    SizedBox(
                                                                        height:
                                                                            16.0),
                                                                    Text(
                                                                      '',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30.h,
                                                          )
                                                        ],
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Container(
                                                            height: 40.h,
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  buttonList
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                // Define individual gradients for each button
                                                                List<Gradient>
                                                                    buttonGradients =
                                                                    [
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .lightBlueAccent,
                                                                      Colors
                                                                          .purpleAccent
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                  ),
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Colors.red
                                                                          .shade50,
                                                                      Colors.red
                                                                          .shade200
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: Alignment
                                                                        .topRight,
                                                                    end: Alignment
                                                                        .bottomLeft,
                                                                  ),
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .blue
                                                                          .shade100,
                                                                      Colors
                                                                          .blue
                                                                          .shade300
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: Alignment
                                                                        .bottomLeft,
                                                                    end: Alignment
                                                                        .topRight,
                                                                  ),
                                                                  LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .orangeAccent
                                                                          .shade100,
                                                                      Colors
                                                                          .orangeAccent
                                                                          .shade200
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin: Alignment
                                                                        .centerLeft,
                                                                    end: Alignment
                                                                        .centerRight,
                                                                  ),
                                                                ];

                                                                final gradientIndex = index %
                                                                    buttonGradients
                                                                        .length;

                                                                return Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              5.w),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            buttonGradients[gradientIndex],
                                                                        // Use individual gradient for each button
                                                                        borderRadius:
                                                                            BorderRadius.circular(15),
                                                                      ),
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {},
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              0,
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          textStyle:
                                                                              TextStyle(fontSize: 16.sp),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          buttonList[
                                                                              index],
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),

                                                          // Rest of the code...
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Scaffold(
                                          backgroundColor: Colors.black,
                                          body: SingleChildScrollView(
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              children: [
                                                CarouselSlider(
                                                  items: images.map((imageUrl) {
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: Card(
                                                        color: Colors
                                                            .grey.shade900,
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                              'images/image1.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Text(
                                                                    'Upcoming Show',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20.sp,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 8.0
                                                                          .sp),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'Friday',
                                                                    style: TextStyle(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ' | ',
                                                                    style: TextStyle(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Container(
                                                                    child: Image
                                                                        .asset(
                                                                      'images/bdflag.png',
                                                                      height:
                                                                          20.h,
                                                                      width:
                                                                          20.w,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    ' 9:00 AM ',
                                                                    style: TextStyle(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Container(
                                                                    child: Image
                                                                        .asset(
                                                                      'images/usflag.png',
                                                                      height:
                                                                          20.h,
                                                                      width:
                                                                          20.w,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    ' 4:00 AM',
                                                                    style: TextStyle(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  options: CarouselOptions(
                                                    height: 240.h,
                                                    enlargeCenterPage: true,
                                                    autoPlay: true,
                                                    autoPlayInterval:
                                                        Duration(seconds: 3),
                                                    autoPlayAnimationDuration:
                                                        Duration(
                                                            milliseconds: 800),
                                                    pauseAutoPlayOnTouch: true,
                                                    viewportFraction: 0.8,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'images/live.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(width: 3.w),
                                                          Text('Live Radio'),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'images/info.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(width: 3.w),
                                                          Text(
                                                            'More Info',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        270.sp),
                                                            child: Text(
                                                              'Relaks Top 50',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 165.h,
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  imageList
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Column(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        imageList[
                                                                            index],
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height:
                                                                            100.h,
                                                                        width:
                                                                            150.w,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Eajdiger Hero',
                                                                            style:
                                                                                TextStyle(fontSize: 17.sp, color: Colors.white),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 8.0.sp),
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Icon(Icons.play_circle_fill_outlined),
                                                                                Text(
                                                                                  '1.4K Play',
                                                                                  style: TextStyle(fontSize: 15.sp, color: Colors.white.withOpacity(0.4)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        250.sp),
                                                            child: Text(
                                                              'Trending',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 165.h,
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  imageList
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Column(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        imageList[
                                                                            index],
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height:
                                                                            100.h,
                                                                        width:
                                                                            150.w,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Eajdiger Hero',
                                                                            style:
                                                                                TextStyle(fontSize: 17.sp, color: Colors.white),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                3.h,
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 8.0),
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.play_circle_fill_outlined,
                                                                                  color: Colors.grey,
                                                                                ),
                                                                                Text(
                                                                                  '1.4K Play',
                                                                                  style: TextStyle(fontSize: 15.sp, color: Colors.white.withOpacity(0.4)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        200.sp),
                                                            child: Text(
                                                              'Relaks Radio Live',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Container(
                                                            height: 150.h,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child:
                                                                YoutubePlayerBuilder(
                                                              player:
                                                                  YoutubePlayer(
                                                                controller:
                                                                    YoutubePlayerController(
                                                                  initialVideoId:
                                                                      'G9F8VtqNhzo',
                                                                  flags:
                                                                      YoutubePlayerFlags(
                                                                    autoPlay:
                                                                        true,
                                                                    mute: false,
                                                                  ),
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  player) {
                                                                return Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    player,
                                                                    SizedBox(
                                                                        height:
                                                                            16.0),
                                                                    Text(
                                                                      '',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30.h,
                                                          )
                                                        ],
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade900,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Container(
                                                            height: 40.h,
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  buttonList
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              5.w),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Colors.blue,
                                                                            Colors.green,
                                                                          ],
                                                                          stops: [
                                                                            0.0,
                                                                            1.0
                                                                          ],
                                                                          begin:
                                                                              Alignment.centerLeft,
                                                                          end: Alignment
                                                                              .centerRight,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(15),
                                                                      ),
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {},
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              0,
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          textStyle:
                                                                              TextStyle(fontSize: 16.sp),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          buttonList[
                                                                              index],
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Container(
                                                            height: 165.h,
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  imageList
                                                                      .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  child: Column(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        imageList[
                                                                            index],
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height:
                                                                            100.h,
                                                                        width:
                                                                            150.w,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Eajdiger Hero',
                                                                            style:
                                                                                TextStyle(fontSize: 17.sp, color: Colors.white),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 8.0.sp),
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Icon(Icons.play_circle_fill_outlined),
                                                                                Text(
                                                                                  '1.4K Play',
                                                                                  style: TextStyle(fontSize: 15.sp, color: Colors.white.withOpacity(0.4)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
    );
  }

  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: ScaleEffect(
            dotColor: Colors.grey.shade700,
            activeDotColor: Colors.white,
            dotHeight: 6.sp,
            dotWidth: 6.sp,
            scale: 1.5),
      );


}
