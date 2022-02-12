import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/screens/resgistrationscreen/fourthscreen/fourthscreen.dart';
import 'package:taillz/screens/resgistrationscreen/sceondscreen/components/customnextbutton.dart';
import 'package:taillz/screens/resgistrationscreen/thirdscreen/components/customtextformfiled.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  TextEditingController nicknameController = TextEditingController();
//Gender List

  //Date fo birth year list
  var yearList = [
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
    "2009",
    "2008",
    "2007",
    "2006",
    "2005",
    "2004",
    "2003",
    "2002",
    "2001",
    "2000",
  ];
  //Country list
  var countryList = [
    "Israel",
    'USA',
    'Spain',
    'France',
    'Italy',
  ];
  //Language List
  var languageList = [
    'English',
    'Español',
    'עִברִית',
    'العربية',
    'Français',
  ];

  String value;
  String yearvalue;
  String countryvalue;
  String languagevalue;
  bool genderSelected = false;
  bool dateofbirth = false;
  bool countryselected = false;
  bool languageselected = false;
  @override
  Widget build(BuildContext context) {
    var genderList = [
      TKeys.dialog_text4.translate(context),
      TKeys.dialog_text5.translate(context),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15),
                  child: CustomNextButton(
                    text: TKeys.done_button.translate(context),
                    onPressed: () {
                      //Show Snackbar if any field is missing
                      if (nicknameController.text.isNotEmpty &&
                          nicknameController.text.length > 5 &&
                          nicknameController.text.length < 13 &&
                          genderSelected &&
                          dateofbirth &&
                          countryselected &&
                          languageselected) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FourthScreen()));
                      } else if (nicknameController.text.isEmpty) {
                        showflushbar(
                          context,
                          TKeys.nickname_require.translate(context),
                        );
                      } else if (!RegExp(r'^[a-zA-Z]+$')
                          .hasMatch(nicknameController.text)) {
                        showflushbar(context,
                            TKeys.nickname_shouldbe.translate(context));
                      } else if (nicknameController.text.length < 6) {
                        showflushbar(context,
                            TKeys.nickname_shouldbe.translate(context));
                      } else if (nicknameController.text.length > 12) {
                        showflushbar(context,
                            TKeys.nickname_shouldbe.translate(context));
                      } else if (!genderSelected) {
                        showflushbar(
                          context,
                          TKeys.gender_require.translate(context),
                        );
                      } else if (!dateofbirth) {
                        showflushbar(context,
                            TKeys.dateofbirth_require.translate(context));
                      } else if (!countryselected) {
                        showflushbar(
                            context, TKeys.country_require.translate(context));
                      } else if (!languageselected) {
                        showflushbar(
                            context, TKeys.language_require.translate(context));
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              TKeys.nick_name_in.translate(context),
              style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Color(0xff121556),
              ),
            ),
            SizedBox(
              height: 20,
            ),
//nickname textfield
            CustomEmailTextFormFiled(
              controller: nicknameController,
              hintText: TKeys.jfufufu_text.translate(context),
              prefixicon: Icon(
                Icons.person_outline,
                color: Colors.grey.withOpacity(0.5),
              ),
              obsecure: false,
            ),
            SizedBox(
              height: 15,
            ),
            //Gender Selection
            Container(
              margin: EdgeInsets.only(left: 35, right: 35,),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    onTap: () {
                      setState(() {
                        genderSelected = true;
                      });
                    },
                    hint: Row(
                      children: [
                        Icon(
                          Icons.male,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          TKeys.dialog_text3.translate(context),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    isExpanded: true,
                    value: value,
                    items: genderList.map(genderItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //Date of Birth year selection
            Container(
              margin: EdgeInsets.only(left: 35, right: 35,),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    onTap: () {
                      setState(() {
                        dateofbirth = true;
                      });
                    },
                    hint: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          TKeys.year_of_birth.translate(context),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    isExpanded: true,
                    value: yearvalue,
                    items: yearList.map(yearItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.yearvalue = value;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //Country Selection
            Container(
              margin: EdgeInsets.only(left: 35, right: 35, ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    onTap: () {
                      setState(() {
                        countryselected = true;
                      });
                    },
                    hint: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          TKeys.Usa_text.translate(context),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    isExpanded: true,
                    value: countryvalue,
                    items: countryList.map(countryItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.countryvalue = value;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //Language Selection
            Container(
              margin: EdgeInsets.only(left: 35, right: 35,),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 1)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    onTap: () {
                      setState(() {
                        languageselected = true;
                      });
                    },
                    hint: Row(
                      children: [
                        Icon(
                          Icons.language_outlined,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          TKeys.english_text.translate(context),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    isExpanded: true,
                    value: languagevalue,
                    items: languageList.map(languageItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.languagevalue = value;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Gender menu item
  DropdownMenuItem genderItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  //Date of birth menu item
  DropdownMenuItem yearItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  //country meny item
  DropdownMenuItem countryItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  //language meny item
  DropdownMenuItem languageItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
//Flushbar widget
  void showflushbar(BuildContext context, String title) {
    Flushbar(
      isDismissible: true,
      messageSize: 16,
      messageText: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      backgroundColor: Color(0xff121556),
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(milliseconds: 1500),
    )..show(context);
  }
}
