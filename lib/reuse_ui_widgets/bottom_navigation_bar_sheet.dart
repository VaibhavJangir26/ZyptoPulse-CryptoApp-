import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zyptopulse/providers/index.dart';
import '../screens/pages/index.dart';

class BottomNavigationBarSheet extends StatelessWidget {
  BottomNavigationBarSheet({super.key});
  final List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<BottomNavigationProvider>(
            builder: (context,value,_) {
              return screens[value.currentIndex];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Consumer<BottomNavigationProvider>(
                  builder: (context, value, _) {
                    return BottomNavigationBar(
                      currentIndex: value.currentIndex,
                      onTap: value.updateIndex,
                      selectedItemColor: const Color(0xff5ED5A8),
                      unselectedItemColor: Colors.grey,
                      elevation: 5,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          activeIcon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.favorite_border),
                          activeIcon: Icon(Icons.favorite),
                          label: 'Favorites',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.settings_outlined),
                          activeIcon: Icon(Icons.settings),
                          label: 'Settings',
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
