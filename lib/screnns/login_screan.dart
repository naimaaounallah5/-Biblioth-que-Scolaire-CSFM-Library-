import 'package:flutter/material.dart';
import 'package:bibliotheque_scolaire_csfm_library/style/style.dart';
//Email : test@test.com
//Mot de passe : 12345678
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Exemple simple : vérification d’un email et mot de passe précis
      if (_email == 'test@test.com' && _password == '12345678') {
        // Connexion réussie
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Connexion réussie !'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Connexion échouée
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Connexion échouée !'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Veuillez entrer votre email.';
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    if (!emailRegExp.hasMatch(value)) return 'Email invalide.';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Veuillez entrer votre mot de passe.';
    if (value.length < 8) return 'Le mot de passe doit contenir au moins 8 caractères.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo unique en haut
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text('BiblioScolaire', style: titleStyle),
                const SizedBox(height: 8),
                Text('Gestion simplifiée de la bibliothèque', style: subtitleStyle),
                const SizedBox(height: 40),

                // Formulaire
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: kInputDecoration('Email', Icons.email_outlined),
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                        onSaved: (value) => _email = value ?? '',
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        decoration: kInputDecoration('Mot de passe', Icons.lock_outline),
                        validator: _validatePassword,
                        onSaved: (value) => _password = value ?? '',
                      ),
                      const SizedBox(height: 35),
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: buttonGradient,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _submitForm,
                            borderRadius: BorderRadius.circular(15),
                            child: Center(
                              child: Text('SE CONNECTER', style: buttonTextStyle),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Mot de passe oublié ?',
                          style: TextStyle(color: infoLightColor.withOpacity(0.9)),
                        ),
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
