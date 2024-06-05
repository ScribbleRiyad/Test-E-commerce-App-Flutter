
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';



class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center( child: DokanTextWidget(text: "Product Page", color: ThemeStyles.blackColor,),),

    ));
  }
}

