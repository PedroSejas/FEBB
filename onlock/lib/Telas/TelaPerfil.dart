import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TelaPerfil extends StatefulWidget {
  TelaPerfil({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TelaPerfil createState() => _TelaPerfil();
}

class _TelaPerfil extends State<TelaPerfil> {

  /*void ImagemGaleria() async {
    // ignore: deprecated_member_use
    imagemTemporaria = (await ImagePicker.pickImage(source: ImageSource.gallery)) as File;
    setState((){
      imagem = imagemTemporaria;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  )
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Container (
                    padding: EdgeInsets.only(top: 100),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/Érico.jpg"),
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 50,
                    ),
                    child: Text('Email',
                        style: TextStyle(
                          color: Color(0X8AFFFFFF),
                          fontSize: 24,
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40, left: 80, right: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget> [
                          Icon(Icons.lock_open_rounded, color: Colors.white, size: 40),
                          Text('12',
                              style: TextStyle(
                                color: Colors.white,
                              )
                          ),
                        ]
                      ),
                      Column(
                        children: <Widget> [
                          Icon(Icons.people_alt_outlined, color: Colors.white, size: 40),
                          Text('Group',
                          style: TextStyle(color: Colors.white))
                        ]
                      )
                    ]
                   )
                  ),
                ],
              )
           ),
           Container(
             height: 315,
               padding: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/GifGoogle.gif"),
                  )
              )
          )
        ],
      )
    );
  }
}