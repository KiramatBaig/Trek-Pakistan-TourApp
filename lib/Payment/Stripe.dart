// Map<String, dynamic>? paymentIntentData;
//
//
// Future<void> makePayment() async {
//   try {
//     paymentIntentData = await createPaymentIntent(
//         final_total.toString(), 'PKR'); //json.decode(response.body);
//     // print('Response body==>${response.body.toString()}');
//     await stripe.Stripe.instance
//         .initPaymentSheet(
//         paymentSheetParameters: stripe.SetupPaymentSheetParameters(
//             paymentIntentClientSecret:
//             paymentIntentData!['client_secret'],
//             applePay: true,
//             googlePay: true,
//             testEnv: true,
//             style: ThemeMode.dark,
//             merchantCountryCode: 'PAK',
//             merchantDisplayName: 'ahsan'))
//         .then((value) {});
//
//     ///now finally display payment sheeet
//
//     displayPaymentSheet();
//   } catch (e, s) {
//     print('exception:$e$s');
//   }
// }
//
//
// displayPaymentSheet() async {
//   setState(() {
//     isloading = false;
//   });
//   try {
//     await stripe.Stripe.instance
//         .presentPaymentSheet(
//         parameters: stripe.PresentPaymentSheetParameters(
//           clientSecret: paymentIntentData!['client_secret'],
//           confirmPayment: true,
//         ))
//         .then((newValue) {
//       print('payment intent' + paymentIntentData!['id'].toString());
//       print(
//           'payment intent' + paymentIntentData!['client_secret'].toString());
//       print('payment intent' + paymentIntentData!['amount'].toString());
//       print('payment intent' + paymentIntentData.toString());
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("paid successfully"),
//         backgroundColor: Colors.green,
//       ));
//       Place_Order new_order = Place_Order(
//         products: get_products,
//         total_price: final_total,
//         date_time: DateTime.now().toString(),
//         userid: user_id,
//         customer_name: username,
//       );
//       Provider.of<Place_Order>(context, listen: false)
//           .PostOrder(new_order)
//           .then((value) {
//         get_products = [];
//         Navigator.of(context)
//             .pushReplacementNamed(Home.routename);
//       });
//
//
//       paymentIntentData = null;
//     }).onError((error, stackTrace) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//     });
//   } on stripe.StripeException catch (e) {
//     print('Exception/DISPLAYPAYMENTSHEET==> $e');
//     showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           content: Text("Cancelled "),
//         ));
//   } catch (e) {
//     print('$e');
//   }
// }
//
// //  Future<Map<String, dynamic>>
// createPaymentIntent(String amount, String currency) async {
//   try {
//     Map<String, dynamic> body = {
//       'amount': calculateAmount(final_total),
//       'currency': currency,
//       'payment_method_types[]': 'card'
//     };
//     print(body);
//     var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: body,
//         headers: {
//           'Authorization':
//           'Bearer sk_test_51K3kRIGQIhTexnwITy2l1tXZbzqrEnwEdivPum5yDxSBpKV2Q5ztEnBbic9290P8zipuCxjLOReuV5nVlEFHsKEv00SKAGbCKP',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         });
//     print('Create Intent reponse ===> ${response.body.toString()}');
//     return jsonDecode(response.body);
//   } catch (err) {
//     print('err charging user: ${err.toString()}');
//   }
// }
//
// calculateAmount(double amount) {
//   final a = amount.toInt() * 100;
//   return a.toString();
// }