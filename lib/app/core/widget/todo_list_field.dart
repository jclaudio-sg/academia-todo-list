import 'package:app/app/core/widget/todo_list_icons.dart';
import 'package:flutter/material.dart';

class TodoListField extends StatelessWidget {

  final String label;
  final bool obscureText;
  final IconButton? sufixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  TodoListField({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.sufixIconButton,
    this.controller,
    this.validator,
  }) : assert( obscureText == true ? sufixIconButton == null : true,
        "obscureText não pode ser enviado em conjunto com suffixIconButton." ),
        obscureTextVN = ValueNotifier( obscureText ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            isDense: true,
            suffixIcon: sufixIconButton ??
                ( obscureText == true
                    ? IconButton(
                      onPressed: () => obscureTextVN.value = !obscureTextVN.value,
                      icon: Icon(
                        obscureTextVN.value
                            ? Todolisticons.eye
                            : Todolisticons.eye_slash,
                        size: 15,
                      ),
                    )
                    : null
                ),
          ),
        );
      }
    );
  }
}
