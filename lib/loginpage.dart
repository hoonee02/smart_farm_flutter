import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _id = 'null';
  String _pw = 'null';
  static final storage = FlutterSecureStorage();
  var loginid = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'ID'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your ID';
                }
                return null;
              },
              onSaved: (value) => _id = value ?? 'null',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your PW';
                }
                return null;
              },
              onSaved: (value) => _pw = value ?? 'null',
            ),
            TextButton(
                onPressed: _submit,
                child: Text('Submit')
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _login(_id, _pw);
    }
  }

  void _login(String email, String password) async {
    final uri = Uri(
        scheme: 'http',
        host:'192.168.1.43',
        port: 5001,
        path: '/loginapp',
        queryParameters: {'id': email, 'pw': password}
    );
    final response = await http.post(uri);
    final responseJson = json.decode(response.body);
    if (responseJson['success']) {
      print('success');
      String token = responseJson['token'];
      Map<String, dynamic> payload = JwtDecoder.decode(token);
      loginid = payload['user_id'];
      var val = {loginid:token};
      var value = json.encode(val);
      await storage.write( key: 'login', value: value );
      // var storagevalue = storage.read(key: 'login');
      // print(storagevalue);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MainPage()),
      // );
    } else {
      print(responseJson['message']);
    }
  }
}