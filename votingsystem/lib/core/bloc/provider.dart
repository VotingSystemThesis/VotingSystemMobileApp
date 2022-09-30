import 'package:flutter/material.dart';
import 'package:votingsystem/core/bloc/userLoginBloc.dart';

class Provider extends InheritedWidget {
  static Provider? _instancia;
  factory Provider({Widget? child}) {
    _instancia ??= Provider._internal(child: child!);
    return _instancia!;
  }
  Provider._internal({Widget? child}) : super(child: child!);
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  final loginBloc = UserLoginBloc();

  static UserLoginBloc loginBlocOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }

  static Provider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }
}
