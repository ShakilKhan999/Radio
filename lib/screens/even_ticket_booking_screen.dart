import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/event_success_payment_screen.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class EventTicketBooking extends StatefulWidget {
  static const String routeName='/eventticket';
  const EventTicketBooking({super.key});

  @override
  State<EventTicketBooking> createState() => _EventTicketBookingState();
}

class _EventTicketBookingState extends State<EventTicketBooking> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    String paymentMethod = '';
    return Obx(()=>homeController.eventticketBookstate.value==1?EventSuccessPaymentScreen():SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: IconButton(
                          onPressed: () {
                            homeController.eventstate.value=0;
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0.sp),
                      child: Text(
                        'Other Services',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: Stack(children: [
                        Container(
                          color: Colors.grey.withOpacity(0.2),
                          child: Padding(
                            padding: EdgeInsets.all(10.0.sp),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height - 230,
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Event',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.sp),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Image.asset('images/event1.png'),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 40.sp),
                                        child: Text(
                                          'Premiere Show of "The Big Bang”',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.sp),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // height: 10,
                                              // width: 10,
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.grey,
                                                  size: 15.sp,
                                                )),
                                            Text(
                                              ' 5 Aug 2023 ',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.grey),
                                            ),
                                            Container(
                                                child: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.grey,
                                                    size: 15.sp)),
                                            Text(
                                              ' Dhaka Bangladesh',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 190.sp),
                                        child: Text(
                                          'About Event”',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.sp),
                                        child: Text(
                                          " An event checklist is a document that outlines all the tasks and activities that need to be completed before, during, and after an event. It is a crucial tool for event planning experts as it ensures that all aspects of the event are covered, from the venue and vendors to the guest list",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.start,
                                          maxLines: 4,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 230.sp),
                                        child: Text(
                                          'Location',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 60.sp),
                                        child: Text(
                                          "Road 1, Dhanmondi, Dhaka Bangladesh ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.start,
                                          maxLines: 4,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width -
                                            120,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.transparent),
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              homeController.eventstate.value=2;
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                                backgroundColor:
                                                Color(0xffffEA1C24)),
                                            child: Text(
                                              'Book Ticket - BDT 200',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height - 260,
                            width: MediaQuery.of(context).size.width - 40,
                            child: GlassBox(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Select your Ticket ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30.sp),
                                        ),
                                        Icon(
                                          Icons.cancel_presentation_rounded,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15.sp),
                                          child: GlassBox(
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0.sp),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                        700,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                        80,
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
                                                            Icon(
                                                              Icons.remove,
                                                              color:
                                                              Colors.white,
                                                              size: 30,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Text(
                                                              '2',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                  30.sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Icon(
                                                              Icons.add,
                                                              color:
                                                              Colors.white,
                                                              size: 30,
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Total',
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600,
                                                              fontSize: 20.sp),
                                                        ),
                                                        Text(
                                                          'BDT 400',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 30.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
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
                                          child: GlassBox(
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0.sp),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                        550.h,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                        80.w,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Select Payment Method',
                                                          style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            RadioListTile(
                                                                value:
                                                                'credit_card',
                                                                groupValue:
                                                                paymentMethod,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    paymentMethod =
                                                                    value
                                                                    as String;
                                                                  });
                                                                },
                                                                title: GestureDetector(
                                                                  onTap: (){
                                                                    homeController.eventticketBookstate.value=1;
                                                                  },
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        180.0),
                                                                    child: Image
                                                                        .asset(
                                                                        'images/bkash.png'),
                                                                  ),
                                                                )),
                                                            RadioListTile(
                                                                value: 'paypal',
                                                                groupValue:
                                                                paymentMethod,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    paymentMethod =
                                                                    value
                                                                    as String;
                                                                  });
                                                                },
                                                                title: GestureDetector(
                                                                  onTap: (){
                                                                    homeController.eventticketBookstate.value=1;
                                                                  },
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        180.0),
                                                                    child: Image
                                                                        .asset(
                                                                        'images/nogod.png'),
                                                                  ),
                                                                )),
                                                            RadioListTile(
                                                                value:
                                                                'bank_transfer',
                                                                groupValue:
                                                                paymentMethod,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    paymentMethod =
                                                                    value
                                                                    as String;
                                                                  });
                                                                },
                                                                title: GestureDetector(
                                                                  onTap: (){
                                                                    homeController.eventticketBookstate.value=1;
                                                                  },
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        180.0),
                                                                    child: Image
                                                                        .asset(
                                                                        'images/paypel.png'),
                                                                  ),
                                                                )),
                                                            RadioListTile(
                                                                value:
                                                                'bank_transfer',
                                                                groupValue:
                                                                paymentMethod,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    paymentMethod =
                                                                    value
                                                                    as String;
                                                                  });
                                                                },
                                                                title: GestureDetector(
                                                                  onTap: (){
                                                                    homeController.eventticketBookstate.value=1;
                                                                  },
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        180.0),
                                                                    child: Image
                                                                        .asset(
                                                                        'images/visa.png'),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                        160,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .transparent),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(20)),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            backgroundColor:
                                                            Color(
                                                                0xffffEA1C24)),
                                                        child: Text(
                                                          'Proceed to Payment',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 20.sp),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              backgroundColor:
                                              Color(0xffffEA1C24)),
                                          child: Text(
                                            'Book Ticket - BDT 200',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
