import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final Widget prefixicon;
  final Widget suffixicon;
  final String hintText;
  final bool obsecure;
  
  final TextEditingController controller;
  CustomTextFormFiled({
    Key key,
    this.prefixicon,
    this.suffixicon,
    this.hintText,
    this.obsecure,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20,),
            child: Container(
              height: 55,
              child: TextFormField(
                
                style: TextStyle(color: Colors.black,fontSize: 14),
                controller: controller,
                obscureText: obsecure,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                  hintText: hintText,
                  prefixIcon: prefixicon,
                  suffixIcon: suffixicon,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomEmailTextFormFiled extends StatelessWidget {
  final Widget prefixicon;
  final Widget suffixicon;
  final String hintText;
  final bool obsecure;
  
  final TextEditingController controller;
  CustomEmailTextFormFiled({
    Key key,
    this.prefixicon,
    this.suffixicon,
    this.hintText,
    this.obsecure,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20,),
            child: Container(
              height: 55,
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black,fontSize: 14),
                controller: controller,
                obscureText: obsecure,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                  hintText: hintText,
                  prefixIcon: prefixicon,
                  suffixIcon: suffixicon,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

