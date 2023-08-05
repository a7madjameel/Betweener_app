// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';

import '../../../controllers/link_controller.dart';
import '../../../models/link.dart';
import '../../widgets/secondary_button_widget.dart';
import '../main_app_view.dart';

class EditLink extends StatefulWidget {
  static const id = '1231';

  const EditLink({
    Key? key,
    required this.link,
  }) : super(key: key);
  final Link link;

  @override
  State<EditLink> createState() => _EditLinkState();
}

class _EditLinkState extends State<EditLink> {
  TextEditingController linkController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.link.title!;
    linkController.text = widget.link.link!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Edit'),
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
                hint: 'Snapchat',
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
                hint: 'snapchat@gmail.com',
                label: 'Link',
              ),
              const SizedBox(
                height: 24,
              ),
              SecondaryButtonWidget(
                onTap: () {
                  if (form.currentState!.validate()) {
                    LinksController().updateLink(
                        id: widget.link.id!,
                        title: titleController.text,
                        link: linkController.text);
                    Navigator.pushReplacementNamed(context, MainAppView.id);
                  }
                },
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
