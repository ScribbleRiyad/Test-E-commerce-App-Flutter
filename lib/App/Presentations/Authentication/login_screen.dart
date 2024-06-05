import 'package:test_e_commerce/App/Widgets/dokan_text_widget.dart';
import '../../Utils/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {




  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center( child: DokanTextWidget(text: "Login Page", color: ThemeStyles.blackColor,),),

    ));
  }
}
