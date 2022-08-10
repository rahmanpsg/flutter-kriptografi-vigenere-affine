import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kriptografi_vigenere_affine/app/app.dialog.dart';
import 'package:kriptografi_vigenere_affine/app/app.locator.dart';
import 'package:kriptografi_vigenere_affine/app/app.logger.dart';
import 'package:kriptografi_vigenere_affine/app/core/custom_base_view_model.dart';
import 'package:kriptografi_vigenere_affine/services/affine_service.dart';
import 'package:kriptografi_vigenere_affine/services/vigenere_service.dart';

class EncryptViewModel extends CustomBaseViewModel {
  final log = getLogger('EncryptViewModel');

  final _vigenere = locator<VigenereService>();
  final _affine = locator<AffineService>();

  final formKey = GlobalKey<FormState>();

  final textController = TextEditingController();
  final vigenereKeyController = TextEditingController();
  final affineAKeyController = TextEditingController();
  final affineBKeyController = TextEditingController();

  void paste() async {
    textController.text =
        (await Clipboard.getData(Clipboard.kTextPlain))?.text ?? '';
  }

  void clear() {
    textController.clear();
  }

  void onSubmit() {
    if (formKey.currentState?.validate() != true) return;

    final String text = textController.text;
    final String vigenereKey = vigenereKeyController.text;
    final int affineAKey = int.parse(affineAKeyController.text);
    final int affineBKey = int.parse(affineBKeyController.text);

    final vigenereEncrypted = _vigenere.encrypt(vigenereKey, text);
    final affineEncrypted =
        _affine.encrypt(affineAKey, affineBKey, vigenereEncrypted);

    log.i('vigenereEncrypted: $vigenereEncrypted');
    log.i('affineEncrypted: $affineEncrypted');

    final affineDecrypted =
        _affine.decrypt(affineAKey, affineBKey, affineEncrypted);
    log.i('affineDecrypted: $affineDecrypted');

    final decrypted = _vigenere.decrypt(vigenereKey, affineDecrypted);
    log.i('decrypted: $decrypted');

    dialogService.showCustomDialog(
      variant: DialogType.customDialog,
      title: 'Hasil Enkripsi',
      description: affineEncrypted,
    );
  }
}
