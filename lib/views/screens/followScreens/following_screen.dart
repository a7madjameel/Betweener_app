import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/models/follow_statistic.dart';

import '../../../utilis/constants.dart';

class FollowingScreen extends StatelessWidget {
  final List<FollowerElement> following;

  const FollowingScreen({super.key, required this.following});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Following')),
      body: following.isEmpty
          ? const Center(
              child: Text(
              'No Following Yet',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor),
            ))
          : ListView.builder(
              itemCount: following.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                  decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${following[index].name}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${following[index].email}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
