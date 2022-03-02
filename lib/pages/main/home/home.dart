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
