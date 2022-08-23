import 'package:kriptografi_vigenere_affine/utils/utils.dart';

class VigenereService {
  String _convert(String key, String text, String type) {
    StringBuffer cipher = StringBuffer();
    int keyIndex = 0;
    String keyUpper = key.toUpperCase();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        int alphaIndex = alphabet.indexOf(ch.toUpperCase());

        if (type == "encrypt") {
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

  String encrypt(String key, String text) => _convert(key, text, "encrypt");

  String decrypt(String key, String text) => _convert(key, text, "decrypt");
}
