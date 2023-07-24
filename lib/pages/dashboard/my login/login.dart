import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qrscaner/utils/colors.dart';
import 'package:qrscaner/utils/main_body.dart';
import 'package:qrscaner/widgets/common_button.dart';
import 'package:qrscaner/widgets/common_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
        appbarTitleName: 'Login',
        content: Container(
          child: SingleChildScrollView(child: Consumer(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        color: kPrimaryBlue,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 1,
                        //     // color: Colors.black,
                        //   ),
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //       // color: Colors.black26,
                                //       ),
                                //   borderRadius: BorderRadius.circular(100),
                                // ),
                                child: Image.asset(
                                  'assets/images/login_icon.jpeg',
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CommonInput(
                                        hintText: 'Enter Vaid Email',
                                        lableText: 'Email Address',
                                        filled: true,
                                        backgroundcolor: kScafolderColor,
                                        suffix: Icon(
                                          Icons.person,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CommonInput(
                                        hintText: 'Enter Password',
                                        lableText: 'Enter Password',
                                        filled: true,
                                        backgroundcolor: kScafolderColor,
                                        suffix: Icon(
                                          Icons.password,
                                        ),
                                      ),
                                    ),
                                    CommonButton(
                                      onPress: () {},
                                      btnCaption: 'Sign In',
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              );
            },
          )),
        ));
  }
}
