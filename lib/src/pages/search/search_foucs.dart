import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/image_data.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabBarController;

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabmenu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffe4e4e4),
            ),
          ),
        ),
        child: TabBar(
          controller: tabBarController,
          indicatorColor: Colors.black,
          tabs: [
            _tabMenuOne('인기'),
            _tabMenuOne('계정'),
            _tabMenuOne('오디오'),
            _tabMenuOne('태그'),
            _tabMenuOne('장소'),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      leading: GestureDetector(
        /*TODO back btn 처리*/
        onTap: Get.back,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageData(IconsPath.backBtnIcon),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xffefefef),
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '검색',
            contentPadding: EdgeInsets.only(left: 15, top: 10, bottom: 7),
            isDense: true,
          ),
        ),
      ),
      bottom: _tabmenu(),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: tabBarController,
      children: const [
        Center(
          child: Text('인기페이지'),
        ),
        Center(
          child: Text('계정페이지'),
        ),
        Center(
          child: Text('오디오페이지'),
        ),
        Center(
          child: Text('태그페이지'),
        ),
        Center(
          child: Text('장소페이지'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }
}
