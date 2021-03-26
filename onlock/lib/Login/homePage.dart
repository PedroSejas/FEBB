import 'package:onlock/service/autenticacao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    _checkEmailVerification();
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Validação de cadastro"),
          content: new Text("Para validação do cadastro, um link foi enviado para o seu e-mail"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Reenviar Link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Validação de Cadastro . . ."),
          content: new Text("O Link foi enviado para sua conta de e-mail."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  Widget _showInfo() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(child: Text('Olá, você está registrado e autenticado no OnLock',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0),)),
    );
  }

  Widget _showLogo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
      //child: Image.asset('assets/imagens/logo_p.png'),
      child: Icon(Icons.login, size: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ExploreApp Login'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _showLogo(),
            _showInfo()]),
    );
  }
}