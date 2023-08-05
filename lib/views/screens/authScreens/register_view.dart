import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tt9_betweener_challenge/controllers/auth_controller.dart';
import 'package:tt9_betweener_challenge/utilis/assets.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';
import 'package:tt9_betweener_challenge/views/widgets/secondary_button_widget.dart';

import '../../../../views/widgets/google_button_widget.dart';
import '../../../controllers/pref_controller.dart';
import '../main_app_view.dart';

class RegisterView extends StatefulWidget {
  static String id = '/registerView';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void submitRegister() async {
    if (_formKey.currentState!.validate()) {
      final body = {
        'email': emailController.text,
        'name': nameController.text,
        'password': passwordController.text,
        'password_confirmation': passwordController.text,
      };

      AuthController().register(body).then((user) async {
        await SharedPrefController().save(user: user);

        if (mounted) {
          Navigator.pushReplacementNamed(context, MainAppView.id);
        }
      }).catchError((err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.red,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Hero(
                      tag: 'authImage',
                      child: SvgPicture.asset(AssetsData.authImage),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter the name';
                      }
                      return null;
                    },
                    controller: nameController,
                    hint: 'John Doe',
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter the email';
                      }
                      return null;
                    },
                    controller: emailController,
                    hint: 'example@gmail.com',
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter the password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    hint: 'Enter password',
                    label: 'password',
                    password: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SecondaryButtonWidget(
                    onTap: submitRegister,
                    text: 'REGISTER',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '-  or  -',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GoogleButtonWidget(onTap: () {}),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
