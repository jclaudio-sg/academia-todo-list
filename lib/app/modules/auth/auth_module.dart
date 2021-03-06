import 'package:app/app/core/modules/todo_list_module.dart';
import 'package:app/app/modules/auth/login/login_controller.dart';
import 'package:app/app/modules/auth/login/login_page.dart';
import 'package:provider/provider.dart';

import 'register/register_controller.dart';
import 'register/register_page.dart';

class AuthModule extends TodoListModule {

  AuthModule() : super(
    bindings: [
      ChangeNotifierProvider( create: (_) => LoginController(), ),
      ChangeNotifierProvider( create: (_) => RegisterController(), ),
    ],
    routers: {
      "/login" : (context) => const LoginPage(),
      "/register" : (context) => const RegisterPage(),
    },
  );

}