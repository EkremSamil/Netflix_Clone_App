import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_clone/widgets/widgets.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey("homeScreen")),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    "Home": Icons.home,
    "Search": Icons.search,
    "Coming Soon": Icons.queue_play_next,
    "Downloads": Icons.file_download,
    "More": Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<AppBarCubit>(
          create: (_) => AppBarCubit(),
          child: _screens[_currentIndex],
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                items: _icons
                    .map((title, icon) => MapEntry(
                          title,
                          BottomNavigationBarItem(
                            label: title,
                            icon: Icon(icon, size: 30),
                          ),
                        ))
                    .values
                    .toList(),
                currentIndex: _currentIndex,
                selectedItemColor: Colors.white,
                selectedFontSize: 11.0,
                unselectedItemColor: Colors.grey,
                unselectedFontSize: 11.0,
                onTap: (index) => setState(() => _currentIndex = index),
              )
            : null);
  }
}
