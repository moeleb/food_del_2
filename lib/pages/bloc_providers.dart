import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delievery/app_blocs.dart';
import 'package:food_delievery/pages/register/bloc/register_blocs.dart';

import 'sign_in/bloc/signin_blocs.dart';
import 'welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBlocs(),
        ),
      ];
}
