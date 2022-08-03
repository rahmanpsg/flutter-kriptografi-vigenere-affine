import 'package:kriptografi_vigenere_affine/app/app.router.dart';
import 'package:kriptografi_vigenere_affine/app/core/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  void toEncrypt() {
    navigationService.navigateTo(Routes.encryptView);
  }

  void toDecrypt() {
    navigationService.navigateTo(Routes.decryptView);
  }

  void toAbout() {
    navigationService.navigateTo(Routes.aboutView);
  }
}
