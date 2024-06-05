import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_custom_button.dart';
import '../../Widgets/dokan_form_field.dart';
import '../../Widgets/dokan_text_widget.dart';




class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Center(child: DokanTextWidget(text: "My Account", color: ThemeStyles.blackColor, fontWeight: FontWeight.bold, fontSize: 24,)),
            const SizedBox(height: 10,),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/Oval.png" ,height: 120,),
                Image.asset("assets/images/Oval2.png", height: 100,),
              ],
            ),
            const SizedBox(height: 10,),
            const Center(child: DokanTextWidget(text: "MD. RIYAD MAHMUD", color: ThemeStyles.blackColor, fontWeight: FontWeight.bold, fontSize: 18,)),
            const SizedBox(height: 5,),
            const Center(child: DokanTextWidget(text: "riyadmahmud817@gmail.com", color: ThemeStyles.blackColor, fontSize: 14,)),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                elevation: 3,
                child: Container(

                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                        color: Colors.black.withOpacity(0.04),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      ProfileListTile(
                          title: 'Account',
                          icon:   'assets/Svg/person.svg',
                          onTap: () {
                             setState(() {
                               onTap = !onTap;
                             });
                          }
                      ),
                      const Divider(thickness: 0.1),
                      Visibility(
                        visible: onTap ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: DokanTextWidget(text: "Email", color: ThemeStyles.blackColor, fontSize: 14,)),

                              const SizedBox(height: 10,),
                              const DokanCustomTextFormField(
                                enabled: true,
                                fillColor: ThemeStyles.scaffoldBackground,
                                horizontalPadding: 10,

                                obscureText: false,
                                hint: "riyadmahmud817@gmail.com",

                              ),
                              const SizedBox(height: 15,),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: DokanTextWidget(text: "Full Name", color: ThemeStyles.blackColor, fontSize: 14,)),
                              const SizedBox(height: 10,),
                              const DokanCustomTextFormField(
                                enabled: true,
                                fillColor: ThemeStyles.scaffoldBackground,
                                horizontalPadding: 10,
                                obscureText: false,
                                hint: "MD. RIYAD MAHMUD",

                              ),
                              const SizedBox(height: 15,),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: DokanTextWidget(text: "Address", color: ThemeStyles.blackColor, fontSize: 14,)),
                              const SizedBox(height: 10,),
                              const DokanCustomTextFormField(
                                enabled: true,
                                horizontalPadding: 10,
                                fillColor: ThemeStyles.scaffoldBackground,

                                obscureText: false,
                                hint: "Dhaka Bangladesh",

                              ),
                              const SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DokanCustomButton(
                                    buttonHeight: 50,
                                    buttonWidth: 120,
                                    onTap: () {},
                                    buttonText: "Cancel",
                                    isLoading: false,
                                    buttonColor: ThemeStyles.scaffoldBackground,
                                    borderColor: ThemeStyles.blackColor,
                                    borderRadius: 10,
                                    textColor: ThemeStyles.blackColor,
                                    fontSize: 18,
                                  ),
                                  const SizedBox(width: 20,),
                                  DokanCustomButton(
                                    buttonHeight: 50,
                                    buttonWidth: 120,
                                    onTap: () {},
                                    buttonText: "Save",
                                    isLoading: false,
                                    buttonColor: ThemeStyles.greenColor,
                                    borderColor: ThemeStyles.whiteColor,
                                    borderRadius: 10,
                                    textColor: ThemeStyles.whiteColor,
                                    fontSize: 18,
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                      ProfileListTile(
                          title: 'Password',
                          icon: 'assets/Svg/Password.svg',
                          onTap: (){



                          }
                      ),
                      const Divider(thickness: 0.1),
                      ProfileListTile(
                          title: 'Notifications',
                          icon: 'assets/Svg/notification.svg',
                          onTap:() {

                          }
                      ),
                      const Divider(thickness: 0.1),
                      ProfileListTile(
                          title: 'Wishlist (00)',
                          icon: 'assets/Svg/heart.svg',
                          onTap: () {

                          }
                      ),
                      const Divider(thickness: 0.1),
                      ProfileListTile(
                          title: 'Logout',
                          icon: 'assets/Svg/logout.svg',
                          onTap: (){
                            // profileScreenProvider.logout(context: context);
                            // ref.watch(homeScreenController).setPageIndex(index: 0);
                          }
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            )
        
          ],
        ),
      ),

    ));
  }
}
class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final void Function() onTap;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const SizedBox(width: 5),
              SvgPicture.asset(icon, height: 25, ),
              const SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
              const Spacer(),
              SvgPicture.asset('assets/Svg/arrow.svg', height: 20, width: 10, ),
            ],
          ),
        ),
      ),
    );
  }
}

