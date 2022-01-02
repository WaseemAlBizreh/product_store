// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:product_store/ApI/auth_api.dart';
// import 'package:product_store/ApI/product_listview.dart';
// import 'package:provider/provider.dart';
//
// class profile extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => pro_auth(),
//       child: Consumer<pro_auth>(
//       builder: (context, value, child) {
//       child: LayoutBuilder(builder: (context, constraints) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('My Account'),
//           ),
//           body: Container(
//             child: Card(
//               child: Container(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: constraints.maxWidth * 0.4,
//                       child: Image.network(
//                           'https://www.gpdecor.nl/wp-content/uploads/2014/02/Product-300x232.jpg',
//                           //change value.productslist[index].image_path
//                           fit: BoxFit.fitWidth),
//                     ),
//                     SizedBox(
//                       width: constraints.maxWidth * 0.1,
//                     ),
//                     Container(
//                       child: ListTile(
//                         title: ,
//                         subtitle: ,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//
//       }
//       ),
//     );
//   }
// }
