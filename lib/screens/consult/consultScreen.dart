import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/commentscreen/commentscreen.dart';
import 'package:taillz/model/consultModel.dart';
import 'package:taillz/utills/constant.dart';
import 'createConsultPost.dart';

typedef MyBuilder = void Function(
    BuildContext context, void Function() methodA);

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({Key key}) : super(key: key);

  @override
  _ConsultScreenState createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  // var list = ["Relationships", "Women Talks", "Motherhood"];

  int _currentIndex = 0;
  final List<int> _backstack = [0];
  String imagePath = "";
  String consultName = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> _fragments = [fragmentOne(navigateTo), ConsultDetailScreen()];

    return WillPopScope(
      onWillPop: () {
        print("here");
        return customPop(context);
      },
      child: Container(
          child: _currentIndex == 0
              ? _fragments[_currentIndex]
              : ConsultDetailScreen(
                  imagePath: imagePath,
                  consultName: consultName,
                  builder: (BuildContext context, void Function() methodA) {
                    // myMethod = methodA;
                    customPop(context);
                  },
                )),
    );
  }

  void navigateTo(int index) {
    _backstack.add(index);
    setState(() {
      _currentIndex = index;
    });
  }

  void navigateBack(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  customPop(BuildContext context) {
    if (_backstack.length - 1 > 0) {
      navigateBack(0);
    } else {
      _backstack.removeAt(_backstack.length - 1);
      Navigator.pop(context);
    }
  }

  Widget fragmentOne(void Function(int index) navigateTo) {
    List<ConsultModel> list = [
      ConsultModel(
        Constant.consult1,
        TKeys.Relationship_text.translate(context),
      ),
      ConsultModel(
        Constant.consult2,
        TKeys.Women_talk_text.translate(context),
      ),
      ConsultModel(
        Constant.consult3,
        TKeys.Motherhood_text.translate(context),
      ),
      ConsultModel(
        Constant.consult4,
        TKeys.Divorced_text.translate(context),
      ),
      ConsultModel(
        Constant.consult5,
        TKeys.Lgbt_text.translate(context),
      ),
      ConsultModel(
        Constant.consult6,
        TKeys.Our_planet_text.translate(context),
      ),
      ConsultModel(
        Constant.consult7,
        TKeys.Discrimination_text.translate(context),
      ),
      ConsultModel(
        Constant.consult8,
        TKeys.Vegan_text.translate(context),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        color: Colors.white,
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: list.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  setState(() {
                    imagePath = list[i].imagePath;
                    consultName = list[i].consultName;
                  });
                  navigateTo(1);
                },
                child: itemDesign(list[i]));
          },
        ),
      ),
    );
  }

  Widget itemDesign(ConsultModel item) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            item.imagePath,
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            decoration: new BoxDecoration(color: Color(0x33000000)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    item.consultName,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamilyName,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ConsultDetailScreen extends StatefulWidget {
  ConsultDetailScreen({Key key, this.imagePath, this.consultName, this.builder})
      : super(key: key);

  final MyBuilder builder;
  final String imagePath;
  final String consultName;

  @override
  _ConsultDetailScreenState createState() => _ConsultDetailScreenState();
}

class _ConsultDetailScreenState extends State<ConsultDetailScreen> {
  var list = ["assets/images/bg1.png"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
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
                              widget.imagePath,
                              fit: BoxFit.fitWidth,
                            )),
                        Container(
                          decoration:
                              new BoxDecoration(color: Color(0x4B000000)),
                        ),
                        InkWell(
                          onTap: () => widget.builder.call(context, () {}),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  widget.consultName,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Constant.fontFamilyName,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      return itemDesign(list[i]);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                backgroundColor: Color(0xff19334D),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => CreateConsultScreen()));
                },
                child: Icon(Icons.add),
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AvatarView(
                      radius: 16,
                      avatarType: AvatarType.CIRCLE,
                      imagePath: "assets/images/user_profile.png",
                    ),
                    SizedBox(
                      width: 4,
                    ),
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
                    Expanded(
                      flex: 1,
                      child: Text(
                        "10/30/2021",
                        style: TextStyle(
                          fontSize: 13,
                          color: Constant.commentDateColor,
                          fontWeight: FontWeight.normal,
                          fontFamily: Constant.fontFamilyName,
                        ),
                      ),
                    ),
                    PopupMenuButton<int>(
                      child: Container(
                        height: 36,
                        width: 48,
                        alignment: AlignmentDirectional.centerEnd,
                        child: Icon(
                          Icons.more_vert,
                          color: Constant.blueColor,
                        ),
                      ),
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem(
                              child: Text(TKeys.follow.translate(context)),
                              value: 0),
                          PopupMenuItem(
                              child:
                                  Text(TKeys.report_block.translate(context)),
                              value: 2),
                        ];
                      },
                    ),
                    /*Text(
                      "119",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: Constant.fontFamilyName,
                        color: Constant.readMoreColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset(
                        "assets/icons/story_view.svg",
                        height: 22,
                      ),
                    )*/
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
                    fontSize: 13,
                    fontFamily: Constant.fontFamilyName,
                    color: Constant.textTitleColor,
                  ),
                ),
                Text(
                  "read more",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: Constant.fontFamilyName,
                    color: Constant.readMoreColor,
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
                          color: Constant.heartColor,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 6),
                          child: Text(
                            "152",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: Constant.fontFamilyName,
                              color: Constant.readMoreColor,
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
                    margin: EdgeInsetsDirectional.only(
                      start: 10,
                    ),
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
                            color: Constant.heartColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 6),
                          child: Text(
                            "23",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: Constant.fontFamilyName,
                              color: Constant.readMoreColor,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentScreen()));
                          },
                          child: Text(TKeys.comment_text.translate(context),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: Constant.fontFamilyName,
                                color: Constant.readMoreColor,
                              )),
                        )
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
          padding: const EdgeInsetsDirectional.all(5),
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
                  height: 36,
                  width: 48,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.more_vert,
                    color: Constant.vertIconColor,
                  ),
                ),
                itemBuilder: (context) {
                  return <PopupMenuEntry<int>>[
                    PopupMenuItem(
                        child: Text(TKeys.report_block.translate(context)),
                        value: 0),
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
