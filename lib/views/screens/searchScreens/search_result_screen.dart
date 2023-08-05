import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/follow_controller.dart';

import '../../../utilis/constants.dart';

class SearchResultScreen extends StatelessWidget {
  final Future<List<dynamic>> searchResults;

  const SearchResultScreen({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: FutureBuilder<List<dynamic>>(
        future: searchResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const Center(child: Text('No search results found.'));
          } else {
            List<dynamic> searchResults = snapshot.data!;
            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${searchResults[index]['name']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${searchResults[index]['email']}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          FollowController().addFollow(
                              id: searchResults[index]['id'].toString());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.kSecondaryColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Text(
                            'Follow ',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
