import 'package:email_validator/email_validator.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:taillz/Localization/localization_service.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/passwordrecovery/passwordrecovery.dart';
import 'package:taillz/screens/mainScreen.dart';
import 'package:taillz/screens/resgistrationscreen/firstscreen/Components/customtextfiled.dart';
import 'package:taillz/screens/resgistrationscreen/firstscreen/Login%20Api%20Service/api_service.dart';
import 'package:taillz/screens/resgistrationscreen/firstscreen/Login%20Api%20Service/login_model.dart';
import 'package:taillz/screens/resgistrationscreen/sceondscreen/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({
    Key key,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final localizationcontroller = Get.find<LocalizationController>();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  TextButton(
                    onPressed: () {
                      localizationcontroller.directionRtl();
                      localizationcontroller.hebLanguage();
                    },
                    child: Text(
                      'עִברִית',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xff121556),
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    child: Text(
                      "English",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xff121556),
                      ),
                    ),
                    onPressed: () {
                      localizationcontroller.engLanguage();
                      localizationcontroller.dirctionLtr();
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Image.asset(
                  'assets/images/LogoIcon.png',
                  height: MediaQuery.of(context).size.height * 0.15,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  TKeys.Anonymous_world.translate(context),
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff121556),
                  ),
                ),
              ),
              Row(
                children: [
                  CustomTextFiled(
                    hinttext: TKeys.Email_Address.translate(context),
                    obsecuretext: false,
                    textcontroller: emailcontroller,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomTextFiled(
                    hinttext: TKeys.Password_text.translate(context),
                    obsecuretext: true,
                    textcontroller: passwordcontroller,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 2, left: 65, right: 65),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff121556),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextButton(
                    onPressed: () {
                      //Email validateor function

                      final bool isValid =
                          EmailValidator.validate(emailcontroller.text.trim());
                      if (isValid && passwordcontroller.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      } else if (emailcontroller.text.isEmpty) {
                        showflushbar(
                          context,
                          TKeys.email_require.translate(context),
                        );
                      } else if (passwordcontroller.text.isEmpty) {
                        showflushbar(
                          context,
                          TKeys.password_is_require.translate(context),
                        );
                      } else {
                        showflushbar(
                          context,
                          TKeys.invalid_email.translate(context),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TKeys.Login_text.translate(context),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordRecovery()));
                },
                child: Text(
                  TKeys.Forgot_Password.translate(context),
                  style: TextStyle(
                    color: Color(0xff121556),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 65, vertical: 2),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () {
                      colorlist.shuffle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen()));
                    },
                    child: Text(
                      TKeys.Create_New_Account.translate(context),
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff121556),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
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

  //progress indicatior

}
