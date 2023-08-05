import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/utilis/constants.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';

import '../widgets/secondary_button_widget.dart';

class EditUserInfo extends StatefulWidget {
  const EditUserInfo({super.key});

  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Edit User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: form,
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                radius: 90,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the name';
                  }
                  return null;
                },
                controller: emailController,
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
                hint: 'email',
                label: 'Email',
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the phone';
                  }
                  return null;
                },
                controller: phoneController,
                hint: '970590000000',
                label: 'phone',
              ),
              const SizedBox(
                height: 24,
              ),
              SecondaryButtonWidget(
                onTap: () {},
                text: 'SAVE',
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
