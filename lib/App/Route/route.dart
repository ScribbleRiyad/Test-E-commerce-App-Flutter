import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_e_commerce/App/Route/route_name.dart';
import '../Application/application_screen.dart';
import '../Presentations/Authentication/login_screen.dart';
import '../Presentations/Authentication/registration_screen.dart';
import '../Presentations/Home/home_screen.dart';
import '../Presentations/Profile/profile_screen.dart';
import '../Presentations/Splash/splash_screen.dart';







final GoRouter routeFunction =GoRouter (

    initialLocation: '/',
    navigatorKey: GlobalKey<NavigatorState>(),

    routes: [
      GoRoute(name : RouteName.splashScreen,            path: "/", builder: (context, state) => const SplashScreen(),),
      GoRoute(name : RouteName.homeScreen,              path: "/homeScreen", builder: (BuildContext context, GoRouterState state) => const HomeScreen(),),
      GoRoute(name : RouteName.applicationScreen,       path: "/applicationScreen", builder: (BuildContext context, GoRouterState state) => const ApplicationScreen(),),
      GoRoute(name : RouteName.profilePage,             path: "/profilePage", builder: (BuildContext context, GoRouterState state) => const ProfileScreen(),),



          //Animated Transition Route Below ------------------------------------------------------------------------------------------------

      GoRoute( name : RouteName.loginScreen, path: '/loginScreen',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },),
      GoRoute( name : RouteName.registrationScreen, path: '/registrationScreen',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const RegistrationScreen(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },),


]
);