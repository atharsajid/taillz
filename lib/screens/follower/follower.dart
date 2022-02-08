
import 'package:flutter/material.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/screens/follower/follower_tab.dart';
import 'package:taillz/screens/follower/following_tab.dart';
import 'package:taillz/screens/mainScreen.dart';


class Follower extends StatefulWidget {
  const Follower({Key key}) : super(key: key);

  @override
  _FollowerState createState() => _FollowerState();
}

class _FollowerState extends State<Follower> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          foregroundColor: Color(0xff121556),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            indicator: BoxDecoration(),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
            ),
            // unselectedLabelStyle: TextStyle(fontFamily: 'Family Name',),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
            ),
            labelColor: Color(0xff121556),
            unselectedLabelColor: Color(0xff121556),
            tabs: [
              Tab(
                text: TKeys.following.translate(context),
              ),
              Tab(
                text: TKeys.Followers_text.translate(context),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowingTab(),
            FollowerTab(),
          ],
        ),
      ),
    );
  }
}
