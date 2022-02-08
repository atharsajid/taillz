import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';

class PasswordRecovery extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Text(
            TKeys.password_recovery.translate(context),
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xfff2D2D6C),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 40),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText:
                            TKeys.insert_your_email_address.translate(context)),
                  ),
                ),
              )),
            ],
          ),
          Container(
            child: GestureDetector(
                onTap: () {
                  final bool isValid =
                      EmailValidator.validate(emailcontroller.text.trim());
                  if (isValid && emailcontroller.text.isNotEmpty) {
                    showflushbar(
                        context, TKeys.resetpassword.translate(context));
                    emailcontroller.clear();
                  } else if (emailcontroller.text.isEmpty) {
                    showflushbar(
                        context, TKeys.email_require.translate(context));
                  } else {
                    showflushbar(
                        context, TKeys.invalid_email.translate(context));
                  }
                },
                child: Image.asset(
                  'assets/images/pswrd.PNG',
                  height: 90,
                )),
            alignment: AlignmentDirectional.center,
          ),
        ],
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
