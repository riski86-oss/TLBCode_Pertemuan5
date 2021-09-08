import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screen/home_page.dart';
import 'package:todo_app/screen/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isPasswordHide = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    final _emailField = TextFormField(
      controller: _emailController,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (String? value){
        if(value == null){
          return 'Email tidak boleh kosong';
        }
      },
      decoration: const InputDecoration(
        errorStyle: TextStyle(color: Colors.red),
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        )
      ),
      keyboardType: TextInputType.emailAddress,
    );

    final _passwordField = TextFormField(
      controller: _passwordController,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (String? value){
        if(value == null){
          return 'Password tidak boleh kosong';
        }
      },
      obscureText: _isPasswordHide,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: GestureDetector(
          child: Icon(
            _isPasswordHide ? Icons.visibility : Icons.visibility_off, color: Colors.white
          ),
          onTap: (){
            setState(() {
              _isPasswordHide = !_isPasswordHide;
            });
          },
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        )
      ),
    );

    final _loginButton = ElevatedButton(
      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage())),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15)
      ),
      child: const Text("Masuk", style: TextStyle(color: Colors.indigo, fontSize: 17.0)),
    );

    return Scaffold(
      backgroundColor: Colors.indigo,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Todo App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0)),
              const SizedBox(height: 10.0),
              const Text('Silakan masuk dengan akun anda', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 40.0),
              _emailField,
              const SizedBox(height: 30.0),
              _passwordField,
              const SizedBox(height: 30.0),
              _loginButton,
              const SizedBox(height: 10),
              const Text("atau masuk dengan :", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Image.asset("images/google.png", width: 35, height: 35),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun?",
                  style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
                    child: const Text("Daftar", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}