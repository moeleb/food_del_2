import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delievery/common/routes/name.dart';
import 'package:food_delievery/pages/application/application_page.dart';
import 'package:food_delievery/pages/register/bloc/register_blocs.dart';
import 'package:food_delievery/pages/register/register.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_blocs.dart';
import 'package:food_delievery/pages/sign_in/sign_in.dart';
import 'package:food_delievery/pages/welcome/bloc/welcome_blocs.dart';
import 'package:food_delievery/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
/*      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
      ),*/
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("valid Route Name: ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid Route Name: ${settings.name}");

    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

/// unify block provider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
