
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/enddrawer/privacypolicy/privacypolicy.dart';


class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
              TKeys.About_us_text.translate(context),
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Color(0xff19334D),
                  fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading:  IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Color(0xff19334D),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: TKeys.about_line1.translate(context),
              ),
              CustomText(
                text:TKeys.about_line2.translate(context),
              ),
              CustomText(
                text: TKeys.about_line3.translate(context),
              ),
              CustomText(
                text:TKeys.about_line4.translate(context),
              ),
              CustomText(
                text:TKeys.about_line5.translate(context),
              ),
              CustomText(
                text: TKeys.about_line6.translate(context),
              ),
              CustomText(
                text: TKeys.about_line7.translate(context),
              ),
              CustomText(
                text:TKeys.about_line8.translate(context),
              ),
              CustomText(
                text: TKeys.about_line9.translate(context),
              ),
              CustomText(
                text: TKeys.about_line10.translate(context),
              ),
              CustomText(
                text:TKeys.about_line11.translate(context),
              ),
              CustomText(
                text: TKeys.about_line12.translate(context),
              ),
              CustomText(
                text: TKeys.about_line13.translate(context),
              ),
              CustomText(
                text: TKeys.about_line14.translate(context),
              ),
              CustomText(
                text:TKeys.about_line15.translate(context),
              ),
              CustomText(
                text: TKeys.about_line16.translate(context),
              ),
              CustomText(
                text: TKeys.about_line17.translate(context),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Text(
                   TKeys.ContactUs.translate(context),
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Text(
                   TKeys.You_may_contact.translate(context),
                    style: GoogleFonts.montserrat(
                        fontSize: 16, letterSpacing: 1, height: 1.3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Text(
            TKeys.Send_us_your_msg.translate(context),
                    style: GoogleFonts.montserrat(
                        fontSize: 16, letterSpacing: 1, height: 1.3),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'assets/images/1.PNG',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                TKeys.share_your_life_story.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff633FA5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Text(
                    TKeys.inspire_other_people.translate(context),
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'assets/images/22.PNG',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  TKeys.join_dedicated_communities.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff633FA5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  child: Text(
                    TKeys.we_created_dedicated.translate(context),
                    style: GoogleFonts.montserrat(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'assets/images/33.PNG',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  TKeys.be_your_self.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff633FA5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  child: Text(
                   TKeys.we_believe_that.translate(context),
                    style: GoogleFonts.montserrat(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
