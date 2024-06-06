import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_e_commerce/App/Widgets/dokan_custom_button.dart';
import 'package:test_e_commerce/App/Widgets/dokan_form_field.dart';
import '../../Provider/Authentication/authentication_provider.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';




class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  dynamic authenticationProvider;
  final registerKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authenticationProvider = ref.watch(authenticationController);

  }
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
          child: Form(
            key: registerKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset("assets/images/profile.png",  height: 150)),
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
                        enabled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/Svg/person.svg", height: 5,width: 5,),
                        ),
                        obscureText: false,
                        hint: "Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name field cannot be empty';
                          } else if (value.length < 3) {
                            return 'Name field cannot be less than 3';
                          }
                          return null;
                        },
                        maxLines: 1,
                        controller: authenticationProvider.nameController,
                        textInputType: TextInputType.text,
                        onFieldSubmitted: (string) {
                          FocusScope.of(context).requestFocus(
                              authenticationProvider.textformFeildFocusNode);
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
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
                          child: SvgPicture.asset("assets/Svg/Email.svg", height: 5,width: 5,),
                        ),
                        obscureText: false,
                        hint: "Email",
                        maxLines: 1,
                        controller: authenticationProvider.emailController,
                        textInputType: TextInputType.text,
                        validator: _validateEmail,
                        onFieldSubmitted: (string) {
                          FocusScope.of(context).requestFocus(
                              authenticationProvider.textformFeildFocusNode);
                          return null;
                        },

                      ),
                    ),
                  ),
                ),
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
                          child: SvgPicture.asset("assets/Svg/Password.svg", height: 5,width: 5,),
                        ),

                        hint: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password field cannot be empty';
                          } else if (value.length < 6) {
                            return 'password must be 6 digit long';
                          }



                          return null;
                        },
                        maxLines: 1,
                        onFieldSubmitted: (string) {
                          FocusScope.of(context).requestFocus(
                              authenticationProvider.textformFeildFocusNode);
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        controller: ref.watch(authenticationController).passwordController,
                        obscureText: ref.watch(authenticationController).passwordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            authenticationProvider.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ThemeStyles.primary,
                            size: 18,
                          ),
                          onPressed: () {

                            setState(() {
                              authenticationProvider.passwordVisible =
                              !authenticationProvider.passwordVisible;
                            });
                          },
                        ),

                      ),
                    ),
                  ),
                ),
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
                        maxLines: 1,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/Svg/Password.svg", height: 5,width: 5,),
                        ),
                        hint: "Confirm Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password field cannot be empty';
                          } else if (value.length < 6) {
                            return 'password must be 6 digit long';
                          }



                          return null;
                        },
                        onFieldSubmitted: (string) {
                          FocusScope.of(context).requestFocus(
                              authenticationProvider.textformFeildFocusNode);
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        controller: ref.watch(authenticationController).passwordConfirmationController,
                        obscureText: ref.watch(authenticationController).passwordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            authenticationProvider.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ThemeStyles.primary,
                            size: 18,
                          ),
                          onPressed: () {

                            setState(() {
                              authenticationProvider.passwordVisible =
                              !authenticationProvider.passwordVisible;
                            });
                          },
                        ),

                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                DokanCustomButton(
                  buttonHeight: 60,
                  buttonWidth: 300,
                  onTap: (){
                    if (registerKey.currentState!
                        .validate()) {
                      ref.watch(authenticationController).registration(context:context);
                    }
                  },
                  buttonText: "Sign Up",
                  isLoading: ref.watch(authenticationController).isLoadingRegister,
                  buttonColor: ThemeStyles.primary,
                  borderRadius: 10,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                const SizedBox(height: 30,),
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
                const SizedBox(height: 30,),
             Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const DokanTextWidget(
                        text: "Already have an account?",
                        fontSize: 16,
                        color: ThemeStyles.primaryTextColor,
                      ),
                    const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          context.push('/loginScreen');
                        },
                        child: const DokanTextWidget(
                          text: "Login",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),),


              ],
            ),
          ),
        ),
      )

    ));
  }
}
