import 'package:kriptografi_vigenere_affine/utils/utils.dart';

class AffineService {
  String _convert(int m, int b, String text, String type) {
    if (m.gcd(26) != 1) {
      throw ArgumentError("$m is not prime with 26.");
    }

    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        String s;

        if (type == "encrypt") {
          s = alphabet[((m * alphabet.indexOf(ch.toUpperCase())) + b) % 26];
        } else {
          s = alphabet[
              (m.modInverse(26) * (alphabet.indexOf(ch.toUpperCase()) - b)) %
                  26];
        }

        cipher.write(isUpper(ch) ? s.toUpperCase() : s.toLowerCase());
      } else {
        cipher.write(ch);
      }
    }

    return cipher.toString();
  }

  String encrypt(int m, int b, String text) => _convert(m, b, text, "encrypt");

  String decrypt(int m, int b, String text) => _convert(m, b, text, "decrypt");
}
