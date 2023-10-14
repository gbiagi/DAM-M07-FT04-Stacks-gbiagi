import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget_popover.dart';
import 'widget_sidebar.dart';
import 'app_data.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

GlobalKey _settingsButtonKey = GlobalKey();

class LayoutPartCentralState extends State<LayoutPartCentral> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: appData.toggleSidebarLeft,
                child: Icon(
                  CupertinoIcons.sidebar_left,
                  color: appData.isSidebarLeftVisible
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          middle: CupertinoButton(
            key: _settingsButtonKey,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              WidgetPopover.showPopover(
                  context: context,
                  key: _settingsButtonKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            appData.setTextColor(Colors.black);
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Negre'),
                        ),
                        GestureDetector(
                          onTap: () {
                            appData.setTextColor(Colors.red);
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Vermell'),
                        ),
                        GestureDetector(
                          onTap: () {
                            appData.setTextColor(Colors.green);
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Verd'),
                        ),
                        GestureDetector(
                          onTap: () {
                            appData.setTextColor(Colors.blue);
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Blau'),
                        ),
                      ],
                    ),
                  ));
            },
            child: const Icon(
              CupertinoIcons.settings,
              color: CupertinoColors.black,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: appData.toggleSidebarRight,
                child: Icon(
                  CupertinoIcons.sidebar_right,
                  color: appData.isSidebarRightVisible
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<AppData>(
                builder: (context, appData, child) {
                  return Text(
                    "Central",
                    style: TextStyle(color: appData.textColor),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
