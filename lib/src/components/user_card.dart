import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/avatar_widget.dart';

class UserCard extends StatelessWidget {
  final String userId;
  final String description;

  const UserCard({
    Key? key,
    required this.userId,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade100,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            top: 0,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(height: 10),
                AvatarWidget(
                  type: AvatarType.TYPE2,
                  thumbPath:
                      'https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg',
                  size: 80,
                ),
                const SizedBox(height: 10),
                 Text(
                  userId,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                 Text(
                  '$userId님이 팔로우 합니다.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('팔로우'),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
