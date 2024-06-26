import 'package:flutter_svg/svg.dart';
import 'package:test_e_commerce/App/Widgets/dokan_text_widget.dart';
import '../../Provider/Authentication/authentication_provider.dart';
import '../../Utils/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Widgets/dokan_custom_button.dart';
import '../../Widgets/dokan_form_field.dart';



class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  dynamic authenticationProvider;
  final authenticationKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authenticationProvider = ref.watch(authenticationController);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: authenticationKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset(
                    "assets/images/Logo.png", height: 80, width: 200,)),
                  const SizedBox(height: 50,),
                  const DokanTextWidget(
                    text: "Sign In",
                    color: ThemeStyles.blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,),
                  const SizedBox(height: 20,),
                  Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 1,
                    child: SizedBox(
                      height: 55,
                      child: Center(
                        child: DokanCustomTextFormField(

                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/Svg/Email.svg", height: 5, width: 5,),
                          ),
                          hint: "User Name",
                          controller: authenticationProvider.userNameController,
                          maxLines: 1,
                          obscureText: false,
                          onFieldSubmitted: (string) {
                            FocusScope.of(context).requestFocus(
                                authenticationProvider.textformFeildFocusNode);
                            return null;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your User Name Correctly';
                            }
                            return null;
                          },
                      ),
                    ),
                  ),),
                  const SizedBox(height: 8,),
                  Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),

                    elevation: 1,
                    child: SizedBox(
                      height: 55,
                      child: Center(
                        child: DokanCustomTextFormField(
                          enabled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/Svg/Password.svg", height: 5, width: 5,),
                          ),
                          controller: authenticationProvider.userPasswordController,
                          hint: "Password",
                          maxLines: 1,
                          obscureText: ref.watch(authenticationController).passwordVisible,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password Correctly';
                            }
                            return null;
                          },
                          onFieldSubmitted: (string) {
                            FocusScope.of(context).requestFocus(
                                authenticationProvider.textformFeildFocusNode);
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon:  Icon(
                              // Based on passwordVisible state choose the icon
                              ref.watch(authenticationController).passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18,

                              color: ThemeStyles.primary,
                            ),

                            onPressed: () {

                              setState(() {
                                ref.watch(authenticationController).passwordVisible =
                                !ref.watch(authenticationController).passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: DokanTextWidget(
                      text: "Forgot Password?",
                      fontSize: 13,
                      color: ThemeStyles.secondaryTextColor,
                    ),),
                  const SizedBox(height: 50,),
                  DokanCustomButton(
                    buttonHeight: 60,
                    buttonWidth: 300,
                    onTap: (){
                      if (authenticationKey.currentState!
                          .validate()) {
                        ref.watch(authenticationController).login(context:context);
                      }
                    },
                    buttonText: "Login",

                    isLoading: ref.watch(authenticationController).isLoginLoading,
                    buttonColor: ThemeStyles.primary,
                    borderRadius: 10,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 1,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeStyles.whiteColor
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/facebook-logo.png",

                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 1,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeStyles.whiteColor
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 50,),
                  const Align(
                    alignment: Alignment.center,
                    child: DokanTextWidget(
                      text: "Create New Account",
                      fontSize: 18,
                      color: ThemeStyles.primaryTextColor,
                    ),),


                    ],
              ),
            ),
          ),
        )

    ));
  }
}