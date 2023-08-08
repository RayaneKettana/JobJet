import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobjet/presentation/applications/applications.screen.dart';
import 'package:jobjet/presentation/customer/customer.screen.dart';

import '../calendar/calendar.screen.dart';
import '../home/home.screen.dart';
import 'controllers/navigation_bar.controller.dart';

class NavigationBarScreen extends GetView<NavigationBarController> {
  NavigationBarScreen({Key? key}) : super(key: key);
  @override
  final NavigationBarController controller = Get.put(NavigationBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>(builder: (_) {
      return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen(),
              CalendarScreen(),
              CustomerScreen(),
              ApplicationsScreen(),
            ],
          )),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: HeroIcon(HeroIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: HeroIcon(HeroIcons.calendarDays),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: HeroIcon(HeroIcons.userPlus),
                label: 'Customer',
              ),
              BottomNavigationBarItem(
                icon: HeroIcon(HeroIcons.squares2x2),
                label: 'Apps',
              ),
            ],
          ));
    });
  }
}
