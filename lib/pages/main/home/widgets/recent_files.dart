import 'package:flutter/material.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        itemBuilder: (ctx, i) => Container(
            child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "/home/../test",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "File Name",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text(
                      "add",
                    ),
                  )
                ],
              )
            ],
          ),
        )),
        itemCount: 40,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12),
      ),
    );
  }
}
