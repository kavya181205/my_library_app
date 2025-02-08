import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_library_app/loginpage.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _email;
  String? _password;
  String? _confirmPassword;

  void _submit() {
    if (_formKey.currentState!.validate()) {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
      
    }
  }
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 20,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                       Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone No',
                          hintText: 'Phone No',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return 'Please enter your phone No';
                          }
                          if(value.length<10)
                          {
                            return 'Please enter valid phone No';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                        
                      SizedBox(height: 10),
                     
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      SizedBox(height: 10),
                      
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null; 
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'confirm password',
                          hintText: 'confirm password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if(_passwordController!=_confirmPasswordController)
                          {
                          return 'Password does not match';
                          }
                          if (value.length < 6) 
                          {
                            return 'Password must be at least 6 characters long';
                          }
                          return null; 
                          
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                     const  SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            _auth.createUserWithEmailAndPassword(
                              email: _emailController.text.toString(), 
                              password:_passwordController.text.toString(),
                              );
                
                        }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('Sign Up'),
                       
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Loginpage()),
                                );
                                },
                                child: Text('Login'),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
