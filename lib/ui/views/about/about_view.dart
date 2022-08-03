import 'package:flutter/material.dart';
import 'package:kriptografi_vigenere_affine/themes/app_colors.dart';
import 'package:kriptografi_vigenere_affine/themes/app_text.dart';
import 'package:kriptografi_vigenere_affine/ui/widgets/custom_card.dart';
import 'package:stacked/stacked.dart';

import './about_view_model.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (
        BuildContext context,
        AboutViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tentang"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomCard(
                  child: Text(
                    model.judul,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                CustomCard(
                  child: Center(
                    child: Text(
                      "${model.nama}\n${model.nim}",
                      style: boldTextStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.pembimbing1,
                        style: semiBoldTextStyle,
                      ),
                      const SizedBox(height: 8),
                      const Text("Pembimbing 1"),
                      const Divider(),
                      Text(
                        model.pembimbing2,
                        style: semiBoldTextStyle,
                      ),
                      const SizedBox(height: 8),
                      const Text("Pembimbing 2"),
                      const Divider(),
                      Text(
                        model.penguji1,
                        style: semiBoldTextStyle,
                      ),
                      const SizedBox(height: 8),
                      const Text("Penguji 1"),
                      const Divider(),
                      Text(
                        model.penguji2,
                        style: semiBoldTextStyle,
                      ),
                      const SizedBox(height: 8),
                      const Text("Penguji 2"),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
