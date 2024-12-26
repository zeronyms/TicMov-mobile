import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: Row(
        children: [
          Text(
            "TicMov",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari Film",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.notifications_outlined),
          onPressed: () {
            print("Notification clicked!");
          },
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 32, 42, 68),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
