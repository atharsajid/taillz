import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/utills/constant.dart';

class FollowerTab extends StatefulWidget {
  const FollowerTab({Key key}) : super(key: key);

  @override
  _FollowerTabState createState() => _FollowerTabState();
}

class _FollowerTabState extends State<FollowerTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                AvatarView(
                  radius: 20,
                  borderWidth: 2,
                  backgroundColor: Colors.blue,
                  borderColor: Colors.white,
                  avatarType: AvatarType.CIRCLE,
                  imagePath: "assets/images/user_profile.png",
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    "Kristin121",
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
                      PopupMenuItem(child: Text(TKeys.remove_follower.translate(context)), value: 0),
                      PopupMenuItem(child: Text(TKeys.report_block.translate(context)), value: 2),
                    ];
                  },
                ),
              ],
            ),

            SizedBox(height: 15,),
             Row(
              children: [
                AvatarView(
                  radius: 20,
                  borderWidth: 2,
                  backgroundColor: Colors.red,
                  borderColor: Colors.white,
                  avatarType: AvatarType.CIRCLE,
                  imagePath: "assets/images/user_profile.png",
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    "Jenniffer",
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
                      PopupMenuItem(child: Text(TKeys.remove_follower.translate(context)), value: 0),
                      PopupMenuItem(child: Text(TKeys.report_block.translate(context)), value: 2),
                    ];
                  },
                ),
              ],
            ),
            SizedBox(height: 15,),

             Row(
              children: [
                AvatarView(
                  radius: 20,
                  borderWidth: 2,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  avatarType: AvatarType.CIRCLE,
                  imagePath: "assets/images/user_profile.png",
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    "Martin1984",
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
                      PopupMenuItem(child: Text(TKeys.remove_follower.translate(context)), value: 0),
                      PopupMenuItem(child: Text(TKeys.report_block.translate(context)), value: 2),
                    ];
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
