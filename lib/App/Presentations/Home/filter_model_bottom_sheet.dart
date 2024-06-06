import 'package:flutter/material.dart';
import 'package:test_e_commerce/App/Widgets/dokan_text_widget.dart';

import '../../Utils/theme_styles.dart';
import '../../Widgets/dokan_custom_button.dart';

class FilterModalBottomSheet extends StatefulWidget {
  const FilterModalBottomSheet({super.key});

  @override
  State<FilterModalBottomSheet> createState() => _FilterModalBottomSheetState();
}

class _FilterModalBottomSheetState extends State<FilterModalBottomSheet> {
  String selectedFilter = 'Newest';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 4,
              width: 40,
              color: Colors.pink[100],
              margin: const EdgeInsets.only(bottom: 16.0),
            ),
          ),
          const DokanTextWidget(
            text: 'Filter',

              fontSize: 18,
              color: ThemeStyles.blackColor,
              fontWeight: FontWeight.bold,

          ),
          const SizedBox(height: 16),
          FilterOption(
            title: 'Newest',
            isSelected: selectedFilter == 'Newest',
            onTap: () {
              setState(() {
                selectedFilter = 'Newest';
              });
            },
          ),
          FilterOption(
            title: 'Oldest',
            isSelected: selectedFilter == 'Oldest',
            onTap: () {
              setState(() {
                selectedFilter = 'Oldest';
              });
            },
          ),
          FilterOption(
            title: 'Price low > High',
            isSelected: selectedFilter == 'Price low > High',
            onTap: () {
              setState(() {
                selectedFilter = 'Price low > High';
              });
            },
          ),
          FilterOption(
            title: 'Price high > Low',
            isSelected: selectedFilter == 'Price high > Low',
            onTap: () {
              setState(() {
                selectedFilter = 'Price high > Low';
              });
            },
          ),
          FilterOption(
            title: 'Best selling',
            isSelected: selectedFilter == 'Best selling',
            onTap: () {
              setState(() {
                selectedFilter = 'Best selling';
              });
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DokanCustomButton(
                buttonHeight: 50,
                buttonWidth: 120,
                onTap: () {},
                buttonText: "Cancel",
                isLoading: false,
                buttonColor: ThemeStyles.scaffoldBackground,
                borderColor: ThemeStyles.blackColor,
                borderRadius: 10,
                textColor: ThemeStyles.blackColor,
                fontSize: 18,
              ),
              const SizedBox(width: 20,),
              DokanCustomButton(
                buttonHeight: 50,
                buttonWidth: 120,
                onTap: () {},
                buttonText: "Apply",
                isLoading: false,
                buttonColor: ThemeStyles.greenColor,
                borderColor: ThemeStyles.whiteColor,
                borderRadius: 10,
                textColor: ThemeStyles.whiteColor,
                fontSize: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (value) {
              onTap();
            },
            activeColor: Colors.pink,
          ),
          DokanTextWidget(
            text: title,
            fontSize: 16,
            color: ThemeStyles.blackColor,

          ),
        ],
      ),
    );
  }
}