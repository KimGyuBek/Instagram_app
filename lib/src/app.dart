import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/image_data.dart';
import 'package:flutter_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_instagram/src/pages/active_history.dart';
import 'package:flutter_instagram/src/pages/home.dart';
import 'package:flutter_instagram/src/pages/mypage.dart';
import 'package:flutter_instagram/src/pages/search.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
              () =>
              Scaffold(
                // appBar: AppBar(
                //   elevation: 0,
                // ),
                body: IndexedStack(
                  index: controller.pageIndex.value,
                  children: [
                    const Home(),
                    Navigator(
                      key: controller.searchPageNavigationKey,
                      onGenerateRoute: (routeSetting) {
                        return MaterialPageRoute(
                          builder: (context) => const Search(),
                        );
                      },
                    ),
                    // const Search(),
                    // Container(child: Center(child: Text('HOME'))),
                    // Container(child: Center(child: Text('SEARCH'))),
                    // Container(child: Center(child: Text('UPLOAD'))),
                    Container(),
                    // Container(child: Center(child: Text('ACTIVITY'))),
                    const ActiveHistory(),
                    // Container(child: Center(child: Text('MYPAGE'))),
                    const MyPage(),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: controller.pageIndex.value,
                  onTap: controller.changeBottomNav,
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.homeOff),
                      activeIcon: ImageData(IconsPath.homeOn),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.searchOff),
                      activeIcon: ImageData(IconsPath.searchOn),
                      label: 'search',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.uploadIcon),
                      label: 'upload',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.activeOff),
                      activeIcon: ImageData(IconsPath.activeOn),
                      label: 'active',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      label: 'avatar',
                    ),
                  ],
                ),
              ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
