import 'package:get/get.dart';

import '../../../../domain/usecases/sign_in_usecase.dart';
import '../../../../domain/usecases/sign_up_usecase.dart';
import '../../../../presentation/login/controllers/login.controller.dart';
import '../../../remote/firebase_auth_impl.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
          SignupWithEmailAndPasswordUseCase(FirebaseAuthImpl()),
          SignInUseCase(FirebaseAuthImpl())),
    );
  }
}
