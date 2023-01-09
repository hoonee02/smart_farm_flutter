import 'package:flutter/material.dart';
import 'httpService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? id = null;
  String? pw = null;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login page')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
        ),
        child:Form(
          key: formkey,
          child: Column(
            children: [
              TextField(
                obscureText: false,
                decoration: InputDecoration(hintText: '아이디를 입력하세요'),
                onChanged: (value){
                  setState(() {
                    id = value;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: '비밀번호를 입력하세요'),
                onChanged: (value){
                  setState(() {
                    pw = value;
                  });
                },
              ),
              InkWell(
                onTap: () async{
                  print(id);
                  print(pw);
                  await HttpService.login(id,pw,context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
