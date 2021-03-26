import 'package:onlock/Login/rootPage.dart';
import 'package:onlock/service/autenticacao.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new RootPage(auth: new Auth());
  }
}
