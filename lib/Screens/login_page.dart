import 'package:chati/Screens/signup_page.dart';
import 'package:chati/const/routes.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();
  String countryname = "🇪🇬";
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 244, 244),

      body: Column(
        children: [
          !isKeyboardOpen
              ? Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Row(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.signup,
                              );
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Color(0xff1565C0),
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Enter Your Mobile Phone",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : Container(
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
                    children: [
                      SizedBox(height: 80),
                      Row(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.signup,
                              );
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Color(0xff1565C0),
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Enter Your Mobile Phone",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(height: 20),
          Text(
            "You Will get a code via sms",
            style: TextStyle(
              color: Color(0xff1B526B),
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true, // لإظهار رمز الدولة
                    onSelect: (Country country) {
                      countryname = country.flagEmoji;
                      phone.text = "+${country.phoneCode}";
                      print(country.flagEmoji);
                      setState(() {});
                    },
                  );
                },
                icon: Text(countryname, style: TextStyle(fontSize: 25)),
              ),
              Expanded(
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
              Text(
                "Remember Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
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
}
