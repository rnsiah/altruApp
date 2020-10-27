import 'package:altru/QR_Functionality/QR_Home.dart';
import 'package:altru/screens/AtrocityList.dart';
import 'package:altru/screens/Auth_Page.dart';
import 'package:altru/screens/Cause_List.dart';
import 'package:altru/screens/LoginPage.dart';
import 'package:altru/screens/NonProfit_Screen2.dart';
import 'package:altru/screens/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:altru/screens/HomeScreen.dart';
import 'package:altru/screens/Shirt_Selection.dart';
import 'package:altru/screens/Atrocity_Video.dart';



import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:altru/bloc_login/repository/user_repository.dart';
import 'package:altru/bloc_login/bloc/authentication_bloc.dart';
import 'package:altru/bloc_login/splash_page.dart';
import 'package:altru/bloc_login/login/login_page.dart';

import 'package:altru/bloc_login/common/loading_indicator.dart';



class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}





void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: MyApp(userRepository: userRepository),
  ));
}
class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return UserHomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: UserHomePage.id,
      routes: {
        Cause_List.id:(context)=>Cause_List(),
        myQRHome.id:(context)=>myQRHome(),
        ShirtSelection.id:(context)=>ShirtSelection(),
        NonProfitScreen.id:(context)=>NonProfitScreen(),
      },
    );
  }
}
