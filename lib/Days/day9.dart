import 'package:design_projects/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StateMachineController? stateMachineController;
  bool _hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  late String animationUrl;
  Artboard? puppyArtBoard;
  SMITrigger? minimizeTrigger, shakeTrigger;
  SMIBool? isListening, isProcessing;

  @override
  void initState() {
    super.initState();
    animationUrl = 'assets/animations/puppy.riv';

    RiveFile.initialize().then((_) {
      rootBundle.load(animationUrl).then((data) {
        final file = RiveFile.import(data);
        final artBoard = file.mainArtboard;

        stateMachineController =
            StateMachineController.fromArtboard(artBoard, 'State Machine 1');

        if (stateMachineController != null) {
          artBoard.addController(stateMachineController!);

          stateMachineController!.inputs.forEach(
            (element) {
              if (element.name == 'Shake') {
                shakeTrigger = element as SMITrigger;
              } else if (element.name == 'Minimize') {
                minimizeTrigger = element as SMITrigger;
              } else if (element.name == 'Listening') {
                isListening = element as SMIBool;
              } else if (element.name == 'Processing') {
                isProcessing = element as SMIBool;
              }
            },
          );
        } else {
          print('Failed to create State Machine Controller');
        }

        setState(() {
          puppyArtBoard = artBoard;
        });
      });
    });

    // Listen for focus changes
    emailFocusNode.addListener(_handleFocusChange);
    passwordFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!emailFocusNode.hasFocus && !passwordFocusNode.hasFocus) {
      isNotLooking(); // Call this when both fields lose focus
    }
  }

  void loginFailed() {
    shakeTrigger?.fire();
  }

  void onTextFieldActive() {
    isListening?.change(true);
  }

  void isNotLooking() {
    isListening?.change(false);
  }

  void startProcessing() {
    isProcessing?.change(true);
  }

  void stopProcessing() {
    isProcessing?.change(false);
  }

  void _unfocusAndStopLooking() {
    FocusScope.of(context).unfocus();
    isNotLooking();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusAndStopLooking,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue.withOpacity(0.4),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: Get.height * 0.28,
                        width: Get.height * 0.28,
                        child: puppyArtBoard == null
                            ? null
                            : Rive(
                                artboard: puppyArtBoard!,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.height * 0.03,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Get.height * 0.03),
                            topRight: Radius.circular(Get.height * 0.03),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            MyText(
                              'Log - in',
                              fontSize: Get.height * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.height * 0.02,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  MyText(
                                    'Email',
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextField(
                                    controller: emailController,
                                    focusNode: emailFocusNode,
                                    onTap: onTextFieldActive,
                                    decoration: InputDecoration(
                                      hintText: "Your email id",
                                      hintStyle: TextStyle(
                                        fontSize: Get.height * 0.02,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  MyText(
                                    'Password',
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextField(
                                    controller: passwordController,
                                    focusNode: passwordFocusNode,
                                    obscureText: _hidePassword,
                                    onTap: onTextFieldActive,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontSize: Get.height * 0.02,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _hidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black54,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _hidePassword = !_hidePassword;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyText(
                                        'Forgot Password?',
                                        fontSize: Get.height * 0.02,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.04,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      startProcessing();
                                      Future.delayed(
                                        Duration(seconds: 3),
                                        () {
                                          if (emailController.text == "ahmed" &&
                                              passwordController.text ==
                                                  "ahmed") {
                                            stopProcessing();
                                          } else {
                                            loginFailed();
                                            stopProcessing();
                                          }
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: Get.height * 0.075,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(
                                          Get.height * 0.03,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: MyText(
                                        'Login',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Get.height * 0.03,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Don't have an account? ",
                                          style: TextStyle(
                                            fontSize: Get.height * 0.02,
                                            fontWeight: FontWeight.w500,
                                            color: Colors
                                                .black, // Default text color
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "Sign-up",
                                              style: TextStyle(
                                                fontSize: Get.height * 0.02,
                                                fontWeight: FontWeight.w500,
                                                color: Colors
                                                    .blue, // Blue color for "Sign-up"
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
