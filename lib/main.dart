import 'package:flutter/material.dart';
import 'models/Alaa_form_data.dart';
import 'validators/Alaa_form_validator.dart';
import 'widgets/Alaa_custom_text_field.dart';
import 'widgets/Alaa_custom_container_painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: AlaaForm(),
    );
  }
}

class AlaaForm extends StatefulWidget {
  @override
  _AlaaFormState createState() => _AlaaFormState();
}

class _AlaaFormState extends State<AlaaForm> {
  final _alaaFormKey = GlobalKey<FormState>();
  final _alaaData = FormData();
  bool _isPasswordVisible = false;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alaa Form'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: CustomPaint(
              painter: CustomContainerPainter(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
                child: Form(
                  key: _alaaFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10),
                      _buildFormField(
                        label: 'Username',
                        icon: Icons.person,
                        validator: FormValidator.validateUsername,
                        onSaved: (value) => _alaaData.username = value,
                        textDirection: TextDirection.ltr,
                      ),
                      SizedBox(height: 15),
                      _buildFormField(
                        label: 'Email',
                        icon: Icons.email,
                        validator: FormValidator.validateEmail,
                        onSaved: (value) => _alaaData.email = value,
                        keyboardType: TextInputType.emailAddress,
                        textDirection: TextDirection.ltr,
                      ),
                      SizedBox(height: 15),
                      _buildFormField(
                        label: 'Phone',
                        icon: Icons.phone,
                        validator: FormValidator.validatePhone,
                        onSaved: (value) => _alaaData.phone = value,
                        keyboardType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                      ),
                      SizedBox(height: 20),
                      _buildFormField(
                        label: 'Password',
                        icon: Icons.lock,
                        validator: FormValidator.validatePassword,
                        onSaved: (value) => _alaaData.password = value,
                        isPassword: true,
                        passwordVisible: _isPasswordVisible,
                        onTogglePassword: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        textDirection: TextDirection.ltr,
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: _agreedToTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _agreedToTerms = value ?? false;
                                  });
                                },
                                activeColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'I agree to the terms and conditions',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
    required Function(String?) onSaved,
    TextInputType? keyboardType,
    bool isPassword = false,
    bool passwordVisible = false,
    VoidCallback? onTogglePassword,
    TextDirection? textDirection,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: CustomTextField(
        label: label,
        icon: icon,
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        isPassword: isPassword,
        passwordVisible: passwordVisible,
        onTogglePassword: onTogglePassword,
        textDirection: textDirection ?? TextDirection.rtl,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  void _submitForm() {
    if (_alaaFormKey.currentState!.validate()) {
      _alaaFormKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Alaa form submitted'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      print(_alaaData.toMap());
    }
  }
}