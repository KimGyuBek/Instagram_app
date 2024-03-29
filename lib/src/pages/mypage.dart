import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/avatar_widget.dart';
import 'package:flutter_instagram/src/components/image_data.dart';
import 'package:flutter_instagram/src/components/user_card.dart';
import 'package:flutter_instagram/src/data/repository/member_repository.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;

  final MemberRepository memberRepository = MemberRepository();

  // late Map<String, dynamic> userInfo;
  late Map<String, dynamic> userInfo;

  // Future<Map<String, dynamic>> _callAPI() async {
  //   var url = Uri.parse(
  //     'http://localhost:8084/memberInfo/User1',
  //   );
  //
  //   var future = http.get(url);
  //
  //   var response = await future;
  //   // var responseDecode = jsonDecode(utf8.decode(response.bodyBytes));
  //
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${utf8.decode(response.bodyBytes)}');
  //
  //   print("userInfo ${jsonDecode(response.body)['userId']}");
  //
  //   return jsonDecode(response.body);
  //
  //   // print(utf8.decode(response.bodyBytes))
  //
  //   // url = Uri.parse('https://reqbin.com/sample/post/json');
  //   // responseDecode = await http.post(url, body: {
  //   //   'key': 'value',
  //   // });
  //   // print('Response status: ${responseDecode.statusCode}');
  //   // print('Response body: ${responseDecode.body}');
  // }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget _statisticOne(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: const Color(0xffdedede),
                ),
              ),
              // color: Colors.black12,
              child: const Text(
                '프로필 편집',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xffdedede),
              ),
              color: const Color(0xffefefef),
            ),
            child: ImageData(IconsPath.addFriend),
          ),
        ],
      ),
    );
  }

  Widget _discoverPeople() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '사람 찾아보기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                '모두 보기',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  10,
                  (index) => UserCard(
                        userId: 'Recommend1',
                        description: '',
                      )).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _information(Map<String, dynamic> datas) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarWidget(
                type: AvatarType.TYPE3,
                thumbPath: 'http://kcm.co.kr/ency/animal/img/Sheep.jpg',
                size: 80,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _statisticOne('게시물', 0)),
                    Expanded(child: _statisticOne('팔로워', datas['follower'])),
                    Expanded(child: _statisticOne('팔로잉', datas['following'])),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Descript',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _tabMenu() {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.black,
      indicatorWeight: 1,
      tabs: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ImageData(IconsPath.gridViewOn),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ImageData(IconsPath.myTagImageOff),
        ),
      ],
    );
  }

  Widget _tabView() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 14,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext, int index) {
          return Container(
            color: Colors.grey,
          );
        });
  }

  Widget _bodyWidget() {
    return FutureBuilder(
        future: memberRepository.findByUserId('User1'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text("Data Error"));
          }

          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _information(snapshot.data),
                  _menu(),
                  _discoverPeople(),
                  SizedBox(height: 20),
                  _tabMenu(),
                  _tabView(),
                ],
              ),
            );
          }

          return Center(
            child: Text("오류!"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'User1',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: ImageData(
                IconsPath.uploadIcon,
                width: 50,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                IconsPath.menuIcon,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: _bodyWidget(),
    );
  }
}
