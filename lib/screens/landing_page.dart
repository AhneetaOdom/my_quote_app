import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_quote_app/screens/profile.dart';

import '../controller/landing_page.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final controller = Get.put(LandingPageController());

  final List<Widget> _screens = [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.pageIndex,
        children: _screens,
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.pageIndex,
        onTap: (index){
          controller.changePageIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: 'Profile')
        ],
      )),
    );
  }
}
