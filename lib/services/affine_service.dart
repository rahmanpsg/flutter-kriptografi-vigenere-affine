import 'package:kriptografi_vigenere_affine/utils/utils.dart';

class AffineService {
  String _convert(int a, int b, String text, String m) {
    if (a.gcd(26) != 1) {
      throw ArgumentError("$a is not prime with 26.");
    }

    StringBuffer cipher = StringBuffer();

    for (var i = 0; i < text.length; i++) {
      String ch = text[i];

      if (isLetter(ch)) {
        String s;

        if (m == "encrypt") {
          s = alphabet[((a * alphabet.indexOf(ch.toUpperCase())) + b) % 26];
        } else {
          s = alphabet[
              (a.modInverse(26) * (alphabet.indexOf(ch.toUpperCase()) - b)) %
                  26];
        }

        cipher.write(isUpper(ch) ? s.toUpperCase() : s.toLowerCase());
      } else {
        cipher.write(ch);
      }
    }

    return cipher.toString();
  }

  /// [a] and [b] are required.
  ///
  /// [ArgumentError] if [a] is not prime with 26.
  /// Encrypt [text].
  String encrypt(int a, int b, String text) => _convert(a, b, text, "encrypt");

  /// [a] and [b] are required.
  ///
  /// [ArgumentError] if [a] is not prime with 26.
  /// Decrypt [text].
  String decrypt(int a, int b, String text) => _convert(a, b, text, "decrypt");
}
