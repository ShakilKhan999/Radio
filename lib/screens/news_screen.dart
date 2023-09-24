import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:relaks_media/controller/home_controller.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/screens/publish_news_screen.dart';

import '../global/my_app_bar.dart';
import '../models/news_model.dart';
import '../provider/news_api_provider.dart';
import 'bottomnevigation.dart';
import 'news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = '/news';

  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<String> buttonList = [
    'World',
    'Asia',
    'Climate',
    'War in Ulraine',
    'Drama',
    'Drama',
    'Drama',
  ];
/*  List<Map<String, dynamic>> newsData = [
    {
      'imageUrl': 'images/news1.png',
      'title': 'Boris Johnson: By- election confirmed',
      'subtitle': 'Publish by Yasmin Rufo ',
      'subImage': 'images/subdot.png',
      'subtitle1': '3 Min Ago',
      'description':
          "A former bookseller and a great orator from the English-speaking area of Cameroon, he founded the opposition Social Democratic Front (SDF) in 1990. His popularity led the regime to accept a multi-party system was inevitable. In fact his party believed he won the 1992 presidential election, but the  Supreme Court judge that heard its petition alleging fraud said his 'hands were tied' - and let the official results granting victory to incumbent Paul Biya, with 40% of the vote, stand. This caused great upset with SDF supporters and their leader was put under house arrest for three months in his home in the economic hub, Bamenda, and a state of emergency was declared.Still the US must have given credence to his claim to the presidency, inviting him and his wife to the inauguration of Bill Clinton in January 1993. Fru Ndi was not a supporter of the secessionist rebellion in Anglophone Cameroon that has claimed tens of thousands of lives over the last six years - and was even kidnapped and beaten up by militants in 2019, and part of his house was burnt down.",
    },
    {
      'imageUrl': 'images/news2.png',
      'title': 'A senior Chechen commander',
      'subtitle': 'Publish by Paul Kirby',
      'subImage': 'images/subdot.png',
      'subtitle1': '4 Days Ago',
      'description':
          "A former bookseller and a great orator from the English-speaking area of Cameroon, he founded the opposition Social Democratic Front (SDF) in 1990. His popularity led the regime to accept a multi-party system was inevitable. In fact his party believed he won the 1992 presidential election, but the  Supreme Court judge that heard its petition alleging fraud said his 'hands were tied' - and let the official results granting victory to incumbent Paul Biya, with 40% of the vote, stand. This caused great upset with SDF supporters and their leader was put under house arrest for three months in his home in the economic hub, Bamenda, and a state of emergency was declared.Still the US must have given credence to his claim to the presidency, inviting him and his wife to the inauguration of Bill Clinton in January 1993. Fru Ndi was not a supporter of the secessionist rebellion in Anglophone Cameroon that has claimed tens of thousands of lives over the last six years - and was even kidnapped and beaten up by militants in 2019, and part of his house was burnt down.",
    },
    {
      'imageUrl': 'images/news3.png',
      'title': 'Port Talbot: Tata boss calls for subsidies',
      'subtitle': 'Publish by Huw Thomas',
      'subImage': 'images/subdot.png',
      'subtitle1': '4 Hours Ago',
      'description':
          "A former bookseller and a great orator from the English-speaking area of Cameroon, he founded the opposition Social Democratic Front (SDF) in 1990. His popularity led the regime to accept a multi-party system was inevitable. In fact his party believed he won the 1992 presidential election, but the  Supreme Court judge that heard its petition alleging fraud said his 'hands were tied' - and let the official results granting victory to incumbent Paul Biya, with 40% of the vote, stand. This caused great upset with SDF supporters and their leader was put under house arrest for three months in his home in the economic hub, Bamenda, and a state of emergency was declared.Still the US must have given credence to his claim to the presidency, inviting him and his wife to the inauguration of Bill Clinton in January 1993. Fru Ndi was not a supporter of the secessionist rebellion in Anglophone Cameroon that has claimed tens of thousands of lives over the last six years - and was even kidnapped and beaten up by militants in 2019, and part of his house was burnt down.",
    },
    {
      'imageUrl': 'images/news4.png',
      'title': 'Australia bus crash: Driver going too fast',
      'subtitle': 'Publish by Soran Qurbani',
      'subImage': 'images/subdot.png',
      'subtitle1': '3 Min Ago',
      'description':
          "A former bookseller and a great orator from the English-speaking area of Cameroon, he founded the opposition Social Democratic Front (SDF) in 1990. His popularity led the regime to accept a multi-party system was inevitable. In fact his party believed he won the 1992 presidential election, but the  Supreme Court judge that heard its petition alleging fraud said his 'hands were tied' - and let the official results granting victory to incumbent Paul Biya, with 40% of the vote, stand. This caused great upset with SDF supporters and their leader was put under house arrest for three months in his home in the economic hub, Bamenda, and a state of emergency was declared.Still the US must have given credence to his claim to the presidency, inviting him and his wife to the inauguration of Bill Clinton in January 1993. Fru Ndi was not a supporter of the secessionist rebellion in Anglophone Cameroon that has claimed tens of thousands of lives over the last six years - and was even kidnapped and beaten up by militants in 2019, and part of his house was burnt down.",
    },
    {
      'imageUrl': 'images/news5.png',
      'title': 'Nottingham attacks: CCTV shows suspect',
      'subtitle': 'Publish by Greig Watson',
      'subImage': 'images/subdot.png',
      'subtitle1': '3 Min Ago',
      'description':
          "A former bookseller and a great orator from the English-speaking area of Cameroon, he founded the opposition Social Democratic Front (SDF) in 1990. His popularity led the regime to accept a multi-party system was inevitable. In fact his party believed he won the 1992 presidential election, but the  Supreme Court judge that heard its petition alleging fraud said his 'hands were tied' - and let the official results granting victory to incumbent Paul Biya, with 40% of the vote, stand. This caused great upset with SDF supporters and their leader was put under house arrest for three months in his home in the economic hub, Bamenda, and a state of emergency was declared.Still the US must have given credence to his claim to the presidency, inviting him and his wife to the inauguration of Bill Clinton in January 1993. Fru Ndi was not a supporter of the secessionist rebellion in Anglophone Cameroon that has claimed tens of thousands of lives over the last six years - and was even kidnapped and beaten up by militants in 2019, and part of his house was burnt down.",
    },
  ];*/
  late NewsApiProvider newsApiProvider;
  @override
  void initState() {
    //newsApiProvider=Provider.of<NewsApiProvider>(context);
    // newsApiProvider.fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        // appBar: myAppBar(context, radioController),
       
        body: Obx(
          () {
            if (homeController.newsCurrentPage.value == 0) {
              return Consumer<NewsApiProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading & provider.isLoadingCat) {
                    Provider.of<NewsApiProvider>(context, listen: false)
                        .fetchData();
                    Provider.of<NewsApiProvider>(context, listen: false)
                        .fetchCategory();
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final List<News>? newsData = provider.dataList;
                    final List<CategoryName>? category = provider.category;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Card(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    SizedBox(height: 15.h),
                                    category != null
                                        ? Container(
                                            height: 40.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: category!.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Colors.grey,
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.4),
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .topRight,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Provider.of<NewsApiProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .fetchDataCategoryBasedNews(
                                                                  index + 1);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors
                                                              .transparent,
                                                          elevation: 0,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          textStyle: TextStyle(
                                                              fontSize: 16.sp),
                                                        ),
                                                        child: Text(
                                                          category[index].name!,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Container(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator(),
                                          ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          newsData != null
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: newsData.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          /*homeController.newsCurrentPage.value  = 1;
                                    homeController.currentIndex.value  = index;
                                    log('clicked');*/
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsDetailsScreen(
                                                          imageUrl: newsData[
                                                                      index]
                                                                  .image ??
                                                              '',
                                                          title:
                                                              newsData[
                                                                          index]
                                                                      .title ??
                                                                  '',
                                                          subtitle: newsData[
                                                                      index]
                                                                  .subtitle ??
                                                              '',
                                                          subtitle1: newsData[
                                                                      index]
                                                                  .subtitle ??
                                                              '',
                                                          description: newsData[
                                                                      index]
                                                                  .description ??
                                                              '' // Replace AnotherPage() with your actual page
                                                          )));
                                        },
                                        child: NewsCard(
                                            imageUrl:
                                                newsData[index].image ?? '',
                                            title: newsData[index].title ?? '',
                                            subtitle:
                                                newsData[index].subtitle ?? '',
                                            subImage:
                                                newsData[index].image ?? '',
                                            subtitle1:
                                                newsData[index].subtitle ?? '',
                                            description:
                                                newsData[index].description ??
                                                    ''),
                                      );
                                    },
                                  ),
                                )
                              : Expanded(child: CircularProgressIndicator())
                        ],
                      ),
                    );
                  }
                },
              );
            } /*else if(homeController.newsCurrentPage.value == 1) {
              return NewsDetailsScreen(
                  imageUrl: newsData[homeController.currentIndex.value]['imageUrl'],
                  title: newsData[homeController.currentIndex.value]['title'],
                  subtitle: newsData[homeController.currentIndex.value]['subtitle'],
                  subtitle1: newsData[homeController.currentIndex.value]['subImage'],
                  description: newsData[homeController.currentIndex.value]['description'],);

            }*/
            else {
              return PublishNewsScreen();
            }
          },
        ),
        floatingActionButton: homeController.newsCurrentPage.value == 0
            ? FloatingActionButton.extended(
                onPressed: () {
                  homeController.newsCurrentPage.value = 2;

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PublishNewsScreen(),
                  //   ),
                  // );
                },
                label: Text(
                  'Publish News',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                backgroundColor: Color(0xffffEA1C24),
              )
            : Container(),
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.all(8.sp),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(15),
        //     child: Container(
        //       height: 80.h,
        //       child: CurvedNavigationBar(
        //         index: radioController.bottomNavigationSelectedIndex.value,
        //         height: 70.h,
        //         animationDuration: Duration(),
        //         color: Colors.grey,
        //         backgroundColor: Colors.black,
        //         onTap: (index) {
        //           radioController.bottomNavigationSelectedIndex.value = index;

        //           Get.offAll(BottomNavigation(),
        //               transition: Transition.noTransition);
        //         },
        //         items: const [
        //           Icon(
        //             Icons.home,
        //             color: Colors.white,
        //           ),
        //           ImageIcon(
        //             AssetImage('images/news.png'),
        //             color: Colors.white,
        //           ),
        //           ImageIcon(
        //             AssetImage('images/msg.png'),
        //             color: Colors.white,
        //           ),
        //           ImageIcon(
        //             AssetImage('images/store.png'),
        //             color: Colors.white,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
     
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String subImage;
  final String subtitle1;
  final String description;

  NewsCard(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.subImage,
      required this.subtitle1,
      required this.description});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey.shade900,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 130.0.w,
                  height: 120.0,
                  child: Transform.scale(
                    scale: 0.9,
                    // Adjust the scale factor to decrease the image size
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.length > 10
                            ? title.substring(0, 10) + '..'
                            : title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 3.0.w),
                            // Image.network(
                            //   subImage,
                            //   height: 5.h,
                            //   width: 5.w,
                            // ),
                            SizedBox(width: 3.0.w),
                            Text(
                              description.length > 45
                                  ? description.substring(0, 45) + '..'
                                  : description,
                              style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 6.0,
              left: 6.0,
              child: Image.asset(
                'images/newslogo.png',
                // Replace with the actual path to your logo image
                width: 20.0,
                height: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
