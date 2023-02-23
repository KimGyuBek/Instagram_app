import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/avatar_widget.dart';
import 'package:flutter_instagram/src/components/image_data.dart';
import 'package:flutter_instagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _mystory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              'https://img.danawa.com/prod_img/500000/869/844/img/2844869_1.jpg?shrink=330:330&_v=20210325103140',
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _mystory(),
        const SizedBox(width: 5),
        ...List.generate(
          20,
          (index) => AvatarWidget(
            type: AvatarType.TYPE1,
            thumbPath: 'http://kcm.co.kr/ency/animal/img/Sheep.jpg',
          ),
        ),
      ]),
    );
  }

  Widget _postList() {
    return Column(
      children: [
        ...List.generate(50, (index) => PostWidget()).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*TODO appbar 수정*/
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: ImageData(
              IconsPath.directMessage,
              width: 50,
            ),
          )
        ],
      ),
      body: ListView(children: [
        _storyBoardList(),
        _postList(),
      ]),
    );
  }
}
