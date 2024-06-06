import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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

    return SafeArea(child: Scaffold(
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/Svg/coming-soon.svg',
                height: 300,
              ),
              const DokanTextWidget(
                text: 'Category Coming Soon',
                color: ThemeStyles.blackColor,
                fontSize: 18,
              ),
            ],
          ),
        )


    ));
  }
}