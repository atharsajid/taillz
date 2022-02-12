import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/screens/resgistrationscreen/sceondscreen/components/customnextbutton.dart';
import 'package:taillz/screens/resgistrationscreen/thirdscreen/components/customtextformfiled.dart';

class FourthScreen extends StatefulWidget {
  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

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
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15),
                    child: CustomNextButton(
                      text: TKeys.finish_button.translate(context),
                      onPressed: () {
                        //Email validateor function

                        final bool isValid = EmailValidator.validate(
                            emailcontroller.text.trim());
                        if (isValid && passwordcontroller.text.isNotEmpty) {
                          showflushbar(context,
                              TKeys.account_created.translate(context));
                        } else if (emailcontroller.text.isEmpty) {
                          showflushbar(
                              context, TKeys.email_require.translate(context));
                        } else if (passwordcontroller.text.isEmpty) {
                          showflushbar(context,
                              TKeys.password_is_require.translate(context));
                        } else {
                          showflushbar(
                              context, TKeys.invalid_email.translate(context));
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                TKeys.Login_information.translate(context),
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Color(0xff121556),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormFiled(
                hintText: TKeys.Email_text.translate(context),
                prefixicon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey.withOpacity(0.5),
                ),
                obsecure: false,
                controller: emailcontroller,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormFiled(
                controller: passwordcontroller,
                hintText: TKeys.choose_pass.translate(context),
                prefixicon: Icon(
                  Icons.vpn_key_outlined,
                  color: Colors.grey.withOpacity(0.5),
                ),
                obsecure: true,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10, right: 35),
                child: Container(
                  child: Text(
                    TKeys.uniquepassword.translate(context),
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                        fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10, right: 35),
                child: Container(
                  child: Text(
                    TKeys.signup_line_1.translate(context),
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  alignment: Alignment.topRight,
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
}
