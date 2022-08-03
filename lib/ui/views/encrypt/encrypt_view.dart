import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './encrypt_view_model.dart';

class EncryptView extends StatelessWidget {
  const EncryptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EncryptViewModel>.reactive(
      viewModelBuilder: () => EncryptViewModel(),
      onModelReady: (EncryptViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        EncryptViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'EncryptView',
            ),
          ),
        );
      },
    );
  }
}
