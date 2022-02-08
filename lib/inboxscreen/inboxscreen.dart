import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/inboxscreen/messagescreen.dart';


class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TKeys.inbox_text.translate(context),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,
            fontSize: 14,
            color: Color(0xff19334D),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff19334D),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MessageScreen()));
                },
                leading: Image.asset(
                  'assets/images/man.png',
                  height: 35,
                ),
                title: Row(
                  children: [
                    Text(
                      '5LikeUser (38)',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'sep 30.2020',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                trailing: PopupMenuButton<int>(
                  iconSize: 35,
                  key: key,
                  itemBuilder: (context) {
                    return <PopupMenuEntry<int>>[
                      PopupMenuItem(
                        child: Text(
                         TKeys.delete_conversion.translate(context)
                        ),
                      ),
                      PopupMenuItem(
                        child: Text(TKeys.report_User.translate(context)),
                      ),
                      PopupMenuItem(
                        child: Text(TKeys.block_User.translate(context)),
                      ),
                    ];
                  },
                ),
                subtitle: Text(
                  'Hi',
                  style: GoogleFonts.montserrat(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
