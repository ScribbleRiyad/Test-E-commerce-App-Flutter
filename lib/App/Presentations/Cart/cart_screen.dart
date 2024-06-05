import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
    return  SafeArea(child: Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/Svg/empty-cart.svg',
            height: 250,
          ),
          const SizedBox(height: 20),
          const DokanTextWidget(
            text: 'Your cart is empty',
            color: ThemeStyles.blackColor,
            fontSize: 18,
          ),
        ],
      )


    ));
  }
}
