import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/commentscreen/commentscreen.dart';
import 'package:taillz/screens/mainScreen.dart';
import 'package:taillz/utills/constant.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key key}) : super(key: key);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TKeys.All_i_have_written.translate(context),
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
          Container(
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(),
              labelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              // unselectedLabelStyle: TextStyle(fontFamily: 'Family Name',),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              labelColor: Color(0xff19334D),
              unselectedLabelColor: Color(0xff19334D),
              tabs: [
                Tab(
                  text: TKeys.published_text.translate(context)
                ),
                Tab(
                  text: TKeys.drafts_text.translate(context)
                ),
                Tab(
                  text: TKeys.pending_text.translate(context)
                ),
                Tab(
                  text:TKeys.declined_text.translate(context)
                ),
              ],
              controller: _tabController,
              // indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                PostStory(),
                PostStory(),
                PostStory(),
                PostStory(),
              ],
              controller: _tabController,
            ),
          ),
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

class PostStory extends StatefulWidget {
  const PostStory({Key key}) : super(key: key);

  @override
  _PostStoryState createState() => _PostStoryState();
}

class _PostStoryState extends State<PostStory> {
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
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            height: 108,
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
                    decoration: new BoxDecoration(color: Color(0x4B000000)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.topEnd,
                          child: PopupMenuButton<int>(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 25,
                            ),
                            itemBuilder: (context) {
                              return <PopupMenuEntry<int>>[
                                PopupMenuItem(
                                    child: Text(TKeys.delete_post.translate(context)),
                                    value: 0),
                                PopupMenuItem(
                                    child: Text(TKeys.edit_post.translate(context)),
                                    value: 2),
                                PopupMenuItem(
                                    child:
                                        Text(TKeys.disable_comment.translate(context)),
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
                                  const EdgeInsetsDirectional.only(start: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nick name",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Constant.fontFamilyName,
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        TKeys.what_should_i_do.translate(context),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: Constant.fontFamilyName,
                            color: Color(0xff19334D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "119",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: Constant.fontFamilyName,
                        color: Color(0xff19334D),
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
                Text(
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample\n"
                  "this is a sample story this is a sample",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: Constant.fontFamilyName,
                      color: Colors.black),
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
            padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 4),
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
                          padding: const EdgeInsetsDirectional.only(start: 6.0),
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
                          child: SvgPicture.asset(
                            "assets/icons/comment.svg",
                            height: 20,
                            color: Color(0xff19334D),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentScreen()));
                          },
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
                        GestureDetector(
                          child: Text(
                          TKeys.comment_text.translate(context),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: Constant.fontFamilyName,
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
      padding: const EdgeInsetsDirectional.only(start: 7, end: 7, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Constant.commentBackgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(5.0),
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
                  padding: EdgeInsetsDirectional.only(
                    start: 10,
                  ),
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
                        child: Text(TKeys.delete_comment.translate(context)), value: 0),
                    PopupMenuItem(
                        child: Text(TKeys.report_block.translate(context)), value: 2),
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
