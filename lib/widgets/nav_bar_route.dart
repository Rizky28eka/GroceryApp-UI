import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groceystore/pages/home_page.dart';
import 'package:groceystore/pages/category_page.dart';
import 'package:groceystore/pages/notification_page.dart';

class NavBarRoutes extends StatefulWidget {
  const NavBarRoutes({Key? key}) : super(key: key);

  @override
  _NavBarRoutesState createState() => _NavBarRoutesState();
}

class _NavBarRoutesState extends State<NavBarRoutes>
    with TickerProviderStateMixin {
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    NotificationPage(),
  ];

  int _currentIndex = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildNavItem(dynamic icon, String label, int index) {
    final isSelected = _currentIndex == index;
    final unselectedColor = Colors.black;
    final selectedColor = const Color(0xFF7AA874);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(isSelected ? 1.1 : 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70.0,
                height: 56.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      child: icon is IconData
                          ? Icon(
                              icon,
                              color:
                                  isSelected ? selectedColor : unselectedColor,
                            )
                          : Image.asset(
                              icon,
                              color:
                                  isSelected ? selectedColor : unselectedColor,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: isSelected ? 1.0 : 0.0,
                          child: Text(
                            label,
                            style: TextStyle(
                              color:
                                  isSelected ? selectedColor : unselectedColor,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: isSelected ? 12.0 : 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomAppBar(
            child: Container(
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    Icons.home,
                    'Home',
                    0,
                  ),
                  _buildNavItem(
                    'assets/menu.png',
                    'Category',
                    1,
                  ),
                  _buildNavItem(
                    Icons.notifications,
                    'Notifications',
                    2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
