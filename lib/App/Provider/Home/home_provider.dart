import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Model/Product/product_model_data.dart';
import '../../Presentations/Cart/cart_screen.dart';
import '../../Presentations/Category/category_screen.dart';
import '../../Presentations/Home/home_screen.dart';
import '../../Presentations/Profile/profile_screen.dart';
import '../../Repository/Home/home_repo.dart';


final homeScreenController =
ChangeNotifierProvider((ref) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();
  var _currentIndex = 0;
  int get currentIndex => _currentIndex;





  void setPageIndex({index}) => _currentIndex = index;

  //------------------ List Declare------------------------//
  List<Product> products = [];
  List<Widget> pageList = [ const HomeScreen(), const CategoryScreen(), const CartScreen(),const ProfileScreen()];

   loadProducts() async {
     products = await homeRepository.fetchProducts();
    print(products);

    notifyListeners();
  }


}

