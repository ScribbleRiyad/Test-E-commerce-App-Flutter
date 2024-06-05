import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Repository/Authentication/authentication_repo.dart';



final authenticationController =
ChangeNotifierProvider((ref) => AuthenticationProvider());


class AuthenticationProvider extends ChangeNotifier {

  AuthenticationRepository authenticationRepository =
  AuthenticationRepository();


  }

