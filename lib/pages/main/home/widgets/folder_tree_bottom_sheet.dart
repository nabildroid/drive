import 'package:drive/models/main.dart';
import 'package:flutter/material.dart';

class FolderTreeBottomSheet extends StatelessWidget {
  final List<Node> items;

  const FolderTreeBottomSheet(
    this.items, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: .5,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 3,
              color: Colors.black87,
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: items.length,
                itemBuilder: (ctx, i) => ListTile(
                  dense: true,
                  leading: items[i] is Folder
                      ? Icon(Icons.folder)
                      : Icon(Icons.image),
                  title: Text(
                    items[i].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[i].users.isEmpty ? Icons.lock : Icons.person,
                        size: 12,
                        color: Colors.black45,
                      ),
                      Text(
                        items[i].history[0].lastEdit.toString(),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
