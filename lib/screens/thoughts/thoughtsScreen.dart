import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/localization_service.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/commentscreen/commentscreen.dart';
import 'package:taillz/screens/thoughts/createPost/CreatePost.dart';
import 'package:taillz/screens/writerPage/writerScreen.dart';
import 'package:taillz/utills/constant.dart';

class ThoughtsScreen extends StatefulWidget {
  const ThoughtsScreen({Key key}) : super(key: key);

  @override
  _ThoughtsScreenState createState() => _ThoughtsScreenState();
}

class _ThoughtsScreenState extends State<ThoughtsScreen> {
  final localizationscontroller = Get.find<LocalizationController>();
  var list = ["assets/images/bg1.png"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return itemDesign(list[i]);
                // return new Text(list[i]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                backgroundColor: Color(0xff19334D),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => CreatePost()));
                },
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemDesign(String item) {
    return Card(
      elevation: 0,
      //4
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
      // margin: EdgeInsets.only(left: 16,top: 16,right: 16),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            child: Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Container(
                      height: 108,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        item,
                        fit: BoxFit.fitWidth,
                      )),
                  Container(
                    decoration: BoxDecoration(color: Color(0x4B000000)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: PopupMenuButton<int>(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 25,
                            ),
                            itemBuilder: (context) {
                              return <PopupMenuEntry<int>>[
                                PopupMenuItem(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                            TKeys.follow.translate(context))),
                                    value: 0),
                                PopupMenuItem(
                                    child: Text(
                                        TKeys.report_block.translate(context)),
                                    value: 2),
                              ];
                            },
                          ),
                        ),
                        Row(
                          children: [
                            AvatarView(
                              radius: 20,
                              borderWidth: 2,
                              borderColor: Colors.white,
                              avatarType: AvatarType.CIRCLE,
                              imagePath: "assets/images/user_profile.png",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  WriterScreen()));
                                    },
                                    child: Text(
                                      TKeys.nick_name.translate(context),
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            )
                                          ]),
                                    ),
                                  ),
                                  Text(
                                    "10/30/2021",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: Constant.fontFamilyName,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  localizationscontroller.directionRTL
                      ? Align(
                          alignment: Alignment(-1.08, 1.58),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WriterScreen())),
                            child: Image.asset(
                              "assets/images/icon2.png",
                              height: 45,
                            ),
                          ))
                      : Align(
                          alignment: Alignment(1.08, 1.58),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WriterScreen())),
                            child: Image.asset(
                              "assets/images/icon1.png",
                              height: 45,
                            ),
                          )),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        TKeys.what_should_i_do.translate(context),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff19334D),
                          fontFamily: Constant.fontFamilyName,
                        ),
                      ),
                    ),
                    Text(
                      "119",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: Constant.fontFamilyName,
                        color: Constant.readMoreColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      child: SvgPicture.asset(
                        "assets/icons/story_view.svg",
                        height: 22,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: Constant.fontFamilyName,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "read more",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: Constant.fontFamilyName,
                    color: Color(0xff19334D),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Constant.lineColor,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3.5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/heart_like.svg",
                          height: 20,
                          color: Color(0xff19334D),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 6),
                          child: Text(
                            "152",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: Constant.fontFamilyName,
                              color: Color(0xff19334D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /*Icon(
                          Icons.chat_bubble_rounded,
                          size: 20,
                          color: Colors.black54,
                        ),*/
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentScreen()));
                          },
                          child: SvgPicture.asset(
                            "assets/icons/comment.svg",
                            height: 20,
                            color: Color(0xff19334D),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 6.0),
                          child: Text(
                            "23",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: Constant.fontFamilyName,
                              color: Color(0xff19334D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text(
                            TKeys.comment_text.translate(context),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff19334D),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Constant.lineColor,
            thickness: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommentScreen()));
            },
            child: Card(elevation: 0, child: userComment()),
          ),
        ],
      ),
    );
  }

  Widget userComment() {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Constant.commentBackgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarView(
                radius: 16,
                avatarType: AvatarType.CIRCLE,
                imagePath: "assets/images/user_profile.png",
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nick name",
                            style: TextStyle(
                              fontSize: 14,
                              color: Constant.textTitleColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: Constant.fontFamilyName,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "10/30/2021",
                            style: TextStyle(
                              fontSize: 13,
                              color: Constant.commentDateColor,
                              fontWeight: FontWeight.normal,
                              fontFamily: Constant.fontFamilyName,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          "This is comment This is comment\n"
                          "This is comment This is comment\n"
                          "This is comment This is comment",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontFamily: Constant.fontFamilyName,
                          )),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton<int>(
                child: Container(
                  padding: EdgeInsets.only(right: 25, left: 25),
                  height: 36,
                  width: 48,
                  child: Icon(
                    Icons.more_vert,
                    color: Constant.vertIconColor,
                  ),
                ),
                itemBuilder: (context) {
                  return <PopupMenuEntry<int>>[
                    PopupMenuItem(
                        child: Text(TKeys.report_block.translate(context)),
                        value: 2),
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
