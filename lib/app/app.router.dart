// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/dashboard/dashboard_v.dart';
import '../ui/family/family_add/family_add_v.dart';
import '../ui/family/family_v.dart';
import '../ui/search/search_v.dart';
import '../ui/splash/splash_v.dart';
import '../ui/survey/survey_v.dart';

class Routes {
  static const String splashView = '/';
  static const String signInScreen = '/sign-in-screen';
  static const String profileScreen = '/profile-screen';
  static const String dashboardView = '/dashboard-view';
  static const String familyView = '/family-view';
  static const String searchView = '/search-view';
  static const String surveyView = '/survey-view';
  static const String familyAddView = '/family-add-view';
  static const all = <String>{
    splashView,
    signInScreen,
    profileScreen,
    dashboardView,
    familyView,
    searchView,
    surveyView,
    familyAddView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.signInScreen, page: SignInScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.familyView, page: FamilyView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.surveyView, page: SurveyView),
    RouteDef(Routes.familyAddView, page: FamilyAddView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    SignInScreen: (data) {
      var args = data.getArgs<SignInScreenArguments>(
        orElse: () => SignInScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInScreen(
          key: args.key,
          providerConfigs: args.providerConfigs,
          auth: args.auth,
          headerMaxExtent: args.headerMaxExtent,
          headerBuilder: args.headerBuilder,
          sideBuilder: args.sideBuilder,
          oauthButtonVariant: args.oauthButtonVariant,
          desktopLayoutDirection: args.desktopLayoutDirection,
          resizeToAvoidBottomInset: args.resizeToAvoidBottomInset,
          showAuthActionSwitch: args.showAuthActionSwitch,
          email: args.email,
          subtitleBuilder: args.subtitleBuilder,
          footerBuilder: args.footerBuilder,
          loginViewKey: args.loginViewKey,
          actions: args.actions,
          breakpoint: args.breakpoint,
          styles: args.styles,
        ),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      var args = data.getArgs<ProfileScreenArguments>(
        orElse: () => ProfileScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(
          key: args.key,
          auth: args.auth,
          providerConfigs: args.providerConfigs,
          avatarPlaceholderColor: args.avatarPlaceholderColor,
          avatarShape: args.avatarShape,
          avatarSize: args.avatarSize,
          children: args.children,
          actions: args.actions,
          appBar: args.appBar,
          cupertinoNavigationBar: args.cupertinoNavigationBar,
          actionCodeSettings: args.actionCodeSettings,
          styles: args.styles,
        ),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DashboardView(),
        settings: data,
      );
    },
    FamilyView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FamilyView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchView(),
        settings: data,
      );
    },
    SurveyView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SurveyView(),
        settings: data,
      );
    },
    FamilyAddView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FamilyAddView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SignInScreen arguments holder class
class SignInScreenArguments {
  final Key? key;
  final List<ProviderConfiguration>? providerConfigs;
  final FirebaseAuth? auth;
  final double? headerMaxExtent;
  final Widget Function(BuildContext, BoxConstraints, double)? headerBuilder;
  final Widget Function(BuildContext, BoxConstraints)? sideBuilder;
  final OAuthButtonVariant? oauthButtonVariant;
  final TextDirection? desktopLayoutDirection;
  final bool? resizeToAvoidBottomInset;
  final bool? showAuthActionSwitch;
  final String? email;
  final Widget Function(BuildContext, AuthAction)? subtitleBuilder;
  final Widget Function(BuildContext, AuthAction)? footerBuilder;
  final Key? loginViewKey;
  final List<FlutterFireUIAction> actions;
  final double breakpoint;
  final Set<FlutterFireUIStyle>? styles;
  SignInScreenArguments(
      {this.key,
      this.providerConfigs,
      this.auth,
      this.headerMaxExtent,
      this.headerBuilder,
      this.sideBuilder,
      this.oauthButtonVariant = OAuthButtonVariant.icon_and_text,
      this.desktopLayoutDirection,
      this.resizeToAvoidBottomInset = false,
      this.showAuthActionSwitch,
      this.email,
      this.subtitleBuilder,
      this.footerBuilder,
      this.loginViewKey,
      this.actions = const [],
      this.breakpoint = 800,
      this.styles});
}

/// ProfileScreen arguments holder class
class ProfileScreenArguments {
  final Key? key;
  final FirebaseAuth? auth;
  final List<ProviderConfiguration>? providerConfigs;
  final Color? avatarPlaceholderColor;
  final ShapeBorder? avatarShape;
  final double? avatarSize;
  final List<Widget> children;
  final List<FlutterFireUIAction>? actions;
  final AppBar? appBar;
  final CupertinoNavigationBar? cupertinoNavigationBar;
  final ActionCodeSettings? actionCodeSettings;
  final Set<FlutterFireUIStyle>? styles;
  ProfileScreenArguments(
      {this.key,
      this.auth,
      this.providerConfigs,
      this.avatarPlaceholderColor,
      this.avatarShape,
      this.avatarSize,
      this.children = const [],
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar,
      this.actionCodeSettings,
      this.styles});
}
