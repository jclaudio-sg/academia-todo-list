import 'package:app/app/core/database/sqlite_admin_connection.dart';
import 'package:app/app/core/ui/todo_list_ui_config.dart';
import 'package:app/app/modules/auth/auth_module.dart';
import 'package:app/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {

  const AppWidget({
    Key? key
  }) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  final sqliteAdminConnection = SqliteAdminConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(sqliteAdminConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(sqliteAdminConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TodoListUiConfig.theme,
      title: "Todo List Provider",
      initialRoute: "/login",
      routes: {
        ...AuthModule().routers,
      },
      home: const SplashPage(),
    );
  }

}
