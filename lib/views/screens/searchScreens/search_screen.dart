import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/search.dart';
import 'package:tt9_betweener_challenge/views/screens/searchScreens/search_result_screen.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';
import 'package:tt9_betweener_challenge/views/widgets/secondary_button_widget.dart';

import '../../../utilis/constants.dart';

class SearchScreen extends StatefulWidget {
  static const id = '/searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(color: AppColors.kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: form,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTextFormField(
              label: 'Search by name',
              controller: searchController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 200,
            ),
            SecondaryButtonWidget(
                onTap: () {
                  if (form.currentState!.validate()) {
                    Future<List> data =
                        Search().searchByName(name: searchController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return SearchResultScreen(searchResults: data);
                    }));
                  }
                },
                text: 'Search')
          ]),
        ),
      ),
    );
  }
}
