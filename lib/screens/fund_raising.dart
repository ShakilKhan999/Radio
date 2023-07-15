import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/styles/text_styles.dart';

class FundRaising extends StatelessWidget {
  FundRaising({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50.w,
                height: 50.w,
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Fund Raising',
                    style: TextStyles().titleTextStyle(),
                  ),
                ),
              ),
              SizedBox(
                width: 50.w,
                height: 50.w,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.circular(15)),
                    height: 300.h,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          'Donate',
                          style: TextStyles().titleMediumTextStyle(),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Container(
                              height: 40.h,
                              width: 200.w,
                              child: DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                hint: const Text(
                                  'Select Your Gender',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                      maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                ),
                                items: country
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select gender.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                                onSaved: (value) {
                                  selectedCountry = value.toString();
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(right: 8),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 24,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.sp,),
                            Expanded(
                              child: Container(
                                height: 40.h,
                                child: DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(vertical: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  hint: const Text(
                                    'Currency',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white,),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                  ),
                                  items: currency
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Currency';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedCurrency = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ,
                        Container(height: 100.h,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
