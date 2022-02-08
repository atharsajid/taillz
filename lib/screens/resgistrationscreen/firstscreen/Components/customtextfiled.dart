import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final String hinttext;
  final bool obsecuretext;
  TextEditingController textcontroller;
  CustomTextFiled({
    Key key,
    this.hinttext,
    this.obsecuretext,
    this.textcontroller,
  }) : super(key: key);

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              // // boxShadow: [
              // //    BoxShadow(
              // //     color: Color(0xfffe8e8e8),
              // //     blurRadius: 0,
              // //     spreadRadius: 0,
              // //      offset: Offset(0.1,1.5),
              // //   ),
              // ],
              ),
          child: TextFormField(
            controller: widget.textcontroller,
            obscureText: widget.obsecuretext,
            decoration: InputDecoration(
              hintText: widget.hinttext,
              fillColor: Colors.white,
              filled: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
