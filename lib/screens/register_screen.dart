// register_screen.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _saving = false;

  Future<void> _register() async {
    setState(() => _saving = true);
    final res = await ApiService.register(_name.text.trim(), _email.text.trim(), _password.text.trim());
    setState(() => _saving = false);
    if (res != null && res['token'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registered — logged in')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(controller: _name, decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 8),
            TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 8),
            TextField(controller: _password, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: _saving ? null : _register, child: _saving ? const CircularProgressIndicator(color: Colors.white) : const Text('Create account'))
          ],
        ),
      ),
    );
  }
}