import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/home_page_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController authController = Get.find();
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
              fontSize: AppSizes.fontSizeLg,
              fontWeight: AppSizes.fontWeightBold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Obx(() => Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(AppImage.profileimage),
                            radius: 80.0,
                          ),
                          const SizedBox(
                            height: AppSizes.mediumDefaultSpace,
                          ),
                          Text(
                            homePageController.userModel.value.fullName,
                            style: const TextStyle(
                                fontSize: AppSizes.fontSizeMd,
                                fontWeight: AppSizes.fontWeightW400,
                                color: black),
                          ),
                          Text(
                            homePageController.userModel.value.email,
                            style: const TextStyle(
                                fontSize: AppSizes.fontSizeSm,
                                fontWeight: AppSizes.fontWeightNormal,
                                color: black),
                          ),
                          const Text(
                            'Edit Profile',
                            style: TextStyle(
                                fontSize: AppSizes.fontSizeXs,
                                fontWeight: AppSizes.fontWeightNormal,
                                color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),

                    //settings
                    const Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: AppSizes.mediumDefaultSpace,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: AppSizes.fontSizeSm,
                              color: black,
                              fontWeight: AppSizes.fontWeightNormal),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.mediumDefaultSpace),

                    //Location
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(
                              width: AppSizes.mediumDefaultSpace,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: AppSizes.fontSizeSm,
                                  color: black,
                                  fontWeight: AppSizes.fontWeightNormal),
                            )
                          ],
                        ),
                        Icon(
                          Icons.toggle_on,
                          color: primaryColor,
                        )
                      ],
                    ),
                    const SizedBox(height: AppSizes.mediumDefaultSpace),

                    //notification
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.notifications_active),
                            SizedBox(
                              width: AppSizes.mediumDefaultSpace,
                            ),
                            Text(
                              'Notification',
                              style: TextStyle(
                                  fontSize: AppSizes.fontSizeSm,
                                  color: black,
                                  fontWeight: AppSizes.fontWeightNormal),
                            )
                          ],
                        ),
                        Icon(
                          Icons.toggle_on,
                          color: grey,
                        )
                      ],
                    ),
                    const SizedBox(height: AppSizes.mediumDefaultSpace),

                    //help
                    const Row(
                      children: [
                        Icon(Icons.help_center),
                        SizedBox(
                          width: AppSizes.mediumDefaultSpace,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                              fontSize: AppSizes.fontSizeSm,
                              color: black,
                              fontWeight: AppSizes.fontWeightNormal),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.mediumDefaultSpace),

                    //logout
                    GestureDetector(
                      onTap: () {
                        authController
                            .logoutUser()
                            .then((value) => Get.offAll(LoginPage()));
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: AppSizes.mediumDefaultSpace,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: AppSizes.fontSizeSm,
                                color: black,
                                fontWeight: AppSizes.fontWeightNormal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
