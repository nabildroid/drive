import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/models/main.dart';
import 'package:drive/pages/main/files/files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custom_appbar.dart';
import 'widgets/folder_tree_bottom_sheet.dart';
import 'widgets/recent_files.dart';
import 'widgets/synced_folders.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = BlocProvider.of<AppCubit>(context).state;
    final profile = appState.profile!;
    final recentFiles = appState.recentFiles;
    final rootFolder = appState.rootFolder;
    final syncedFolders = appState.syncedFoldes;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  imageUrl: profile.avatar,
                  size: profile.size,
                ),
                SectionLabel("RECENT", 12, 8),
                RecentFiles(recentFiles),
                SectionLabel("SYNCED FOLDERS", 24, 8),
                SyncedFolders(syncedFolders),
              ],
            ),
            if (rootFolder == null) Center(child: CircularProgressIndicator()),
            if (rootFolder != null)
              FolderTreeBottomSheet(
                rootFolder,
                expandable: true,
                onExpanded: () => FilePage.route(context, rootFolder),
                onClick: (item) {
                  if (item is Folder) {
                    FilePage.route(context, item);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String label;
  final double top;
  final double bottom;
  const SectionLabel(
    this.label,
    this.top,
    this.bottom, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, top: top, bottom: bottom),
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
