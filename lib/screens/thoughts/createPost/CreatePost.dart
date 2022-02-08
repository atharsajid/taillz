import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/utills/constant.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController thoughtscontroller = TextEditingController();
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
                    size: 27,
                    color: Color(0xff19334D),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                   TKeys.Save_as.translate(context),
                    style: TextStyle(
                        color: Constant.editTextColor,
                        fontSize: 14,
                        fontFamily: Constant.fontFamilyName),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (titlecontroller.text.isEmpty) {
                      showflushbar(context, TKeys.title_should.translate(context));
                    } else if (titlecontroller.text.length<5) {
                        showflushbar(context, TKeys.title_should.translate(context));
                    }else if (titlecontroller.text.length>25) {
                        showflushbar(context, TKeys.title_should.translate(context));
                      
                    }
                    
                    else if (thoughtscontroller.text.isEmpty) {
                      showflushbar(context, TKeys.minimum_for_personal.translate(context));
                    }else if (thoughtscontroller.text.length<300) {
                      showflushbar(context, TKeys.minimum_for_personal.translate(context));
                      
                    }
                  },
                  child: Text(
                   TKeys.Publish_text.translate(context),
                    style: TextStyle(
                        color: Constant.blueColor,
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Constant.editTextBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.only(top: 10, left: 10),
                          height: 50,
                          width: 200,
                          child: buildTitleTextField(titlecontroller)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15.0, left: 5, right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Constant.editTextBackgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      buildDetailTextField(thoughtscontroller)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleTextField(dynamic controller) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        minLines: 2,
        maxLines: 2,
        style: TextStyle(
          fontSize: 14,
          fontFamily: Constant.fontFamilyName,
          color: Constant.editTextColor,
        ),
        decoration: InputDecoration(
          hintText: TKeys.title_for_you.translate(context),
          fillColor: Constant.editTextBackgroundColor,
          filled: true,
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(24),
              borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
          focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(24),
              borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        ));
  }

  Widget buildDetailTextField(dynamic controller) {
    return TextFormField(
        controller: controller,
        maxLines: null,
        minLines: null,
        expands: true,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          fontSize: 14,
          fontFamily: Constant.fontFamilyName,
          color: Constant.editTextColor,
        ),
        decoration: InputDecoration(
          hintText: TKeys.your_thoughts.translate(context),
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
