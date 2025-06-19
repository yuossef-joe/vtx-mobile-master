import 'package:applocation/app/app_preferences.dart';
import 'package:applocation/presentation/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/theme_manager.dart';
import 'constants/observers.dart';
import 'di.dart';

class MyApp extends StatefulWidget {

  const MyApp._internal();


  static const MyApp _instance = MyApp._internal();
  factory MyApp () => _instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      navigatorObservers: [CustomNavigatorObserver()],
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}