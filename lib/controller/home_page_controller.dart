

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/quote_response_model.dart';
import '../services/quote_services.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var quotesList = <Quote>[].obs;
  var errorMessage = ''.obs;

  final QuoteService quoteService;
  HomePageController({required this.quoteService});

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      isLoading(true);
      var quotesResponse = await quoteService.fetchQuotes();
      quotesList.assignAll(quotesResponse.quotes);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}