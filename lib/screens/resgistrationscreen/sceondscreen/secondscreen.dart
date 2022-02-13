import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/screens/resgistrationscreen/sceondscreen/components/customnextbutton.dart';
import 'package:taillz/screens/resgistrationscreen/thirdscreen/thirdscreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Color color = Colors.transparent;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Color(0xff121556),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15),
                    child: CustomNextButton(
                      text: TKeys.next_button.translate(context),
                      onPressed: () {
                        if (isSelected) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThirdScreen()));
                        } else {
                          showflushbar(
                              context, TKeys.select_color.translate(context));
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: AlignmentDirectional.topCenter,
                child: Text(
                  TKeys.First_What_color_are_you.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Color(0xff121556),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    TKeys.responding_to_other.translate(context),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(height: 500, child: buildBlockPicker()),
            ],
          ),
        ),
      ),
    );
  }

  BlockPicker buildBlockPicker() {
    return BlockPicker(
        availableColors: colorlist,
        pickerColor: color,
        onColorChanged: (color) => setState(() {
              this.color = color;
              isSelected = true;
            }));
  }
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

List<Color> colorlist = availcolor.toSet().toList();
List<Color> availcolor = [
  Color.fromRGBO(197, 29, 20, 0.7),
  Color.fromRGBO(103, 173, 70, 0.7),
  Color.fromRGBO(166, 166, 166, 0.7),
  Color.fromRGBO(221, 119, 11, 0.7),
  Color.fromRGBO(243, 18, 18, 0.7),
  Color.fromRGBO(0, 127, 255, 0.7),
  Color.fromRGBO(88, 160, 161, 0.7),
  Color.fromRGBO(36, 60, 145, 0.7),
  Color.fromRGBO(50, 126, 52, 0.7),
  Color.fromRGBO(191, 157, 25, 0.7),
  Color.fromRGBO(141, 153, 38, 0.7),
  Color.fromRGBO(187, 122, 188, 0.7),
  Color.fromRGBO(0, 255, 74, 0.7),
  Color.fromRGBO(15, 255, 138, 0.7),
  Color.fromRGBO(209, 238, 0, 0.7),
  Color.fromRGBO(255, 0, 222, 0.7),
];
