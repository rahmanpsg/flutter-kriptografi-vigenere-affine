import 'package:kriptografi_vigenere_affine/services/affine_service.dart';
import 'package:kriptografi_vigenere_affine/services/vigenere_service.dart';
import 'package:kriptografi_vigenere_affine/ui/views/about/about_view.dart';
import 'package:kriptografi_vigenere_affine/ui/views/decrypt/decrypt_view.dart';
import 'package:kriptografi_vigenere_affine/ui/views/encrypt/encrypt_view.dart';
import 'package:kriptografi_vigenere_affine/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: EncryptView),
    MaterialRoute(page: DecryptView),
    MaterialRoute(page: AboutView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: VigenereService),
    LazySingleton(classType: AffineService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
