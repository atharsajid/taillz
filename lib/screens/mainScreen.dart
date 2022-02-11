import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/enddrawer/aboutus/aboutus.dart';
import 'package:taillz/enddrawer/privacypolicy/privacypolicy.dart';
import 'package:taillz/enddrawer/termsofuse/termsofuse.dart';
import 'package:taillz/inboxscreen/inboxscreen.dart';
import 'package:taillz/notifications/notification.dart';
import 'package:taillz/screens/consult/consultScreen.dart';
import 'package:taillz/screens/follower/follower.dart';
import 'package:taillz/screens/karma/karma_sceen.dart';
import 'package:taillz/screens/personalPage/personalScreen.dart';
import 'package:taillz/screens/thoughts/controller.dart/autogenerated_background.dart';
import 'package:taillz/screens/thoughts/thoughtsScreen.dart';
import 'package:taillz/utills/constant.dart';

import 'change/changeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final generatecontroller = Get.put(AutoGenBackground());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, // transparent status bar
        statusBarIconBrightness: Brightness.dark // dark text for status bar
        ));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.orange),
            bottom: TabBar(
              onTap: (value) {
                generatecontroller.generate();
              },
              isScrollable: true,
              indicator: BoxDecoration(),
              labelStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 14),
              // unselectedLabelStyle: TextStyle(fontFamily: 'Family Name',),
              unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 14),

              labelColor: Color(0xff121556),
              unselectedLabelColor: Color(0xff121556),
              tabs: [
                Tab(
                  child: Text(TKeys.thoughts_text.translate(context)),
                ),
                Tab(
                  text: TKeys.consult_text.translate(context),
                ),
                Tab(
                  text: TKeys.a_change_text.translate(context),
                ),
                Tab(
                  text: TKeys.Karma_text.translate(context),
                ),
              ],
            ),
            //"assets/icons/logo_text.svg",

            actions: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (builder) => PersonalScreen())),
                          onTap: () {
                            if (!_scaffoldKey.currentState.isDrawerOpen) {
                              _scaffoldKey.currentState.openEndDrawer();
                            } else {
                              _scaffoldKey.currentState.openEndDrawer();
                            }
                          },
                          child: Icon(
                            Icons.menu_outlined,
                            color: Constant.blueColor,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                  "assets/icons/notification.svg",
                                  height: 30,
                                  color: Constant.blueColor,
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Notifications()));
                                },
                              ),
                              Positioned(
                                bottom: 3,
                                right: -2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 15,
                                  width: 15,
                                  child: Center(
                                      child: Text(
                                    "4",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: SvgPicture.asset(
                      "assets/icons/logo_text.svg",
                      height: 25,
                      color: Color(0xff19334D),
                    ),
                  ),

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.4,
                  // )
                ],
              ),
            ]),
        body: TabBarView(
          children: [
            // Icon(Icons.directions_car),
            ThoughtsScreen(),
            ConsultScreen(),
            ChangeScreen(),
            KarmaScreen(),
            // SvgPicture.asset("assets/icons/logo_text.svg", semanticsLabel: 'A red up arrow'),
          ],
        ),
        endDrawer: Drawer(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 20),
            color: Color(0xff132952),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 25)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      TKeys.setting_text.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: Text(
                      TKeys.About_us_text.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicy()));
                    },
                    child: Text(
                      TKeys.Privacy_policy.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsOfUse()));
                    },
                    child: Text(
                      TKeys.Terms_of.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      TKeys.Blocked_user.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      TKeys.Hidden_users.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (builder) => Follower()));
                    },
                    child: Text(
                      TKeys.Followers_text.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => PersonalScreen()));
                    },
                    child: Text(
                      TKeys.All_i_have_written.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InboxScreen()));
                    },
                    child: Text(
                      TKeys.inbox_text.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SizedBox(
                  height: 120,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      TKeys.Log_Out.translate(context),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
        onDrawerChanged: (val) => print("draweropen: $val"),
        onEndDrawerChanged: (val) => print("draweropen1: $val"),
      ),
    );
  }

  Widget navigationBtn(title, [Function func]) {
    return ListTile(
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: "Montserrat",
        ),
      ),
      onTap: () => func != null ? func() : null,
    );
  }
}

class CustomAboutUsBtn extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  const CustomAboutUsBtn({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: "Montserrat",
        ),
      ),
    );
  }
}
