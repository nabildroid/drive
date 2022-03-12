import 'package:drive/models/main.dart';
import 'package:drive/models/syncing_model.dart';
import 'package:flutter/material.dart';

class SyncedFolders extends StatelessWidget {
  final List<SyncFolder> syncedFoldes;
  const SyncedFolders(
    this.syncedFoldes, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        itemBuilder: (ctx, i) => i == 0
            ? SizedBox(
                width: 120,
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("add"),
                  ),
                ))
            : Container(
                child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      syncedFoldes[i].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "${syncedFoldes[i].period.inHours}h",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Spacer(),
                          if (syncedFoldes[i].state == SyncFolderState.running)
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.pause),
                              iconSize: 16,
                              splashRadius: 16,
                            ),
                          if (syncedFoldes[i].state != SyncFolderState.running)
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.run_circle),
                              iconSize: 16,
                              splashRadius: 16,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        itemCount: syncedFoldes.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12),
      ),
    );
  }
}
