import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String emailRegex = r'^[\a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _checkPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    _checkPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
  if (formKey.currentState!.validate()) {
    
  }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
       child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(image: AssetImage("assets/images/first.png"),
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 10,),
            const Center(
              child: Text(
                'Create an Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color:  Color.fromARGB(255, 12, 4, 129),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            const Center(
              child: Text(
                'join us an enjoy seamless ordering',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Form(
              key: formKey,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 12, 4, 129),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration:  InputDecoration(
                      hintText: 'Tchakoutio Gamaliel Adriel',
                      suffixIcon: const Icon(Icons.person, color:  Color.fromARGB(255, 12, 4, 129),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Full Name is required';
                      }
                      if (value.trim().length < 3) {
                        return 'Name must be atleast 3 character';
                      }
                      return null;

                    },
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 4, 129)
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      suffixIcon: const Icon(Icons.email, color:  Color.fromARGB(255, 12, 4, 129)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(emailRegex).hasMatch(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                
              
              
                 const SizedBox(height: 5,),
                 const Text(
                 'Phone',
                 style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 4, 129),
                  ),
                 ),
                 const SizedBox(height: 5,),
                 TextFormField(
                 controller: _numberController,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                  hintText: '652472779',
                  suffixIcon: const Icon(Icons.phone, color: Color.fromARGB(255, 12, 4, 129),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    )
                  ),
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  }
                  if (value.trim().length < 9) {
                    return 'phone number should be atleast 9 digits';
                  }
                  return null;
                  },
                 ),
                 const SizedBox(height: 5,),
                 const Text(
                  'Password',
                  style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 4, 129),
                  ),
                 ),
                 const SizedBox(height: 5,),
                 TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                   hintText: 'XXXXXX',
                   suffixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 12, 4, 129),),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                   ),
                  ),
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is require';
                  }
                  if (value.trim().length < 6) {
                    return 'Password should be atleast 6 character';
                  }
                  return null;
                 },
                ),
                const SizedBox(height: 10,),
                const Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 4, 129),
                ),
               ),
               const SizedBox(height: 5,),
               TextFormField(
                 controller: _checkPasswordController,
                 keyboardType: TextInputType.text,
                 obscureText: true,
                 decoration: InputDecoration(
                  hintText: 'XXXXXX',
                  suffixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 12, 4, 129),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Password is require';
                   }
                   if (value != _passwordController.text) {
                     return 'Password do not match';
                   }
                   return null;
                 },
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
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have account?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        }, 
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                        )
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