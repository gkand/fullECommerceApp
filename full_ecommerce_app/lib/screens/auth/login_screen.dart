import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/screens/auth/signup_screen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = true;

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void _submitData() {
    final _isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isValid) {
      _formKey.currentState!.save();
    }
  }

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  Colors.orangeAccent,
                  Colors.tealAccent,
                  Colors.pinkAccent,
                  Colors.deepPurpleAccent,
                ],
                durations: [35000, 11000, 10800, 6000],
                heightPercentages: [0.01, 0.02, 0.03, 0.1],
                blur: const MaskFilter.blur(BlurStyle.solid, 0),
              ),
              heightPercentange: 0.2,
              size: const Size(double.infinity, double.infinity),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 65),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _email = value!;
                      },
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _password = value!;
                      },
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must be atleast 8 units';
                        }
                        return null;
                      },
                      onEditingComplete: _submitData,
                      obscureText: _isVisible,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _changeVisibility();
                          },
                          icon: _isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: _submitData,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignupScreen.routeName);
                  },
                  child: const Text(
                    'Create an account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
