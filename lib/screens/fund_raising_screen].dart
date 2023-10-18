import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/fund_rise_controller.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/global/my_app_bar.dart';
import 'package:relaks_media/global/my_bottom_nav_bat.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/utils/main_drawer.dart';

import '../controller/home_controller.dart';
import '../global/constants.dart';
import '../global/shared_preference_helper.dart';
import '../utils/glass_box.dart';
import '../utils/payment_way.dart';

class FundRaisingScreen extends StatefulWidget {
  FundRaisingScreen({super.key});

  @override
  State<FundRaisingScreen> createState() => _FundRaisingScreenState();
}

class _FundRaisingScreenState extends State<FundRaisingScreen> {
  final List<String> country = [
    'United States',
    'Bangladesh',
  ];

  final List<String> currency = [
    'USD',
    'TK',
  ];

  String? selectedCountry;

  String? selectedCurrency;

  int price = 100;
  TextEditingController manualAmountController = TextEditingController();

  void increasePrice() {
    setState(() {
      price += 1;
      manualAmountController.text =
          price.toString(); // Update the manual input field
    });
  }

  void decreasePrice() {
    setState(() {
      price -= 1;
      manualAmountController.text =
          price.toString(); // Update the manual input field
    });
  }

  void updatePriceManually() {
    setState(() {
      price = int.tryParse(manualAmountController.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());
    FundRiseController fundRiseController = Get.put(FundRiseController());
    fundRiseController.getallfundriser();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: myAppBar(context, radioController),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.offAll(BottomNavigation(),
                          transition: Transition.noTransition);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
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
                                              60.w,
                                          // color: Colors.red,
                                          child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 180.0.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0.sp),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child: Theme(
                                                      data: ThemeData(
                                                        canvasColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.7), // Set the background color here
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          icon: Icon(Icons
                                                              .keyboard_arrow_down),
                                                          items: country.map(
                                                              (String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(value,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                              selectedCountry) {
                                                            setState(() {
                                                              this.selectedCountry =
                                                                  selectedCountry!;
                                                            });
                                                          },
                                                          value:
                                                              selectedCountry,
                                                          hint: Text(
                                                              'Select a country',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w
                                                  ),
                                                  Container(
                                                    width: 120.0.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child: Theme(
                                                      data: ThemeData(
                                                        canvasColor: Colors
                                                            .black
                                                            .withOpacity(
                                                                0.7), // Set the background color here
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          icon: Icon(Icons
                                                              .keyboard_arrow_down),
                                                          items: currency.map(
                                                              (String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(value,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                              selectedCurrency) {
                                                            // Handle the selected currency here
                                                            setState(() {
                                                              this.selectedCurrency =
                                                                  selectedCurrency!;
                                                            });
                                                          },
                                                          value:
                                                              selectedCurrency,
                                                          hint: Text('Currency',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
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
                                              BorderRadius.circular(15),
                                          child: Container(
                                            color: Colors.grey.shade800,
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
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
                                                            GestureDetector(
                                                              onTap:
                                                                  decreasePrice,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
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
                                                                  size: 30,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Image.asset('images/taka.png',height: 30.h,width: 30.w,color: Colors.white,),
                                                                Text(
                                                                  '$price',
                                                                  style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize: 32,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            GestureDetector(
                                                              onTap:
                                                                  increasePrice,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 30,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Container(
                                                          width: 150,
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
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        manualAmountController,style: TextStyle(color: Colors.white),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Enter Manual Amount',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey[500],
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  icon: Icon(Icons
                                                                      .check),
                                                                  onPressed:
                                                                      updatePriceManually,
                                                                ),
                                                              ],
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
                                          onPressed: () async{
                                            String? userToken = await SharedPreferenceHelper().getString(key: token);
                                            if(userToken==null)
                                            {
                                              Fluttertoast.showToast(
                                                msg: 'Please Login or Sign Up then try again',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                              );
                                            }
                                            else
                                              {
                                                //fundRiseController.addfundraiser('12');
                                                paymentForFund(amount: price.toString());
                                              }

                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              backgroundColor:
                                                  Color(0xffffEA1C24)),
                                          child: Text(
                                            'Donate \$$price',
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
                                    Obx(()=>SizedBox(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: fundRiseController.fundriserList[0].results.length,
                                        itemBuilder: (context, index) {
                                          return  Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                          child: Image.network(
                                                              '${fundRiseController.fundriserList[0].results[index].user.avatar??
                                                              'https://cdn-icons-png.flaticon.com/512/147/147142.png'}')),
                                                      SizedBox(
                                                        width: 15.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Obx(()=>Text(
                                                            'Donated ${fundRiseController.fundriserList[0].results[index].amount}',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: 'Poppins',
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                FontWeight.w600),
                                                          )),
                                                          Text(
                                                            '${fundRiseController.fundriserList[0].results[index].category}',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: 'Poppins',
                                                                fontSize: 12.sp),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Image.asset(
                                                    'images/flag.png',
                                                    height: 30.h,
                                                    width: 30.w,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )),

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
      bottomNavigationBar: myBottomNavBar(radioController),
    );
  }
  paymentForFund({required String amount}) async {
    final flutterBkash = FlutterBkash(
      bkashCredentials: BkashCredentials(
        username: "01704840427",
        password: "#ApsP+VS-W6",
        appKey: "zi7YGziyr0UadbSjjU5YGVoJtc",
        appSecret: "Ej7f0MuFG0TtQ0cdztpWXMBuI6bvVbFcLDqZcKYJHCLjGUTlppOE",
        isSandbox: false,
      ),
    );
    try {
      /// call pay method to pay without agreement as parameter pass the context, amount, merchantInvoiceNumber
      final result = await flutterBkash.pay(
        context: context,
        // need the context as BuildContext
        amount: double.parse(amount),
        // need it double type
        merchantInvoiceNumber: DateTime.now().microsecondsSinceEpoch.toString(),
      );

      /// if the payment is success then show the log
      log('123456 : ' + result.toString());

      /// if the payment is success then show the snack-bar
      Fluttertoast.showToast(
        msg: 'Success',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );

      FundRiseController fundRiseController = Get.find();
      fundRiseController.addfundraiser(amount);
    } on BkashFailure catch (e, st) {
      /// if something went wrong then show the log
      log(e.message, error: e, stackTrace: st);

      /// if something went wrong then show the snack-bar
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    } catch (e, st) {
      /// if something went wrong then show the log
      log("Something went wrong", error: e, stackTrace: st);

      /// if something went wrong then show the snack-bar
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    }
  }
}
