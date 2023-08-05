import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/models/follow_statistic.dart';

import '../../../utilis/constants.dart';

class FollowersScreen extends StatelessWidget {
  final List<FollowerElement> followers;

  const FollowersScreen({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Followers')),
      body: followers.isEmpty
          ? const Center(
              child: Text(
              'No Followers Yet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              ),
            ))
          : ListView.builder(
              itemCount: followers.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${followers[index].name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${followers[index].email}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
