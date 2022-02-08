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
                          showflushbar(context, TKeys.select_color.translate(context));
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
              Container(
                height: 500,
                child: buildBlockPicker()),
            ],
          ),
        ),
      ),
    );
  }

  BlockPicker buildBlockPicker() {
    return BlockPicker(
        availableColors: [
          Colors.yellow,
          Colors.blue,
          Colors.indigo,
          Colors.brown,
          Colors.green,
          Colors.cyan,
          Colors.amberAccent,
          Colors.black38,
          Colors.indigoAccent,
          Colors.pink,
          Colors.grey,
          Colors.purpleAccent,
          Colors.tealAccent,
          Colors.deepOrangeAccent,
          Colors.orange,
          Colors.red,
          Colors.deepPurpleAccent,
          Colors.lightBlueAccent,
          Colors.yellowAccent,
          Colors.lightGreen,
          Colors.amber,
          Colors.deepOrange
        ],
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
