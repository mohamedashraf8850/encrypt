import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';

class aesPage extends StatefulWidget {
  @override
  _aesPageState createState() =>
      _aesPageState();
}

class _aesPageState
    extends State<aesPage> {
  TextEditingController PC = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  encriptanddecrypt(){
    final plainText = '${PC.text}';
    final key = Keyo.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    setState((){
      PC.text = encrypted.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            TextFormField(
       controller: PC,
              maxLines: 50,
            ),
            RaisedButton(
              onPressed:encriptanddecrypt ,
            )
          ],
        ),
      ),
    );
  }

 
}
