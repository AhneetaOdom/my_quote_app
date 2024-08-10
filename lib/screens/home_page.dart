import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';
import '../services/quote_services.dart';
import '../utils/constants/sizes.dart';
import '../widgets/quote_list_item.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomePageController(quoteService: QuoteService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
        'All Quotes',
        style: TextStyle(
        fontSize: AppSizes.fontSizeLg,
        fontWeight: AppSizes.fontWeightBold),
    ),
    ),
    body: SafeArea(child: Obx(() {
    if (controller.isLoading.value) {
    return const Center(child: CircularProgressIndicator());
    }
    if (controller.errorMessage.isNotEmpty) {
    return Center(child: Text(controller.errorMessage.value));
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 16),
            child: SearchBar(
              hintText: 'Search quotes...',
              leading: const Icon(Icons.search),
              elevation: MaterialStateProperty.all(0.0),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20.0)),
              backgroundColor: MaterialStateProperty.all(
                  Colors.grey[200]),
              onChanged: (value)=> controller.filterQuotes(searchText: value),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          const SizedBox(
            height: AppSizes.mediumDefaultSpace,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: controller.filteredQuotesList.length,
                itemBuilder: (context, index) {
                  final quote = controller.filteredQuotesList[index];
                  return QuoteListItem(
                    quoteItem: quote,
                  );
                }),
          )
        ],
      );
    }
    })),
    );
  }
}
