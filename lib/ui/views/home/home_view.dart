import 'package:flutter/material.dart';
import 'package:kriptografi_vigenere_affine/themes/app_colors.dart';
import 'package:kriptografi_vigenere_affine/themes/app_text.dart';
import 'package:kriptografi_vigenere_affine/ui/widgets/custom_button.dart';
import 'package:kriptografi_vigenere_affine/ui/widgets/custom_card.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Kriptografi'),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomCard(
                        child: Text(
                          'Vigenere cipher merupakan teknik menyandikan pesan dengan sandi Caesar menggunakan karakter pada kunci yang digunakan. Kunci yang digunakan pada algoritma ini berupa kunci simetris dan karakter pada kunci tersebut akan dipakai berulang apabila karakter pada pesan belum terproses semua.',
                          style: boldTextStyle.copyWith(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomCard(
                        child: Text(
                          'Affine cipher merupakan bagian dari kriptografi klasik yang merupakan metode substitusi dalam pengamanan data, yaitu melakukan pergeseran plaintext dengan mengalikan nilai plaintext dengan kunci bernilai bilangan prima.',
                          style: boldTextStyle.copyWith(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: 'Enkripsi',
                            imageAsset: 'assets/images/encryption.png',
                            onTap: model.toEncrypt,
                          ),
                          CustomButton(
                            text: 'Dekripsi',
                            imageAsset: 'assets/images/decryption.png',
                            onTap: model.toDecrypt,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        text: 'Tentang',
                        imageAsset: 'assets/images/information.png',
                        color: thirdColor,
                        onTap: model.toAbout,
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Teknik Informatika UM Pare © 2022",
                    style: semiBoldTextStyle,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
