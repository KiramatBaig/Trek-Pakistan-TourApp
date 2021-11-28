// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class paymentnew extends StatefulWidget {
//   @override
//   _paymentnewState createState() => _paymentnewState();
// }
//
// class _paymentnewState extends State<paymentnew> {
//   final _paymentItems = [
//     PaymentItem(
//       label: 'Total',
//       amount: '99.99',
//       status: PaymentItemStatus.final_price,
//     )
//   ];
//   void onGooglePayResult(paymentResult) {
//     debugPrint(paymentResult.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DSC Tutorial',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('DSC Tutorial'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Hello World'),
//               GooglePayButton(
//                 width: 300,
//                 paymentConfigurationAsset: 'gpay.json',
//                 paymentItems: _paymentItems,
//                 style: GooglePayButtonStyle.black,
//                 type: GooglePayButtonType.pay,
//                 margin: const EdgeInsets.only(top: 15.0),
//                 onPaymentResult: onGooglePayResult,
//                 loadingIndicator: const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }