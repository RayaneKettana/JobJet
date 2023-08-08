import 'package:get/get.dart';

import '../../../../presentation/applications/widgets/features_list/controllers/features_list.controller.dart';

class FeaturesListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturesListController>(
      () => FeaturesListController(),
    );
  }
}
