import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kriptografi_vigenere_affine/themes/app_colors.dart';
import 'package:kriptografi_vigenere_affine/themes/app_text.dart';
import 'package:kriptografi_vigenere_affine/ui/widgets/custom_textfield_outline.dart';
import 'package:stacked/stacked.dart';

import './decrypt_view_model.dart';

class DecryptView extends StatelessWidget {
  const DecryptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DecryptViewModel>.reactive(
      viewModelBuilder: () => DecryptViewModel(),
      builder: (
        BuildContext context,
        DecryptViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Dekripsi"),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: model.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Teks',
                    style: mediumTextStyle,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFieldOutline(
                    controller: model.textController,
                    hintText: 'Masukkan teks yang akan di dekripsi',
                    textInputAction: TextInputAction.next,
                    maxLines: 5,
                    validator: (val) {
                      if (val?.isNotEmpty != true) {
                        return 'Teks tidak boleh kosong';
                      }
                      return null;
                    },
                    suffixIcon: SizedBox(
                      height: 100,
                      width: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: secondaryColor,
                              width: .5,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: model.paste,
                                child: const Icon(
                                  Icons.content_paste_sharp,
                                  color: secondaryColor,
                                ),
                              ),
                              const Divider(
                                color: secondaryColor,
                                thickness: .5,
                              ),
                              GestureDetector(
                                onTap: model.clear,
                                child: Icon(
                                  Icons.clear_sharp,
                                  color: mainColor.withOpacity(.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Vigenere Key',
                    style: mediumTextStyle,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFieldOutline(
                    controller: model.vigenereKeyController,
                    hintText: 'Masukkan key (String)',
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    ],
                    validator: (val) {
                      if (val?.isNotEmpty != true) {
                        return 'Key tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Affine Key',
                    style: mediumTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomTextFieldOutline(
                          controller: model.affineAKeyController,
                          hintText: 'A key (Number)',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (val) {
                            if (val?.isNotEmpty != true) {
                              return 'Key tidak boleh kosong';
                            }

                            if (int.parse(val!).gcd(26) != 1) {
                              return "$val bukan bilangan prima dari 26";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: CustomTextFieldOutline(
                          controller: model.affineBKeyController,
                          hintText: 'B key (Number)',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (val) {
                            if (val?.isNotEmpty != true) {
                              return 'Key tidak boleh kosong';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: model.onSubmit,
                    icon: const Icon(Icons.lock_open_rounded),
                    label: const Text('Dekripsi'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
