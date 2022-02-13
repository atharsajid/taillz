import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/utills/constant.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({Key key}) : super(key: key);

  @override
  _FollowingTabState createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Following(
              name: "Alexandra91",
              image: "assets/icons/female/6.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "Rayan61",
              image: "assets/icons/male/7.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "Martin896",
              image: "assets/icons/male/1.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "John1999",
              image: "assets/icons/male/3.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "Emma567",
              image: "assets/icons/female/4.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "Kristin121",
              image: "assets/icons/female/2.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "Jennifer98",
              image: "assets/icons/female/1.png",
            ),
            SizedBox(
              height: 15,
            ),
            Following(
              name: "Robert21",
              image: "assets/icons/male/5.png",
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class Following extends StatelessWidget {
  final String image;
  final String name;
  const Following({
    Key key,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarView(
          radius: 20,
          borderWidth: 2,
          backgroundColor: Colors.blue,
          borderColor: Colors.white,
          avatarType: AvatarType.CIRCLE,
          imagePath: image,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: Constant.fontFamilyName,
            ),
          ),
        ),
        Spacer(),
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
                  child: Text(TKeys.remove_follower.translate(context)),
                  value: 0),
              PopupMenuItem(
                  child: Text(TKeys.report_block.translate(context)), value: 2),
            ];
          },
        ),
      ],
    );
  }
}
