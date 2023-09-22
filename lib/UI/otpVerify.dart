

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pinput/pinput.dart';


class SignupOtpVerificationActivity extends StatefulWidget {
  final String phone_num;
  SignupOtpVerificationActivity({
required this.phone_num,}
      );
  @override
  State<SignupOtpVerificationActivity> createState() =>
      SignupOtpVerificationActivityState(
  );
}

class SignupOtpVerificationActivityState
    extends State<SignupOtpVerificationActivity> {

  SignupOtpVerificationActivityState();

  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();

  String Verificationcode = "";


  @override
  void initState() {
    super.initState();
  }

  void onEnd() {
    print('onEnd');
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Color(0xffFE9426)),
      borderRadius: BorderRadius.circular(5.0),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
        Container(
        height: MediaQuery
            .of(context)
            .size
            .height/8,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, top: 35),
          child: Text(
              "OTP Verify",
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 30, color: Color(0xffFE9426),fontWeight: FontWeight.w800),
              )
          )),Image1(), OtpVerificationBack2()],
        ),
      ),
    );
  }

  Widget Image1() {
    return ClipRRect(

      child: Container(
        height: 300,
        child: Image(


                  image: AssetImage(
                      "assets/images/vecteezy_silhouette-men-and-women-disco-dance-on-white-background_6730574.jpg")),
      ));

  }

  Widget OtpVerificationBack2() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OtpVerificationBack2in2()
        ],
      ),
    );
  }

  Widget backicon() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 5),
        child: Icon(Icons.arrow_back, color: Colors.black,),
      ),
    );
  }


  Widget OtpVerificationBack2in2() {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            OtpVerificationBack2in2in1(),
            OtpVerificationBack2in2in2(),
            OtpVerificationBack2in2in3(),
            ForgtContinue(),
            Terms(),
          ],
        ),
      ),
    );
  }

  Widget OtpVerificationBack2in2in1() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 25),
            child: Text(
              "OTP sent to",
            style: GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 20, color: Color(0xffFE9426),fontWeight: FontWeight.w600),
    )),),
        Container(
            margin: EdgeInsets.only(left: 20, top: 25),
            child: Text(
              widget.phone_num,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(fontSize: 23, color: Color(0xffFE9426),fontWeight: FontWeight.w700),
                )),),
      ],
    );
  }

  Widget OtpVerificationBack2in2in2() {
    return Container(

      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Pinput(
        length: 4,
        onSubmitted: (String pin) {},
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        // textStyle: TextStyle(color: Colors.white),
        defaultPinTheme: PinTheme(height: 45,
          width: 60,
          textStyle: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 18,color: Color(0xFF4E4E4E),fontWeight: FontWeight.w500),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xffFE9426),
            border: Border.all(color: Color(0xffFE9426)),
          ),),
        submittedPinTheme: PinTheme(
          height: 45,
          width: 60,
          textStyle: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 18,color: Color(0xFF4E4E4E),fontWeight: FontWeight.w500),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xffFE9426),
            border: Border.all(color: Color(0xffFE9426)),
          ),),
        focusedPinTheme: PinTheme(decoration: _pinPutDecoration,
          width: 60,
          height: 45,
          textStyle: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 18,color: Color(0xFF4E4E4E),fontWeight: FontWeight.w500),
          ),),
        followingPinTheme: PinTheme(width: 60,
            height: 45,
            textStyle: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 18,color: Color(0xFF4E4E4E),fontWeight: FontWeight.w500),
            ),
            decoration: _pinPutDecoration.copyWith(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFEBE7E7),
              border: Border.all(color: Colors.black),
            )),),
    );
  }


  Widget OtpVerificationBack2in2in3() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        ],
      ),
    );
  }




  Widget ForgtContinue() {
    return Container(
      width: 300,


      margin: EdgeInsets.only(top: 30),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xffFE9426),

          onPressed: () async {
            if (_pinPutController.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Color(0xffFE9426),
                content: Text("Please Enter OTP"),
              ));
            } else {
              // Show the confirmation dialog when OTP is verified
              showConfirmationDialog(context);
            }
          },
          shape: StadiumBorder(), label: Text(
          "Verify OTP ",
          style: GoogleFonts.inter(
        textStyle: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w600),
        )
        ),
        ),
      ),
    );
  }
  Widget Terms() {
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

}
void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Confirmation!"),
        titleTextStyle: GoogleFonts.inter(
          textStyle: TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w500),
        ),
        content: Text("Your details has been submitted",
        style: GoogleFonts.inter(
          textStyle: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w500),
        ),),
        actions: [
          TextButton(
            onPressed: () {

              Navigator.of(context).pop();
            },
            child: Text("Got it",
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w600),
              ),),
          ),
        ],
      );
    },

  );
}

