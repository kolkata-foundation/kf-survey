// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/auth/login.dart';
import '../ui/auth/profile.dart';
import '../ui/dashboard/dashboard_v.dart';
import '../ui/family/family_add/family_add_v.dart';
import '../ui/family/family_v.dart';
import '../ui/search/search_v.dart';
import '../ui/splash/splash_v.dart';
import '../ui/survey/survey_list/survey_list_v.dart';
import '../ui/survey/survey_v.dart';

class Routes {
  static const String splashView = '/';
  static const String appLoginView = '/app-login-view';
  static const String appProfileView = '/app-profile-view';
  static const String dashboardView = '/dashboard-view';
  static const String familyView = '/family-view';
  static const String searchView = '/search-view';
  static const String surveyListView = '/survey-list-view';
  static const String surveyView = '/survey-view';
  static const String familyAddView = '/family-add-view';
  static const all = <String>{
    splashView,
    appLoginView,
    appProfileView,
    dashboardView,
    familyView,
    searchView,
    surveyListView,
    surveyView,
    familyAddView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.appLoginView, page: AppLoginView),
    RouteDef(Routes.appProfileView, page: AppProfileView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.familyView, page: FamilyView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.surveyListView, page: SurveyListView),
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
    AppLoginView: (data) {
      var args = data.getArgs<AppLoginViewArguments>(
        orElse: () => AppLoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppLoginView(key: args.key),
        settings: data,
      );
    },
    AppProfileView: (data) {
      var args = data.getArgs<AppProfileViewArguments>(
        orElse: () => AppProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppProfileView(key: args.key),
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
      var args = data.getArgs<FamilyViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => FamilyView(
          familyId: args.familyId,
          key: args.key,
        ),
        settings: data,
      );
    },
    SearchView: (data) {
      var args = data.getArgs<SearchViewArguments>(
        orElse: () => SearchViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchView(
          key: args.key,
          isFamilySearch: args.isFamilySearch,
        ),
        settings: data,
      );
    },
    SurveyListView: (data) {
      var args = data.getArgs<SurveyListViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SurveyListView(
          familyId: args.familyId,
          memberId: args.memberId,
          key: args.key,
        ),
        settings: data,
      );
    },
    SurveyView: (data) {
      var args = data.getArgs<SurveyViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => SurveyView(
          surveyId: args.surveyId,
          familyId: args.familyId,
          memberId: args.memberId,
          key: args.key,
        ),
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

/// AppLoginView arguments holder class
class AppLoginViewArguments {
  final Key? key;
  AppLoginViewArguments({this.key});
}

/// AppProfileView arguments holder class
class AppProfileViewArguments {
  final Key? key;
  AppProfileViewArguments({this.key});
}

/// FamilyView arguments holder class
class FamilyViewArguments {
  final String familyId;
  final Key? key;
  FamilyViewArguments({required this.familyId, this.key});
}

/// SearchView arguments holder class
class SearchViewArguments {
  final Key? key;
  final bool isFamilySearch;
  SearchViewArguments({this.key, this.isFamilySearch = true});
}

/// SurveyListView arguments holder class
class SurveyListViewArguments {
  final String familyId;
  final String memberId;
  final Key? key;
  SurveyListViewArguments(
      {required this.familyId, required this.memberId, this.key});
}

/// SurveyView arguments holder class
class SurveyViewArguments {
  final String surveyId;
  final String familyId;
  final String memberId;
  final Key? key;
  SurveyViewArguments(
      {required this.surveyId,
      required this.familyId,
      required this.memberId,
      this.key});
}
