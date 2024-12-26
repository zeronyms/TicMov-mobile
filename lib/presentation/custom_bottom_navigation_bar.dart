import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        enableFeedback: false,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 33),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, size: 33),
            label: 'Cinemas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num, size: 33),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 33),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.black,
        onTap: onTap,
      ),
    );
  }
}
