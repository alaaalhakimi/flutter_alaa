import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  final Function(String?) onSaved;
  final VoidCallback? onTogglePassword;
  final bool passwordVisible;
  final TextDirection textDirection;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    this.keyboardType,
    required this.validator,
    required this.onSaved,
    this.onTogglePassword,
    this.passwordVisible = false,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blue.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        prefixIcon: Icon(icon, color: Colors.blue),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.blue,
                ),
                onPressed: onTogglePassword,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      textDirection: textDirection,
      textAlign: textDirection == TextDirection.rtl ? TextAlign.right : TextAlign.left,
      obscureText: isPassword && !passwordVisible,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }
} 