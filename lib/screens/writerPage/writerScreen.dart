import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/screens/mainScreen.dart';
import 'package:taillz/screens/personalPage/personalScreen.dart';
import 'package:taillz/utills/constant.dart';

class WriterScreen extends StatefulWidget {
  const WriterScreen({Key key}) : super(key: key);

  @override
  _WriterScreenState createState() => _WriterScreenState();
}

class _WriterScreenState extends State<WriterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nick Name - ${TKeys.all_thoughts.translate(context)}",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xff19334D),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff19334D),
            )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          // Container(child: toolbar()),
          Expanded(flex: 1, child: PostStory()),
        ],
      )),
    );
  }

  Widget toolbar() {
    return Stack(
      children: [
        Container(
          // height: 130,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/background.jpg",
                        fit: BoxFit.fitWidth,
                      )),
                  Container(
                    height: 110,
                    decoration: new BoxDecoration(color: Color(0x4BC2C2C2)),
                  ),
                ],
              ),
              Container(
                height: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: AvatarView(
                  radius: 40,
                  avatarType: AvatarType.CIRCLE,
                  imagePath: "assets/images/user_profile2.png",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                child: Text(
                  "Nick name",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constant.fontFamilyName,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 27,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
