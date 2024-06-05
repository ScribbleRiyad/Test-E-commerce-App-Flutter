
import '../../Utils/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../Route/route_name.dart';




class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {


  @override
  void initState() {
    getData();

    super.initState();
  }



  Future<void> getData() async {

    Future.delayed(const Duration(seconds: 3), () {

        context.goNamed(RouteName.registrationScreen);




    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeStyles.scaffoldBackground,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Image.asset("assets/images/Logo.png",  height: 100, width: 200,),
        ),
      ),
    );
  }
}
