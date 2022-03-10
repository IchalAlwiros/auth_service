import 'package:final_project_bootcampflutter/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../services/theme_provider/theme_provider.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      child: Column(
        children: [
          ListTile(
              leading: Icon(themeProvider.darkTheme
                  ? Icons.mode_night
                  : Icons.light_mode),
              title: Text(
                themeProvider.darkTheme ? 'Dark Mode' : 'Light Mode',
                style: titleStyle,
              ),
              trailing: Consumer<ThemeProvider>(
                builder: (context, value, child) {
                  return Switch.adaptive(
                    activeColor: Colors.black,
                    value: value.darkTheme,
                    onChanged: (newValue) {
                      value.toggleTheme();
                    },
                  );
                },
              ))
          // Row(
          //   children: [
          //     Icon(themeProvider.darkTheme
          //         ? Icons.mode_night
          //         : Icons.light_mode),
          //     SizedBox(width: 15),
          //     Text(
          //       themeProvider.darkTheme ? 'Dark Mode' : 'Light Mode',
          //       style: titleStyle,
          //     ),
          //     Spacer(),
          //     Consumer<ThemeProvider>(
          //       builder: (context, value, child) {
          //         return Switch.adaptive(
          //           activeColor: Colors.black,
          //           value: value.darkTheme,
          //           onChanged: (newValue) {
          //             value.toggleTheme();
          //           },
          //         );
          //       },
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
