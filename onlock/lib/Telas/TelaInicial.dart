import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:onlock/Login/login.dart';

import 'TelaBiometria.dart';


class Telainicial extends StatefulWidget {
  @override
  _Telainicial createState() => _Telainicial();
}

class _Telainicial extends State<Telainicial> {

  var _title = "OnLock ";
  var _message = "Toque no botão para destravar a fechadura";
  var _icone = Icons.lock;
  var _colorIcon = Colors.yellow;
  var _colorButton = Colors.blue;
  var _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
      }
      if (_selectedIndex == 2){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => TelaBiometria()));
      }

    }
    );
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("OnLock - Fechadura Eletrônica"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Logo2.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: 'Acesso',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );;
  }
}