// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:kf_survey/ui/auth/login.dart' as _i3;
import 'package:kf_survey/ui/auth/profile.dart' as _i4;
import 'package:kf_survey/ui/dashboard/dashboard_v.dart' as _i5;
import 'package:kf_survey/ui/family/family_add/family_add_v.dart' as _i10;
import 'package:kf_survey/ui/family/family_v.dart' as _i6;
import 'package:kf_survey/ui/search/search_v.dart' as _i7;
import 'package:kf_survey/ui/splash/splash_v.dart' as _i2;
import 'package:kf_survey/ui/survey/survey_list/survey_list_v.dart' as _i8;
import 'package:kf_survey/ui/survey/survey_v.dart' as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const splashView = '/';

  static const appLoginView = '/app-login-view';

  static const appProfileView = '/app-profile-view';

  static const dashboardView = '/dashboard-view';

  static const familyView = '/family-view';

  static const searchView = '/search-view';

  static const surveyListView = '/survey-list-view';

  static const surveyView = '/survey-view';

  static const familyAddView = '/family-add-view';

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

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.appLoginView,
      page: _i3.AppLoginView,
    ),
    _i1.RouteDef(
      Routes.appProfileView,
      page: _i4.AppProfileView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i5.DashboardView,
    ),
    _i1.RouteDef(
      Routes.familyView,
      page: _i6.FamilyView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i7.SearchView,
    ),
    _i1.RouteDef(
      Routes.surveyListView,
      page: _i8.SurveyListView,
    ),
    _i1.RouteDef(
      Routes.surveyView,
      page: _i9.SurveyView,
    ),
    _i1.RouteDef(
      Routes.familyAddView,
      page: _i10.FamilyAddView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.AppLoginView: (data) {
      final args = data.getArgs<AppLoginViewArguments>(
        orElse: () => const AppLoginViewArguments(),
      );
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.AppLoginView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i4.AppProfileView: (data) {
      final args = data.getArgs<AppProfileViewArguments>(
        orElse: () => const AppProfileViewArguments(),
      );
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.AppProfileView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i5.DashboardView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.DashboardView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.FamilyView: (data) {
      final args = data.getArgs<FamilyViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.FamilyView(familyId: args.familyId, key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i7.SearchView: (data) {
      final args = data.getArgs<SearchViewArguments>(
        orElse: () => const SearchViewArguments(),
      );
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.SearchView(key: args.key, isFamilySearch: args.isFamilySearch),
        settings: data,
        maintainState: false,
      );
    },
    _i8.SurveyListView: (data) {
      final args = data.getArgs<SurveyListViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SurveyListView(
            familyId: args.familyId, memberId: args.memberId, key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i9.SurveyView: (data) {
      final args = data.getArgs<SurveyViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.SurveyView(
            surveyId: args.surveyId,
            familyId: args.familyId,
            memberId: args.memberId,
            key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i10.FamilyAddView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.FamilyAddView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AppLoginViewArguments {
  const AppLoginViewArguments({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class AppProfileViewArguments {
  const AppProfileViewArguments({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class FamilyViewArguments {
  const FamilyViewArguments({
    required this.familyId,
    this.key,
  });

  final String familyId;

  final _i11.Key? key;

  @override
  String toString() {
    return '{"familyId": "$familyId", "key": "$key"}';
  }
}

class SearchViewArguments {
  const SearchViewArguments({
    this.key,
    this.isFamilySearch = true,
  });

  final _i11.Key? key;

  final bool isFamilySearch;

  @override
  String toString() {
    return '{"key": "$key", "isFamilySearch": "$isFamilySearch"}';
  }
}

class SurveyListViewArguments {
  const SurveyListViewArguments({
    required this.familyId,
    required this.memberId,
    this.key,
  });

  final String familyId;

  final String memberId;

  final _i11.Key? key;

  @override
  String toString() {
    return '{"familyId": "$familyId", "memberId": "$memberId", "key": "$key"}';
  }
}

class SurveyViewArguments {
  const SurveyViewArguments({
    required this.surveyId,
    required this.familyId,
    required this.memberId,
    this.key,
  });

  final String surveyId;

  final String familyId;

  final String memberId;

  final _i11.Key? key;

  @override
  String toString() {
    return '{"surveyId": "$surveyId", "familyId": "$familyId", "memberId": "$memberId", "key": "$key"}';
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppLoginView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.appLoginView,
        arguments: AppLoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppProfileView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.appProfileView,
        arguments: AppProfileViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFamilyView({
    required String familyId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.familyView,
        arguments: FamilyViewArguments(familyId: familyId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView({
    _i11.Key? key,
    bool isFamilySearch = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.searchView,
        arguments:
            SearchViewArguments(key: key, isFamilySearch: isFamilySearch),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSurveyListView({
    required String familyId,
    required String memberId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.surveyListView,
        arguments: SurveyListViewArguments(
            familyId: familyId, memberId: memberId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSurveyView({
    required String surveyId,
    required String familyId,
    required String memberId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.surveyView,
        arguments: SurveyViewArguments(
            surveyId: surveyId,
            familyId: familyId,
            memberId: memberId,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFamilyAddView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.familyAddView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppLoginView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.appLoginView,
        arguments: AppLoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppProfileView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.appProfileView,
        arguments: AppProfileViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFamilyView({
    required String familyId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.familyView,
        arguments: FamilyViewArguments(familyId: familyId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView({
    _i11.Key? key,
    bool isFamilySearch = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.searchView,
        arguments:
            SearchViewArguments(key: key, isFamilySearch: isFamilySearch),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSurveyListView({
    required String familyId,
    required String memberId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.surveyListView,
        arguments: SurveyListViewArguments(
            familyId: familyId, memberId: memberId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSurveyView({
    required String surveyId,
    required String familyId,
    required String memberId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.surveyView,
        arguments: SurveyViewArguments(
            surveyId: surveyId,
            familyId: familyId,
            memberId: memberId,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFamilyAddView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.familyAddView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
