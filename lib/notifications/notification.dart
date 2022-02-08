import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';


class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
        title: Text(
          TKeys.notification_text.translate(context),
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff19334D),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff19334D),
            size: 25,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.your_story_text.translate(context),
                  text2: TKeys.story_user_c_text.translate(context),
                  text3: TKeys.Successfully_published.translate(context),
                  color: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/Sccess.png'),
                title: Text(
                  '26.10.2020',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.your_story_text.translate(context),
                  text2: TKeys.story_user_b_text.translate(context),
                  text3: TKeys.Successfully_published.translate(context),
                  color: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/Sccess.png'),
                title: Text(
                  '26.10.2020',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  color: Color(0xff8134E2),
                  text1: TKeys.your_story_text.translate(context),
                  text2: TKeys.story_user_b_text.translate(context),
                  text3: TKeys.is_pending.translate(context),
                ),
                backgroundImage: AssetImage('assets/images/pemding.png'),
                title: Text(
                  '26.10.2020',
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.your_story_text.translate(context),
                  text2: TKeys.story_user_b_text.translate(context),
                  text3: TKeys.is_pending.translate(context),
                  color: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/pemding.png'),
                title: Text(
                  '26.10.2020',
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.Like_user.translate(context),
                  text2: TKeys.commented_on_your.translate(context),
                  text3: TKeys.story_text.translate(context),
                  color1: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/man.png'),
                title: Text(
                  TKeys.Like_user.translate(context),
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.Like_user.translate(context),
                  text2: TKeys.commented_on_your.translate(context),
                  text3: TKeys.story_text.translate(context),
                  color1: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/woman.png'),
                title: Text(
                  TKeys.Like_user.translate(context),
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.Like_user.translate(context),
                  text2: TKeys.commented_on_your.translate(context),
                  text3: TKeys.story_text.translate(context),
                  color1: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/man.png'),
                title: Text(
                  '26.10.2020',
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.Like_user.translate(context),
                  text2: TKeys.commented_on_your.translate(context),
                  text3: TKeys.story_text.translate(context),
                  color1: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/man.png'),
                title: Text(
                  '26.10.2020',
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.Like_user.translate(context),
                  text2: TKeys.commented_on_your.translate(context),
                  text3: TKeys.story_text.translate(context),
                  color1: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/man.png'),
                title: Text(
                  '26.10.2020',
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Customlisttile(
                subTitle: CustomRichText(
                  text1: TKeys.Like_user.translate(context),
                  text2: TKeys.commented_on_your.translate(context),
                  text3: TKeys.story_text.translate(context),
                  color1: Color(0xff8134E2),
                ),
                backgroundImage: AssetImage('assets/images/man.png'),
                title: Text(
                  '26.10.2020',
                  style:
                      GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color color;
  final Color color1;
  final FontWeight fontWeight;
  const CustomRichText({
    Key key,
    this.text1,
    this.text2,
    this.text3,
    this.color,
    this.fontWeight,
    this.color1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 14,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: GoogleFonts.montserrat(
              color: color,
              fontSize: 14,
              fontWeight: fontWeight,
            ),
          ),
          TextSpan(
            text: text3,
            style: TextStyle(
              color: color1,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Customlisttile extends StatelessWidget {
  final ImageProvider backgroundImage;
  final Widget leading;
  final Widget title;
  final Widget subTitle;

  const Customlisttile({
    Key key,
    this.backgroundImage,
    this.leading,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: backgroundImage,
      ),
      title: title,
      subtitle: subTitle,
    );
  }
}
