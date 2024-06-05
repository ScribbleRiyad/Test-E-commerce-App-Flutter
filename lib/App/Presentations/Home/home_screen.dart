import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center( child: DokanTextWidget(text: "Home Page", color: ThemeStyles.blackColor,),),

    ));
  }
}







