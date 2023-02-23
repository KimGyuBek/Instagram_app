import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/avatar_widget.dart';
import 'package:flutter_instagram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type: AvatarType.TYPE3,
            thumbPath: 'http://kcm.co.kr/ency/animal/img/Sheep.jpg',
            nickname: 'User1',
            size: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl: 'https://i.ytimg.com/vi/WMlFvy2sI5s/maxresdefault.jpg');
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 55,
          ),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 150개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            // '-25도 폭설속에 갇혔습니다...',
            '-25도 폭설속에 갇혔습니다...\nadadfadfasfasfdf\nadsfadfasdfadfasdfa\nasdfasdfadfa\n',
            prefixText: 'User1',
            onPrefixTap: () {
              print('User1 page move');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 2,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          '댓글 231개 모두 보기', style: TextStyle(color: Colors.grey, fontSize: 13),),
      ),
    );
  }

  Widget _dateAgo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text('1일전', style: TextStyle(color: Colors.grey, fontSize: 11),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          SizedBox(
            height: 15,
          ),
          _image(),
          SizedBox(
            height: 15,
          ),
          _infoCount(),
          SizedBox(
            height: 5,
          ),
          _infoDescription(),
          SizedBox(
            height: 5,
          ),
          _replyTextBtn(),
          SizedBox(
            height: 5,
          ),
          _dateAgo(),
        ],
      ),
    );
  }
}
