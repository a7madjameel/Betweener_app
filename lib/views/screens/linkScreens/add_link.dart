import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/views/screens/main_app_view.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';

import '../../widgets/secondary_button_widget.dart';

class AddLink extends StatefulWidget {
  static const id = '/AddLink';

  const AddLink({super.key});

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  TextEditingController linkController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Add Link'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: form,
          child: Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the title';
                  }
                  return null;
                },
                controller: titleController,
                hint: 'instagram',
                label: 'Title',
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the Link';
                  }
                  return null;
                },
                controller: linkController,
                hint: 'https://www.instagram.com/',
                label: 'Link',
              ),
              const SizedBox(
                height: 24,
              ),
              SecondaryButtonWidget(
                onTap: () {
                  if (form.currentState!.validate()) {
                    LinksController().addLink(
                        title: titleController.text, link: linkController.text);
                    Navigator.pushReplacementNamed(context, MainAppView.id);
                  }
                },
                text: 'ADD',
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
