
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../Provider/Home/home_provider.dart';
import '../Utils/theme_styles.dart';
import '../Widgets/dokan_text_widget.dart';
import 'navigation/widgets/custom_bottom_navigation_bar.dart';



class ApplicationScreen extends ConsumerStatefulWidget {
  const ApplicationScreen({super.key});

  @override
  ConsumerState<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends ConsumerState<ApplicationScreen> {

  final PageStorageBucket bucket = PageStorageBucket();
  dynamic homeScreenProvider;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeScreenProvider = ref.watch(homeScreenController);


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              context.push("/allProductScreen");
            },
            backgroundColor: ThemeStyles.primary,
            child: SvgPicture.asset(
                'assets/Svg/Search.svg',
                height: 25,
              color: ThemeStyles.whiteColor,
                )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: PageStorage(
          bucket: bucket,
          child: ref
              .watch(homeScreenController)
              .pageList
              .elementAt(ref.watch(homeScreenController).currentIndex),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 70,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,

          child: DokanBottomNavigationBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  setState(() {
                    ref
                        .watch(homeScreenController)
                        .setPageIndex(index: index);
                  });
                  break;

                case 1:
                  setState(() {
                    ref
                        .watch(homeScreenController)
                        .setPageIndex(index: index);

                  });
                  break;
                case 2:
                  setState(() {
                    ref
                        .watch(homeScreenController)
                        .setPageIndex(index: index);

                  });
                  break;
                case 3:
                  setState(() {
                    ref
                        .watch(homeScreenController)
                        .setPageIndex(index: index);

                  });
                  break;

              }
            },
            items: [
              DokanNavigationBarItem(
                  topIcon: ref.watch(homeScreenController).currentIndex == 0
                      ? Container(
                    height: 2,
                    padding: const EdgeInsets.all(10.0),
                    color: ThemeStyles.primary,
                  )
                      : Container(
                    height: 2,
                    padding: const EdgeInsets.all(10.0),

                  ),
                  icon: ref.watch(homeScreenController).currentIndex == 0
                      ? SvgPicture.asset(
                      'assets/Svg/HomeFill.svg',
                      height: 22,
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                          ThemeStyles.primary, BlendMode.srcIn))
                      : SvgPicture.asset(
                      'assets/Svg/Home.svg',
                      height: 22,
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                          ThemeStyles.blackColor, BlendMode.srcIn)),
                  title: DokanTextWidget(
                    text: "Home",
                    fontSize: 12,
                    fontWeight:
                    ref.watch(homeScreenController).currentIndex == 0
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color:ref. watch(homeScreenController).currentIndex == 0
                        ? ThemeStyles.primary : ThemeStyles.blackColor,
                  ),
                  bottomIcon:
                  SvgPicture.asset('assets/Svg/play.svg',
                      height: 14,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                          ref.watch(homeScreenController).currentIndex == 0?  ThemeStyles.primary : ThemeStyles.whiteColor, BlendMode.srcIn))
              ),
              DokanNavigationBarItem(
                  topIcon: ref.watch(homeScreenController).currentIndex == 1
                      ? Container(
                    height: 2,
                    padding: const EdgeInsets.all(10.0),
                    color: ThemeStyles.primary,
                  )
                      : Container(
                    height: 2,
                    padding: const EdgeInsets.all(10.0),

                  ),
                  icon: ref.watch(homeScreenController).currentIndex == 1
                      ? SvgPicture.asset(
                      'assets/Svg/CategoryFill.svg',
                      height: 22,
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                          ThemeStyles.primary, BlendMode.srcIn))
                      : SvgPicture.asset(
                      'assets/Svg/Category.svg',
                      height: 22,
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                          ThemeStyles.blackColor, BlendMode.srcIn)),
                  title: DokanTextWidget(
                    text: "Category",
                    fontSize: 12,
                    fontWeight:
                    ref.watch(homeScreenController).currentIndex == 1
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: ref.watch(homeScreenController).currentIndex == 1
                        ? ThemeStyles.primary : ThemeStyles.blackColor,
                  ),
                  bottomIcon:
                  SvgPicture.asset('assets/Svg/play.svg',
                      height: 14,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                          ref.watch(homeScreenController).currentIndex == 1?  ThemeStyles.primary : ThemeStyles.whiteColor, BlendMode.srcIn))
              ),
              DokanNavigationBarItem(
                  topIcon: ref.watch(homeScreenController).currentIndex == 2
                      ? Container(height: 2, padding: const EdgeInsets.all(10.0), color: ThemeStyles.primary,)
                      : Container(height: 2, padding: const EdgeInsets.all(10.0),
                  ),
                  icon: ref.watch(homeScreenController).currentIndex == 2
                      ? SvgPicture.asset('assets/Svg/CartFill.svg', height: 22, width: 22, colorFilter: const ColorFilter.mode(ThemeStyles.primary, BlendMode.srcIn))
                      : SvgPicture.asset('assets/Svg/Cart.svg', height: 22, width: 22, colorFilter: const ColorFilter.mode(ThemeStyles.blackColor, BlendMode.srcIn)),
                  title: DokanTextWidget(
                    text: "Cart",
                    fontSize: 12,
                    fontWeight:
                    ref.watch(homeScreenController).currentIndex == 2
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: ref.watch(homeScreenController).currentIndex == 2
                        ?  ThemeStyles.primary : ThemeStyles.blackColor,
                  ),
                  bottomIcon:
                  SvgPicture.asset('assets/Svg/play.svg',
                      height: 14,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                          ref.watch(homeScreenController).currentIndex == 2?  ThemeStyles.primary : ThemeStyles.whiteColor, BlendMode.srcIn))
              ),
              DokanNavigationBarItem(
                  topIcon: ref.watch(homeScreenController).currentIndex == 3
                      ? Container(height: 2, padding: const EdgeInsets.all(10.0), color: ThemeStyles.primary,)
                      : Container(height: 2, padding: const EdgeInsets.all(10.0),
                  ),
                  icon: ref.watch(homeScreenController).currentIndex == 3
                      ? SvgPicture.asset('assets/Svg/Userfill.svg', height: 22, width: 22, colorFilter: const ColorFilter.mode(ThemeStyles.primary, BlendMode.srcIn))
                      : SvgPicture.asset('assets/Svg/User.svg', height: 22, width: 22, colorFilter: const ColorFilter.mode(ThemeStyles.blackColor, BlendMode.srcIn)),
                  title: DokanTextWidget(text: "Profile", fontSize: 12, fontWeight:
                  ref.watch(homeScreenController).currentIndex == 3
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: ref.watch(homeScreenController).currentIndex == 3
                        ? ThemeStyles.primary : ThemeStyles.blackColor,
                  ),
                  bottomIcon:
                  SvgPicture.asset('assets/Svg/play.svg',
                      height: 14,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                          ref.watch(homeScreenController).currentIndex == 3?  ThemeStyles.primary : ThemeStyles.whiteColor, BlendMode.srcIn))
              ),

            ],
            selectedIndex: ref.watch(homeScreenController).currentIndex,
            unSelectedColor: ThemeStyles.disabledColor,
            selectedColor: ThemeStyles.primary,
            labelStyle: const TextStyle(fontSize: 16),

          ),
        )
    );
  }
}


showCustomDialog( {required context}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 100),
    pageBuilder: (_, __, ___) {
      return StatefulBuilder(builder: (context, setState) {
        return Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox.expand(
                child: Column(
                  children: [
                    Lottie.asset('assets/images/lottie/close.json',
                        height: 70, width: 70),
                    const SizedBox(height: 10,),
                    const DokanTextWidget(
                      text: "Are you sure you want to Exit the Application",
                      maxLines: 3,
                      color: ThemeStyles.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
    },
    transitionBuilder: (_, anim, __, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

