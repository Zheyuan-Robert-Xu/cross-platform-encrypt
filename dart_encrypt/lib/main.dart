import 'package:dart_encrypt/methods/appFullEncrypt.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  // print('AES CBC 256 String encryption with random key');
                  // final plaintext =
                  //     'The quick brown fox jumps over the lazy dog';
                  // printC('plaintext: ' + plaintext);

                  // generate random key
                  // var encryptionKey = generateRandomAesKey();
                  // var encryptionKeyBase64 = base64Encoding(encryptionKey);

                  var encryptionKeyBase64 =
                      base64Encoding(generateCertainAesKey('solidtest47'));

                  var encryptionKey = base64Decoding(encryptionKeyBase64);

                  // print('encryptionKey (Base64): ' + encryptionKeyBase64);

                  // encryption
                  // printC('\n* * * Encryption * * *');
                  String ciphertextBase64 =
                      'eJZDb5OHvZD1mMpwXMEVEA==:0OUsrPCL9XpOVfY4gjDPsGRuDyYyyXi7DjV+tAeArcdgNlEXPDRK/lOt1muChnu3';
                  // String ciphertextBase64 = aesCbcEncryptionToBase64(encryptionKey, plaintext);
                  // printC('ciphertext (Base64): ' + ciphertextBase64);
                  // printC('output is (Base64) iv : (Base64) ciphertext');

                  // printC('\n* * * Decryption * * *');
                  var ciphertextDecryptionBase64 = ciphertextBase64;
                  // printC('ciphertext (Base64): ' + ciphertextDecryptionBase64);
                  // printC('input is (Base64) iv : (Base64) ciphertext');
                  var decryptedtext = aesCbcDecryptionFromBase64(
                      encryptionKey, ciphertextDecryptionBase64);
                  printC('plaintext:  ' + decryptedtext);
                },
                child: const Text('Encrypt data')),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

generateCertainAesKey(String password) {
  while (password.length < 32) {
    password = password + password;
  }
  password = password.substring(0, 32);
  return utf8.encode(password);
}
