import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Import the 'signup.dart' file
import 'signup.dart';

void main() {
  // Run the app with the provided MaterialApp configuration
  runApp(
    MaterialApp(
      theme: ThemeData(
        // brightness: Brightness.dark,
        fontFamily: 'georgia',
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    ),
  );
}

// Define the MyHomePage widget as a StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Define the state for MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  // Create a global key to identify the form
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();

  // Create controllers for email and password input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define a regular expression pattern for email validation
  static final RegExp emailValid = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Build the main content as a form
      body: Form(
        key: _signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the Twitter icon
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
            ),
            // Display the login title
            const Text(
              'Log in to Twitter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Email input field
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(color: Colors.black87),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!emailValid.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            // Password input field
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ),
            // Login button
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  // Validate the form and print email/password if valid
                  if (_signInKey.currentState!.validate()) {
                    debugPrint('Email: ${_emailController.text}');
                    debugPrint('Password: ${_passwordController.text}');
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            // Sign up button
            TextButton(
              onPressed: () {
                // Navigate to the SignUp page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              child: const Text("Don't have an account? Sign up here"),
            )
          ], // End of children list
        ),
      ),
    );
  }
}
