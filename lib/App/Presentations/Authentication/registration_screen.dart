import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_e_commerce/App/Widgets/dokan_custom_button.dart';
import 'package:test_e_commerce/App/Widgets/dokan_form_field.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';




class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return   SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
          child: Form(
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
                        obscureText: false,
                        hint: "Password",

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
                        obscureText: false,
                        hint: "Confirm Password",

                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                DokanCustomButton(
                  buttonHeight: 60,
                  buttonWidth: 300,
                  onTap: (){},
                  buttonText: "Sign Up",
                  isLoading: false,
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
