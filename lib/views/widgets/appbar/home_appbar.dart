import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/views/screens/searchScreens/search_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
            icon: const Icon(Icons.search)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.qr_code_scanner),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
