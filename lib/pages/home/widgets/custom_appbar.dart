import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://github.com/nabildroid.png"),
            radius: 16,
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: .8,
              child: SizedBox(
                height: 30,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.black12.withOpacity(.05),
                    hintText: "Search...",
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
          Chip(
            label: Text("35 GB"),
            labelStyle: TextStyle(fontSize: 12),
            backgroundColor: Colors.black38,
            padding: const EdgeInsets.all(2),
          ),
        ],
      ),
    );
  }
}
