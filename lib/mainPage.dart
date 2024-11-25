import 'package:flutter/material.dart';
import 'package:my_first_app/homi.dart';
import 'package:my_first_app/page2.dart';
import 'package:my_first_app/page1.dart';
import 'package:my_first_app/page3.dart';

import 'main.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<IconData> _icons = [
    Icons.home,
    Icons.person,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        drawer: Drawer(

          backgroundColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [

              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bilal Kanber',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'bilal8flutter@gmail.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: Icon(Icons.home,color: Colors.pink,),
                title: Text('Home',style: TextStyle(color: Colors.pink),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Page1();
                  }));

                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.pink,),
                title: Text('Settings',style: TextStyle(color: Colors.pink),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Page2();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,color: Colors.pink),
                title: Text('Logout',style: TextStyle(color: Colors.pink),),
                onTap: () {
                  Navigator.pop(context);

                },
              ),
            ],
          ),
        ),

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color(0xff141414),
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('vista',style: TextStyle(fontFamily:'Caveat' ,color: Colors.white),),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF58529),
                        Color(0xFFDD2A7B),
                        Color(0xFF8134AF),
                        Color(0xFF515BD4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              pinned: true,
              floating: true,
            ),
            SliverFillRemaining(
              child: Stack(
                children: [

                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: [
                      Page1(),
                      page3(),
                      Page2(),
                    ],
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Color(0xff141414),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(_icons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              _pageController.jumpToPage(index);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _icons[index],
                                  color: _currentIndex == index
                                      ? Colors.pink
                                      : Colors.white,
                                ),
                                if (_currentIndex == index)
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    height: 3,
                                    width: 16,
                                    color: Colors.pink,
                                  ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
