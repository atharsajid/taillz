import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taillz/Localization/t_keys.dart';


class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Me,5LikeUser (38)',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                'assets/images/man.png',
                height: 35,
                fit: BoxFit.cover,
              ),
              title: Row(
                children: [
                  Text(
                    '5LikeUser',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '10.30.2019',
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ],
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 130, start: 35),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
               
                      offset: Offset(0,3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      'Hi how are you?',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 30,
              ),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  '30.10.2019 Me',
                  style: GoogleFonts.montserrat(fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 20, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffafafa),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                     offset: Offset(0,3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Card(
                  color: Color(0xffffafafa),
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      'Hi',
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xfffFAFAFA),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: TKeys.message_text.translate(context),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xfffFAFAFA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                             TKeys.Send_text.translate(context),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
