import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

import 'otpVerify.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<SignupScreen> {
  var number = TextEditingController();

  late String countrycode = "";

  Timer? _timerForInter;


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
              image: DecorationImage(
                scale: 0.3,
                  image: AssetImage(
                      "assets/images/vecteezy_silhouette-men-and-women-disco-dance-on-white-background_6730574.jpg"))),
          height: MediaQuery
              .of(context)
              .size
              .height/1.15,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Signup2in1(), Signup2()],
          ),
        ),
      ),
    );
  }


  Widget Signup2() {
    return Padding(
      padding: const EdgeInsets.only(top: 300),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Signup2in3(),
                  Signup2in4(),
                  Signup2in3(),
                  Signup2in3(),
                  Signup2in3(),
                  Signup2in8(),
                  Signupin9in2()
                ]),
          ),
        ),
      ),
    );
  }

  Widget Signup2in1() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height/8,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20, top: 25),
        child: Text(
          "Log In",
          style: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 30, color: Color(0xffFE9426),fontWeight: FontWeight.w800),
          )
        ));
  }


  Widget Signup2in3() {
    return Container(
      child: Divider(
        height: 0,
        thickness: 1,
        indent: 20,
        color: Colors.black,
        endIndent: 20,
      ),
    );
  }

  Widget Signup2in4() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 20),
      child: Row(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 48,
                  child: CountryListPick(
                    initialSelection: 'India',
                      appBar: AppBar(
                        backgroundColor: Colors.amber,
                        title: Text('Please Select Country Code'),
                      ),
                      theme: CountryTheme(
                        isShowFlag: false,
                        isShowTitle: false,
                        isShowCode: true,
                        isDownIcon: true,
                        initialSelection: '+27',
                        showEnglishName: true,
                        labelColor: Colors.blueAccent,
                      ),

                  ),
                ),
                Container(
                  height: 1,
                  width: 43,
                  color: Colors.black,
                )
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    foregroundDecoration: BoxDecoration(
                      shape:BoxShape.rectangle,
                    ),
                    child: TextFormField(
                      style:GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 18,color: Color(0xFF4E4E4E),fontWeight: FontWeight.w500),
    ) ,
                      controller: number,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 18,color: Color(0xFF4E4E4E),fontWeight: FontWeight.w500),
    ),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xffFE9426),
                          size: 20,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget Signup2in8() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xffFE9426),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffFE9426),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignupOtpVerificationActivity(phone_num:number.text,),
              ),
            );
          },
          child: Text(
            "Get OTP",
              maxLines: 1,
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),
              )
          ),
        ),
      ),
    );
  }
  Widget Signupin9in2() {
    return Container(
        child: InkWell(
            onTap: () {
            },
            child: Container(
              margin: EdgeInsets.only(top:25,left: 5),
              child: Text(
                "By Singing Up, you agree to our terms and conditions",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            )));
  }





  void RegisterOnSubmit() {
    if (number.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffFE9426),
          content: Text("Please Enter Number")));
    } else if (number.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffFE9426),
          content: Text("Your number must be 10 number")));
    } else {



    }
  }
}