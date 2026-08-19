import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String emailRegex = r'^[\a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  @override

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if(formKey.currentState!.validate()) {
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('login sucessfull'))
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          
          children: [
            const Center(
              child: Image(image: AssetImage("assets/images/first.png"),
              width: 100,
              height: 100,
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Welcome back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 4, 129),
              ),
            ),
            const SizedBox(height: 5,),
            const Text(
              'Sign in to your account',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 30,),
            Form(
              key: formKey,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                     fontSize: 20,
                     fontFamily: 'Poppins',
                     fontWeight: FontWeight.bold,
                     color: Color.fromARGB(255, 12, 4, 129),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      suffixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 12, 4, 129),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please enter your email';
                      }
                    if (!RegExp(emailRegex).hasMatch(value)){
                      return 'Please enter a valid email';
                    }
                    return null;
                    }
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 4, 129),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'XXXXXX',
                      suffixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 12, 4, 129),),
                      iconColor: Colors.blue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6){
                        return 'Password should be atleast 6 character';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                   Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                      ),
                  ),
                  const SizedBox(height: 15,), 
                   SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 12, 4, 129),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ), 
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No Account?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        }, 
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                        )
                    ],
                  ),
        ),
    );
  }
}