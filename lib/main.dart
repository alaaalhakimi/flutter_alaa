import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models/alaa_form_data.dart';
import 'validators/Alaa_form_validator.dart';
import 'widgets/Alaa_custom_text_field.dart';
import 'widgets/Alaa_custom_container_painter.dart';
import 'controllers/theme_controller.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
  final _alaaData = AlaaFormData();
  bool _isPasswordVisible = false;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alaa Form'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Obx(() => Icon(
              ThemeController.to.isDarkMode.value
                  ? Icons.light_mode
                  : Icons.dark_mode,
            )),
            onPressed: ThemeController.to.toggleTheme,
          ),
        ],
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
            colors: ThemeController.to.isDarkMode.value
                ? [Colors.grey[900]!, Colors.black]
                : [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: GetBuilder<ThemeController>(
              builder: (controller) => CustomPaint(
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
                          validator: AlaaFormValidator.validateUsername,
                          onSaved: (value) => _alaaData.username = value,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(height: 15),
                        _buildFormField(
                          label: 'Email',
                          icon: Icons.email,
                          validator: AlaaFormValidator.validateEmail,
                          onSaved: (value) => _alaaData.email = value,
                          keyboardType: TextInputType.emailAddress,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(height: 15),
                        _buildFormField(
                          label: 'Phone',
                          icon: Icons.phone,
                          validator: AlaaFormValidator.validatePhone,
                          onSaved: (value) => _alaaData.phone = value,
                          keyboardType: TextInputType.phone,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(height: 20),
                        _buildFormField(
                          label: 'Password',
                          icon: Icons.lock,
                          validator: AlaaFormValidator.validatePassword,
                          onSaved: (value) => _alaaData.password = value,
                          isPassword: true,
                          passwordVisible: _isPasswordVisible,
                          onTogglePassword: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: ThemeController.to.isDarkMode.value
                                ? Colors.grey[850]!.withOpacity(0.7)
                                : Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Get.isDarkMode
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.blue.withOpacity(0.1),
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
      if (!_agreedToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You must agree to the terms and conditions'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
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
