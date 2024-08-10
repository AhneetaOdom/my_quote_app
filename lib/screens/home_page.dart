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
      appBar: AppBar(title: const Text('All Quotes', style: TextStyle(
          fontSize: AppSizes.fontSizeLg,
          fontWeight: AppSizes.fontWeightBold),),),
      body: SafeArea(
          child: Obx(() {
            if(controller.isLoading.value){
              return const Center(child: CircularProgressIndicator());
            }
            if(controller.errorMessage.isNotEmpty){
              return Center(child: Text(controller.errorMessage.value));
            }else{
              return Column(
                children: [
                  ///Add SearchBar here
                  const SizedBox(
                    height: AppSizes.mediumDefaultSpace,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.quotesList.length,
                        itemBuilder: (context, index) {
                          final quote = controller.quotesList[index];
                          return QuoteListItem(quoteItem: quote,);
                        }),
                  )
                ],
              );
            }
          })
      ),
    );
  }
}