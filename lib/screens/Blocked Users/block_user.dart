import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/screens/mainScreen.dart';

class BlockedUser extends StatefulWidget {
  const BlockedUser({Key key}) : super(key: key);

  @override
  _BlockedUserState createState() => _BlockedUserState();
}

class _BlockedUserState extends State<BlockedUser> {
  int selectedvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff121556),
            )),
        backgroundColor: Colors.transparent,
        title: Text(
          TKeys.report_block.translate(context),
        ),
        foregroundColor: Color(0xff121556),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            TKeys.please_select_reason.translate(context),
            style: GoogleFonts.montserrat(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: RadioListTile(
                title: Text(
                  TKeys.hate_speech.translate(context),
                  style:
                      GoogleFonts.montserrat(fontSize: 15, color: Colors.black),
                ),
                value: 0,
                groupValue: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    selectedvalue = 0;
                  });
                }),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: RadioListTile(
                title: Text(
                  TKeys.spamming_terror.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                value: 1,
                groupValue: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    selectedvalue = 1;
                  });
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  TKeys.report_and_block.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  TKeys.report.translate(context),
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.black,
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
