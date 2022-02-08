import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/enddrawer/privacypolicy/privacypolicy.dart';


class TermsOfUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
              TKeys.Terms_of_use_title.translate(context),
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Color(0xff19334D),
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
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
              SizedBox(height: 15,),
              DescriptionText(
                text:TKeys.Terms_desc1.translate(context),
              ),
              DescriptionText(
                text: TKeys.Terms_desc2.translate(context),
              ),
              DescriptionText(
                text:TKeys.Terms_desc3.translate(context),
              ),
              DescriptionText(
                text:TKeys.Terms_desc4.translate(context),
              ),
              DescriptionText(
                text: TKeys.Terms_desc5.translate(context),
              ),
              DescriptionText(
                text:TKeys.Terms_desc6.translate(context),
              ),
              DescriptionText(
                text: TKeys.Terms_desc7.translate(context),
              ),
              SizedBox(height: 15,),
              HeadingText(
                text: TKeys.Taillz_heading.translate(context),
              ),
              SizedBox(
                height: 15,
              ),
            
              DescriptionText(
                text:  TKeys.Taillzdef1.translate(context),
              ),DescriptionText(
                text: TKeys.Taillzdef2.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef3.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef4.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef5.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef6.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef7.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef8.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef9.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef10.translate(context),
              ),DescriptionText(
                text:  TKeys.Taillzdef11.translate(context),
              ),DescriptionText(
                text: TKeys.Taillzdef12.translate(context),
              ),DescriptionText(
                text: TKeys.Taillzdef13.translate(context),
              ),
              DescriptionText(
                text:  TKeys.Taillzdef14.translate(context),
              ),
              DescriptionText(
                text:  TKeys.Taillzdef15.translate(context),
              ),
              DescriptionText(
                text:  TKeys.Taillzdef16.translate(context),
              ),
                DescriptionText(
                text: TKeys.Taillzdef17.translate(context),
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text: TKeys.Whosallowed.translate(context),
              ),
              SizedBox(height: 15,),
              DescriptionText(
                text: TKeys.Whosallowed1.translate(context),
              ),
              DescriptionText(
                text:TKeys.Whosallowed2.translate(context),
              ),
              DescriptionText(
                text: TKeys.Whosallowed3.translate(context),
              ),DescriptionText(
                text:TKeys.Whosallowed4.translate(context),
              ),DescriptionText(
                text: TKeys.Whosallowed5.translate(context),
              ),
              DescriptionText(
                text: TKeys.Whosallowed6.translate(context),
              ),
              SizedBox(height: 15,),
              HeadingText(
                text:TKeys.acknowledge_and_agree.translate(context)
              ),
              SizedBox(height: 15,),
              DescriptionText(
                text:TKeys.tailzactivity1.translate(context)
              ),
              DescriptionText(
                text: TKeys.tailzactivity2.translate(context)
              ),DescriptionText(
                text: TKeys.tailzactivity3.translate(context)
              ),DescriptionText(
                text: TKeys.tailzactivity4.translate(context)
              ),DescriptionText(
                text: TKeys.tailzactivity5.translate(context)
              ),DescriptionText(
                text: TKeys.tailzactivity6.translate(context)
              ),DescriptionText(
                text:TKeys.tailzactivity7.translate(context)
              ),
              DescriptionText(
                text: TKeys.tailzactivity8.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text:TKeys.responsibility.translate(context)
              ),
              SizedBox(height: 15,),
              DescriptionText(
                text:TKeys.responsibility1.translate(context)
              ),
              DescriptionText(
                text: TKeys.responsibility2.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility3.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility4.translate(context)
              ),DescriptionText(
                text:TKeys.responsibility5.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility6.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility7.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility8.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility9.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility10.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility11.translate(context)
              ),DescriptionText(
                text: TKeys.responsibility12.translate(context)
              ),DescriptionText(text: TKeys.responsibility13.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text:TKeys.Mobile_Features.translate(context)
              ),
              SizedBox(height: 15),
              DescriptionText(
                text: TKeys.Mobile_Features1.translate(context)
              ),
              DescriptionText(
                text: TKeys.Mobile_Features2.translate(context)
              ), DescriptionText(
                text: TKeys.Mobile_Features3.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text: TKeys.Terminating_and_shutting_acc.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              DescriptionText(
                text: TKeys.Terminating_desc1.translate(context)
              ),
              DescriptionText(
                text: TKeys.Terminating_desc2.translate(context)
              ),
              DescriptionText(
                text:TKeys.Terminating_desc3.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text: TKeys.Feedback.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              DescriptionText(
                text:TKeys.Feedback1.translate(context)
              ),
              DescriptionText(
                text: TKeys.Feedback2.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text:TKeys.Trademarks.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              DescriptionText(
                text: TKeys.Trademarks1.translate(context)
              ),
              DescriptionText(
                text: TKeys.Trademarks2.translate(context)
              ),DescriptionText(
                text: TKeys.Trademarks3.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text: TKeys.Privacy_updates_time_to_time.translate(context)
              ),
              SizedBox(
                height: 15,
              ),
              DescriptionText(
                text:TKeys.Privacy_updates_time_to_time1.translate(context)
              ),
              DescriptionText(
                text:TKeys.Privacy_updates_time_to_time2.translate(context)
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
