import 'package:app/app/core/ui/theme_extension.dart';
import 'package:app/app/core/widget/todo_list_field.dart';
import 'package:app/app/core/widget/todo_list_logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Todo List",
              style: TextStyle(
                fontSize: 10,
                color: context.primaryColor,
              ),
            ),
            Text(
              "Cadastro",
              style: TextStyle(
                fontSize: 15,
                color: context.primaryColor,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: const FittedBox(
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40, vertical: 20,
            ),
            child: Form(
              child: Column(
                children: [
                  TodoListField(label: "E-mail"),
                  const SizedBox( height: 20, ),
                  TodoListField(label: "Senha", obscureText: true),
                  const SizedBox( height: 20, ),
                  TodoListField(label: "Confirmar senha", obscureText: true,),
                  const SizedBox( height: 20, ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Salvar"),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
