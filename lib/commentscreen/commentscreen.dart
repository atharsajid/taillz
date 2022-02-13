import 'package:avatar_view/avatar_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';

import 'package:taillz/utills/constant.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff19334D),
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15
              ),
              child: Comment(
                image: "assets/icons/male/1.png",
              ),
            ),
          ),
           SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15
              ),
              child: Comment(
                image: "assets/icons/female/5.png",
              ),
            ),
          ), SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15
              ),
              child: Comment(
                image: "assets/icons/male/2.png",
              ),
            ),
          ), SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15
              ),
              child: Comment(
                image: "assets/icons/female/4.png",
              ),
            ),
          ), SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 15
              ),
              child: Comment(
                image: "assets/icons/male/3.png",
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/man.png'),
                          radius: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            style: TextStyle(
                                color: Color(0xff121556), fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.send,
                          color: Color(0xff121556),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String image;
  const Comment({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                  imagePath: image,
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
                              color: Constant.userCommentColor,
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
                          child: Text(TKeys.delete_comment.translate(context)),
                          value: 0),
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
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 15, top: 2),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/Like.png",
                  color: Color(0xff19334D),
                  height: 18,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '114',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Color(0xff19334D),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  TKeys.reply_text.translate(context),
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
