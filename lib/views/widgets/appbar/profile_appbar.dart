import 'package:flutter/material.dart';

import '../../../utilis/constants.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        "Profile",
        style: TextStyle(color: AppColors.kPrimaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
