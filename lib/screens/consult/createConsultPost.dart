import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/utills/constant.dart';

class CreateConsultScreen extends StatefulWidget {
  const CreateConsultScreen({Key key}) : super(key: key);

  @override
  _CreateConsultScreenState createState() => _CreateConsultScreenState();
}

class _CreateConsultScreenState extends State<CreateConsultScreen> {
  TextEditingController postcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Container(
            height: 70,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff19334D),
                    size: 27,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    if (postcontroller.text.length < 25) {
                      showflushbar(
                          context, TKeys.minimum_for_post.translate(context));
                    }
                  },
                  child: Text(
                    TKeys.Publish_text.translate(context),
                    style: TextStyle(
                        color: Color(0xff19334D),
                        fontWeight: FontWeight.bold,
                        fontFamily: Constant.fontFamilyName),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Constant.editTextBackgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: buildDetailTextField()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailTextField() {
    return TextFormField(
        controller: postcontroller,
        maxLines: null,
        minLines: null,
        expands: true,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          fontSize: 14,
          fontFamily: Constant.fontFamilyName,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: TKeys.typing.translate(context),
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        ));
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
