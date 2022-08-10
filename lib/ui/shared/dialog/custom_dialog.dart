import 'package:flutter/material.dart';
import 'package:kriptografi_vigenere_affine/themes/app_colors.dart';
import 'package:kriptografi_vigenere_affine/themes/app_text.dart';
import 'package:kriptografi_vigenere_affine/ui/widgets/custom_textfield_outline.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomDialog extends StatelessWidget {
  final DialogRequest request;
  final void Function(DialogResponse) completer;
  const CustomDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                request.title ?? 'Title',
                style: boldTextStyle.copyWith(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomTextFieldOutline(
                controller: TextEditingController(text: request.description),
                readOnly: true,
                color: backgroundColor,
                maxLines: 4,
              ),
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await Share.shareWithResult(request.description!);

                        completer(DialogResponse());
                      },
                      icon: const Icon(Icons.share, color: secondaryColor),
                      label: Text(
                        'Kirim',
                        style: mediumTextStyle.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: OutlinedButton(
                      onPressed: () {
                        completer(DialogResponse());
                      },
                      child: const Text(
                        'Tutup',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
