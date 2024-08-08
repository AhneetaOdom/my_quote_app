import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  void changePageIndex(int index) {
    _pageIndex.value = index;
    update();
  }
  }