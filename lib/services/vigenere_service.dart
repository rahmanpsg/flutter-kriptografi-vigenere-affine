import 'package:kriptografi_vigenere_affine/utils/utils.dart';

/// Vigenere cipher implementation.
class VigenereService {
  // String key;

  // /// [key] keyword for cipher.
  // VigenereService(this.key);

  String _convert(String key, String text, String m) {
    StringBuffer cipher = StringBuffer();
    int keyIndex = 0;
    String keyUpper = key.toUpperCase();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        int alphaIndex = alphabet.indexOf(ch.toUpperCase());

        if (m == "encrypt") {
          alphaIndex += alphabet.indexOf(keyUpper[keyIndex]);
        } else {
          alphaIndex -= alphabet.indexOf(keyUpper[keyIndex]);
        }

        alphaIndex %= 26;

        String s = alphabet[alphaIndex];
        cipher.write(isUpper(ch) ? s : s.toLowerCase());

        keyIndex++;
        if (keyIndex == keyUpper.length) keyIndex = 0;
      } else {
        cipher.write(ch);
      }
    }

    return cipher.toString();
  }

  /// [key] keyword for cipher.
  /// Encrypt [text].
  String encrypt(String key, String text) => _convert(key, text, "encrypt");

  /// [key] keyword for cipher.
  /// Decrypt [text].
  String decrypt(String key, String text) => _convert(key, text, "decrypt");
}
