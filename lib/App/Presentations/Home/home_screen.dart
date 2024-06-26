import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Provider/Home/home_provider.dart';
import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Widgets/shimmer_loader_widgets.dart';
import 'filter_model_bottom_sheet.dart';





class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  dynamic homeScreenProvider;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeScreenProvider = ref.watch(homeScreenController);
    homeScreenProvider.loadProducts();

  }
  @override
  Widget build(BuildContext context) {

    return _isLoading ?
    const ShimmerLoading():


      SafeArea(child: Scaffold(
      backgroundColor: ThemeStyles.scaffoldBackground,
      appBar: AppBar(
        elevation: 0,
      backgroundColor: ThemeStyles.scaffoldBackground,
        centerTitle: true,
        title: const DokanTextWidget(
          text: "Product List",
          color: ThemeStyles.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 24,

        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: SvgPicture.asset('assets/Svg/Search.svg'),
          ),
        ],

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) => const FilterModalBottomSheet(),
                  );
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 1,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeStyles.whiteColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/Svg/Filter Icon.svg'),
                          const SizedBox(width: 20,),
                          SvgPicture.asset('assets/Svg/Filter.svg'),
                          const SizedBox(width: 100,),
                          SvgPicture.asset('assets/Svg/short.svg'),
                          const SizedBox(width: 20,),
                          SvgPicture.asset('assets/Svg/flaticon.svg'),
                        ],
                      ),
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 20,),

              GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ref.watch(homeScreenController).products.length,
                itemBuilder: (context, index) {
                  final product = ref.watch(homeScreenController).products[index];
                  return Card(
                    elevation: 3,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 160,
                      child: Column(
                        children: [
                          // Your image
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: product.imageUrl,
                              fit: BoxFit.fill,
                              width: 160,
                              height: 120,
                              placeholder: (context, url) => const Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: CircularProgressIndicator(
                                    color: ThemeStyles.primary,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset('assets/images/image-not-found.jpg',  width: 160,
                                height: 120, fit: BoxFit.fill,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product name
                                DokanTextWidget(
                                  text: product.name,
                                  color: ThemeStyles.blackColor,
                                  fontWeight: FontWeight.bold,
                                  maxLines: 1,
                                  fontSize: 10,
                                ),
                                const SizedBox(height: 10),
                                              Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/Svg/Dollar.svg',
                                                      colorFilter: const ColorFilter.mode(
                                                        ThemeStyles.blackColor,
                                                        BlendMode.srcIn,
                                                      ),
                                                      height:15,
                                                    ),
                                                     DokanTextWidget(
                                                      text: product.regularPrice,
                                                      color: ThemeStyles.disabledColor,
                                                      fontWeight: FontWeight.bold,
                                                      maxLines: 2,
                                                      textDecoration: TextDecoration.lineThrough,
                                                      fontSize: 12,
                                                    ),
                                                    const SizedBox(width: 5),
                                                     DokanTextWidget(
                                                       text: product.price,
                                                      color: ThemeStyles.blackColor,
                                                      fontWeight: FontWeight.bold,
                                                      maxLines: 2,
                                                      fontSize: 14,
                                                    ),
                                                  ],
                                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

    ));
  }
}







