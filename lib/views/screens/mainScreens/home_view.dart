import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/utilis/assets.dart';

import '../../../controllers/pref_controller.dart';
import '../../../models/link.dart';
import '../../../models/user.dart';
import '../../../utilis/constants.dart';
import '../linkScreens/add_link.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<User> user;
  late Future<List<Link>> links;

  @override
  void initState() {
    user = getLocalUser();
    links = LinksController().getLinks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, ${SharedPrefController.instance.userName}!',
            style: const TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              AssetsData.qrImage,
              width: 320,
              height: 340,
              color: AppColors.kPrimaryColor,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          FutureBuilder(
            future: links,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final link = snapshot.data?[index];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.kSecondaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${link!.title}',
                                    style: const TextStyle(
                                      color: AppColors.kOnSecondaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${link.username}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.kOnSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: snapshot.data!.length,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AddLink.id);
                        },
                        child: Container(
                            height: 100,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.kLightPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: AppColors.kPrimaryColor,
                                ),
                                Text(
                                  'Add Link',
                                  style: TextStyle(
                                    color: AppColors.kPrimaryColor,
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                );
              }
              return const Text('loading');
            },
          ),
        ],
      ),
    );
  }
}
