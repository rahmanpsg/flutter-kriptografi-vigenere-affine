import 'package:flutter/material.dart';
import 'package:kriptografi_vigenere_affine/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final DialogService dialogService = locator<DialogService>();

  void goBack() {
    navigationService.back();
  }

  void removeFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
