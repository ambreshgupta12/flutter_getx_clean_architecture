import 'package:flutter/cupertino.dart';

enum TabType { headline, news, profile }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.headline:
        return const Icon(CupertinoIcons.home, size: 25);
      case TabType.news:
        return const Icon(CupertinoIcons.news, size: 25);
      case TabType.profile:
        return const Icon(CupertinoIcons.person, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.headline:
        return 'HeadLine';
      case TabType.news:
        return 'News';
      case TabType.profile:
        return 'Profile';
    }
  }
}
