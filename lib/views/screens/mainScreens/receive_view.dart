import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tt9_betweener_challenge/utilis/assets.dart';
import 'package:tt9_betweener_challenge/utilis/constants.dart';

class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset(
            AssetsData.receiveImage,
            width: 120,
            height: 250,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.kLightPrimaryColor,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 48,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Ahmad Jameel',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
