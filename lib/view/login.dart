import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ujikom/provider/auth_service.dart';
import 'package:ujikom/shared/theme.dart';
import 'package:ujikom/view/home.dart';
import 'package:ujikom/view/register.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _loginState();
}

class _loginState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  firebaseuasathservice authService = firebaseuasathservice();

  Future<void> login() async {
    try {
      final result = await authService.loginakun(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result != null && result.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${result.user!.email} berhasil login'),
          ),
        );
        // Navigasi ke halaman beranda jika login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login gagal. Email atau password salah.'),
          ),
        );
      }
    } catch (e) {
      print('Login gagal: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat login. Silakan coba lagi.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "yang bener aja ga",
                style: BlactTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Login",
                style: BlactTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 60,
                ),
              ),
              Text(
                "rugi donk !!!",
                style: BlactTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whitecolor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Masukkan Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Masukkan Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: login,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(whitecolor),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: blueTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text("Or"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => register()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(whitecolor),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        ),
                      ),
                      child: Text(
                        "Register",
                        style: BlactTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
