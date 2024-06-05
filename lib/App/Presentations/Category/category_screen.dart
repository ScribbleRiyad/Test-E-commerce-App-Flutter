import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';






class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center( child: DokanTextWidget(text: "Category Page", color: ThemeStyles.blackColor,),),

    ));
  }
}