import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center( child: DokanTextWidget(text: "Cart Page", color: ThemeStyles.blackColor,),),

    ));
  }
}
