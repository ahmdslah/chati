import 'package:chati/const/otp_fialds.dart';
import 'package:chati/const/routes.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SignupOtp extends StatefulWidget {
  // String? phone;
  SignupOtp({super.key});

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  String countryname = "🇪🇬";
  bool isChecked = false;
  final controllers = List.generate(4, (_) => TextEditingController());
  String? code;
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  int _seconds = 60;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  Widget build(BuildContext context) {
    // final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 244, 244),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Rectangle-open.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "login");
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_sharp),
                            Text(
                              "   Login",
                              style: TextStyle(
                                color: Color(0xff1565C0),
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Enter OTP Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text("Sent To: ${widget.phone!}"),
                  Text("Sent To: +201097801940"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timelapse, size: 30),
              Text(
                _seconds > 0 ? "   $_seconds" : "  00:00",
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    decoration: TextDecoration.underline, // ✅ underline
                    color: Colors.blue, // لون النص
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Center(child: OtpFields(controllers: controllers)),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("OTP is: $code"),
              IconButton(
                onPressed: () {
                  code = controllers.map((c) => c.text).join();

                  // Navigator.pushReplacementNamed(context, Routes.signupOtp);
                },
                icon: Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.blueAccent,
                  size: 65,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
        // ممكن تعمل أي حاجة هنا لما الوقت يخلص
        print("Countdown finished!");
      }
    });
  }
}
