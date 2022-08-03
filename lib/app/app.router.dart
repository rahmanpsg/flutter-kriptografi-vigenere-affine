// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/about/about_view.dart';
import '../ui/views/decrypt/decrypt_view.dart';
import '../ui/views/encrypt/encrypt_view.dart';
import '../ui/views/home/home_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String encryptView = '/encrypt-view';
  static const String decryptView = '/decrypt-view';
  static const String aboutView = '/about-view';
  static const all = <String>{
    homeView,
    encryptView,
    decryptView,
    aboutView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.encryptView, page: EncryptView),
    RouteDef(Routes.decryptView, page: DecryptView),
    RouteDef(Routes.aboutView, page: AboutView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    EncryptView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EncryptView(),
        settings: data,
      );
    },
    DecryptView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DecryptView(),
        settings: data,
      );
    },
    AboutView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AboutView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEncryptView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.encryptView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDecryptView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.decryptView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAboutView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.aboutView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
