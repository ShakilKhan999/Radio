import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class FundRaisingScreen extends StatelessWidget {
  const FundRaisingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text('Fund Raising',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Stack(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 380.h,
                          width: MediaQuery.of(context).size.width - 40.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              color: Colors.grey.shade900,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Donate',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 25.sp),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              60,
                                          // color: Colors.red,
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 190.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      icon: Icon(Icons
                                                          .keyboard_arrow_down),
                                                      items: <String>[
                                                        'Option 1',
                                                        'Option 2',
                                                        'Option 3',
                                                        'Option 4'
                                                      ].map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {},
                                                      hint: Text(
                                                        'Select an option',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      icon: Icon(Icons
                                                          .keyboard_arrow_down),
                                                      // Custom dropdown icon
                                                      items: <String>[
                                                        'Choice A',
                                                        'Choice B',
                                                        'Choice C',
                                                        'Choice D'
                                                      ].map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Row(
                                                            children: [
                                                              Text(value),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              Icon(Icons
                                                                  .arrow_downward),
                                                            ],
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {},
                                                      hint: Text('choice',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 20,
                                            child: Container(
                                                height: 15.h,
                                                width: 50.w,
                                                color: Colors.grey.shade900,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2.0),
                                                  child: Text(
                                                    'Country',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 13.sp),
                                                  ),
                                                ))),
                                        Positioned(
                                            right: 65,
                                            child: Container(
                                              height: 15.h,
                                              width: 55.w,
                                              color: Colors.grey.shade900,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 2.0),
                                                child: Text(
                                                  'Currency',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 13.sp),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.sp),
                                          child: Container(
                                            color: Colors.grey.shade800,
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0.sp),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height -
                                                            700.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100.w,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              child: Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
                                                                size: 30.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 15.w,
                                                            ),
                                                            Text(
                                                              '\$100',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      32.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 15.w,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Container(
                                                          width: 150.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20.0),
                                                            child: TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Enter Manual Amount',
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.sp),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 85,
                                            left: 120,
                                            child: Container(
                                                height: 20.h,
                                                width: 65.w,
                                                color: Colors.grey.shade800,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      'Or Manual',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Icon(
                                              Icons.done_outlined,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            'Keep me updated about this campaign',
                                            style: TextStyle(
                                                letterSpacing: 0.2,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.sp,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              backgroundColor:
                                                  Color(0xffffEA1C24)),
                                          child: Text(
                                            'Donate \$100',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              // alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Stack(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 420.h,
                          width: MediaQuery.of(context).size.width - 40.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              color: Colors.grey.shade900,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Recent Donors',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 25.sp),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.asset('images/chat1.png')
                                                ),
                                                SizedBox(width: 15.w,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Donated \$34',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.sp,fontWeight: FontWeight.w600),
                                                    ),
                                                    Text(
                                                      'William Rude From',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.sp),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Image.asset('images/flag.png',height: 30.h,width: 30.w,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
