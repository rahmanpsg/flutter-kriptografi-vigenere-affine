// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';
import 'app.locator.dart';

import '../ui/shared/dialog/custom_dialog.dart';

enum DialogType {
  customDialog,
}

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  final builders = {
    DialogType.customDialog: (context, DialogRequest request,
            void Function(DialogResponse) completer) =>
        CustomDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
