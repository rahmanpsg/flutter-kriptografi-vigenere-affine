import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './decrypt_view_model.dart';

class DecryptView extends StatelessWidget {
  const DecryptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DecryptViewModel>.reactive(
      viewModelBuilder: () => DecryptViewModel(),
      onModelReady: (DecryptViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DecryptViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'DecryptView',
            ),
          ),
        );
      },
    );
  }
}
