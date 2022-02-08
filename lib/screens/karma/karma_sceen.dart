import 'package:flutter/material.dart';
import 'package:taillz/Localization/t_keys.dart';


class KarmaScreen extends StatefulWidget {
  const KarmaScreen({Key key}) : super(key: key);

  @override
  _KarmaScreenState createState() => _KarmaScreenState();
}

class _KarmaScreenState extends State<KarmaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 75,
            ),
            width: double.infinity,
          ),
          Text(
          TKeys.our_way.translate(context),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              TKeys.write_nice_comment.translate(context),
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
             Text(
            TKeys.your_credit.translate(context),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              TKeys.you_can_redeem.translate(context),
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
          ),
             Text(
          TKeys.comming_soon.translate(context),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
