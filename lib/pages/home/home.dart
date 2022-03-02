import 'package:flutter/material.dart';

import 'widgets/custom_appbar.dart';
import 'widgets/folder_tree_bottom_sheet.dart';
import 'widgets/recent_files.dart';
import 'widgets/synced_folders.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 12),
                SectionLabel("RECENT"),
                SizedBox(height: 8),
                RecentFiles(),
                SizedBox(height: 24),
                SectionLabel("SYNCED FOLDERS"),
                SizedBox(height: 8),
                SyncedFolders(),
              ],
            ),
            FolderTreeBottomSheet(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        width: MediaQuery.of(context).size.width - 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home),
            Icon(Icons.home),
            Icon(Icons.home),
            Icon(Icons.home),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel(
    this.label, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        this.label,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
