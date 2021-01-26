import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(MyLock());


//Splash Screen - Tela de entrada
class MyLock extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Splash Screen Flutter'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff9e9e9e),
            Color(0xffffffff),
          ],
        ),
        navigateAfterSeconds: Telainicial(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.jpeg"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}



//Tela inicial ao abrir o App
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

  final LocalAuthentication _localAuth = LocalAuthentication();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );
  }

  Future<void> _checkBiometricSensor() async {
    try {
      var authenticate = await _localAuth.authenticateWithBiometrics(
          localizedReason: 'Por favor autentique-se para destravar');
      setState(() {
        if (authenticate) {
          _title = "OK";
          _message = "Fechadura destravada!!";
          _icone = Icons.beenhere;
          _colorIcon = Colors.green;
          _colorButton = Colors.green;
        } else {
          _title = "Ops!";
          _message = "Tente novamente!\n Fechadura continua travada.";
          _icone = Icons.clear;
          _colorIcon = Colors.red;
          _colorButton = Colors.red;
        }
      });
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        setState(() {
          _title = "Desculpe";
          _message = "Não conseguimos encontrar o sensor biométrico :(";
          _icone = Icons.clear;
          _colorIcon = Colors.red;
          _colorButton = Colors.red;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnLock - Fechadura Eletrônica"),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                        child: ListTile(
                          leading: Icon(
                            _icone,
                            color: _colorIcon,
                            size: 60,
                          ),
                          title: Text(
                            _title,
                            style: TextStyle(fontSize: 30),
                          ),
                          subtitle: Text(
                            _message,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 150,
                    height: 100, // specific value
                    child: RaisedButton(
                      color: _colorButton,
                      child: Icon(Icons.fingerprint, size: 80),
                      onPressed: _checkBiometricSensor,
                    )
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Dados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );;
  }
}