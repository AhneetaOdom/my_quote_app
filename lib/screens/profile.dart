import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile')
      ]),
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
              fontSize: AppSizes.fontSizeLg,
              fontWeight: AppSizes.fontWeightBold),
        ),
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImage.profileimage),
                        radius: 80.0,
                      ),
                      SizedBox(
                        height: AppSizes.mediumDefaultSpace,
                      ),
                      Text(
                        'Amanda Zoe',
                        style: TextStyle(
                            fontSize: AppSizes.fontSizeMd,
                            fontWeight: AppSizes.fontWeightW400,
                            color: black),
                      ),
                      Text(
                        'zoemanda@gmail.com',
                        style: TextStyle(
                            fontSize: AppSizes.fontSizeSm,
                            fontWeight: AppSizes.fontWeightNormal,
                            color: black),
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: AppSizes.fontSizeXs,
                            fontWeight: AppSizes.fontWeightNormal,
                            color: primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.defaultSpace),

                //settings
                Row(
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
                SizedBox(height: AppSizes.mediumDefaultSpace),

                //Location
                Row(
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
                SizedBox(height: AppSizes.mediumDefaultSpace),

                //notification
                Row(
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
                SizedBox(height: AppSizes.mediumDefaultSpace),

                //help
                Row(
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
                SizedBox(height: AppSizes.mediumDefaultSpace),

                //logout
                Row(
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
              ],
            ),
          )),
    );
  }
}
