import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import 'controllers/features_list.controller.dart';

class FeaturesListScreen extends GetView<FeaturesListController> {
  const FeaturesListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: const Color(0xFFE6C7FF),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const HeroIcon(
              HeroIcons.clipboardDocumentList,
              size: 32,
              style: HeroIconStyle.solid,
            ),
          ),
        ),
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F9FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const HeroIcon(
            HeroIcons.userGroup,
            size: 32,
            style: HeroIconStyle.solid,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            color: const Color(0xFFFEE9C5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const HeroIcon(
            HeroIcons.presentationChartLine,
            size: 32,
            style: HeroIconStyle.solid,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            color: const Color(0xFFD2F5D9),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const HeroIcon(
            HeroIcons.cog8Tooth,
            size: 32,
            style: HeroIconStyle.solid,
          ),
        ),
      ],
    );
  }
}
