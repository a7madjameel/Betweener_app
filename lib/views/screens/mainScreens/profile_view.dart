import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tt9_betweener_challenge/controllers/follow_controller.dart';
import 'package:tt9_betweener_challenge/controllers/pref_controller.dart';
import 'package:tt9_betweener_challenge/models/follow_statistic.dart';
import 'package:tt9_betweener_challenge/utilis/constants.dart';
import 'package:tt9_betweener_challenge/views/screens/followScreens/followers_screen.dart';
import 'package:tt9_betweener_challenge/views/screens/followScreens/following_screen.dart';
import 'package:tt9_betweener_challenge/views/screens/linkScreens/edit_link.dart';

import '../../../controllers/link_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../models/user.dart';

class ProfileView extends StatefulWidget {
  static String id = '/profileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<User> user;
  late Future<List<Link>> links;

  @override
  void initState() {
    user = getLocalUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 130,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            SharedPrefController.instance.userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            SharedPrefController.instance.userEmail,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            '0594044816',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          FutureBuilder<Follow>(
                              future: FollowController().getFollow(),
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  Follow follow = snap.data!;
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          var followers = follow.followers;
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (ctx) {
                                            return FollowersScreen(
                                                followers: followers!);
                                          }));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: AppColors.kSecondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            'followers ${follow.followersCount}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var following = follow.following;
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (ctx) {
                                            return FollowingScreen(
                                                following: following!);
                                          }));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: AppColors.kSecondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Text(
                                            'following ${follow.followingCount}',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                if (snap.hasError) {
                                  return Text(snap.error.toString());
                                }
                                return const Text('loading');
                              })
                        ],
                      ),
                      const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: FutureBuilder(
                future: LinksController().getLinks(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 120,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final link = snapshot.data?[index];
                          return Slidable(
                            startActionPane: ActionPane(
                              extentRatio: 0.6,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (v) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (ctx) {
                                      return EditLink(link: link!);
                                    }));
                                  },
                                  backgroundColor: AppColors.kSecondaryColor,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                ),
                                SlidableAction(
                                  onPressed: (v) {
                                    setState(() {
                                      LinksController()
                                          .deleteLinks(id: link!.id as int);
                                    });
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (v) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (ctx) {
                                        return EditLink(link: link!);
                                      }));
                                    },
                                    backgroundColor: AppColors.kSecondaryColor,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                  ),
                                  SlidableAction(
                                    onPressed: (v) {
                                      setState(() {
                                        LinksController()
                                            .deleteLinks(id: link!.id as int);
                                      });
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                ]),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.kLightDangerColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    '${link.link}',
                                    style: const TextStyle(
                                      color: AppColors.kOnSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 24,
                          );
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const Text('loading');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
