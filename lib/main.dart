import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.dialog.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  setupDialogUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kriptografi',
        theme: appTheme,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        initialRoute: Routes.homeView);
  }
}
