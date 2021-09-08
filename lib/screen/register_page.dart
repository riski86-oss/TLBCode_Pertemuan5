import 'package:flutter/material.dart';
import 'package:todo_app/screen/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordHide = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _nameField = TextFormField(
      controller: _nameController,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (String? value){
        if(value == null){
          return 'Nama tidak boleh kosong';
        }
      },
      decoration: const InputDecoration(
        errorStyle: TextStyle(color: Colors.red),
        hintText: 'Nama',
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
    );

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

    final _registerButton = ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15)
      ),
      child: const Text("Daftar", style: TextStyle(color: Colors.indigo, fontSize: 17.0)),
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
              const Text('Silakan daftar dengan email anda', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 40.0),
              _nameField,
              const SizedBox(height: 30),
              _emailField,
              const SizedBox(height: 30.0),
              _passwordField,
              const SizedBox(height: 30.0),
              _registerButton,
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun?",
                  style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                    child: const Text("Login", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
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