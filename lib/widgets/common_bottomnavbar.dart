// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:botton_nav_bar/botton_nav_bar.dart';
// import 'package:qrscaner/pages/dashboard/main_dashboard.dart';

// class CommonBottomNavBar extends StatelessWidget {
//   const CommonBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BottomNavBar(
//         onPressFAB: () {},
//         fabChild: Text(
//           'scan',
//           style: TextStyle(color: Colors.amber),
//         ),
//         notchedRadius: 30,
//         centerNotched: true,
//         fabIcon: Icon(Icons.qr_code),
//         bottomItems: <BottomBarItem>[
//           BottomBarItem(
//             bottomItemSelectedColor: Colors.green,
//             label: 'Screen 2',
//             screen: const Center(child: Text('B')),
//             selectedIcon: Icons.search_rounded,
//           ),
//           BottomBarItem(
//             bottomItemSelectedColor: Colors.green,
//             label: 'My Login',
//             selectedIcon: Icons.man_4_rounded,
//             screen: Center(
//                 child: CircleAvatar(
//               backgroundColor: Colors.blue,
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }
