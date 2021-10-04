// return ListView.builder(
// padding: EdgeInsets.zero,
// scrollDirection: Axis.vertical,
// itemCount: 10,
// itemBuilder: (context, index) {
//
// return Container(
// height: 90,
// decoration: BoxDecoration(
// color: Colors.transparent,
// ),
// child: FutureBuilder<dynamic>(
//
// builder: (context, index) {
// // Customize what your widget looks like when it's loading.
// if (!snapshot.hasData) {
// return Center(
// child: SizedBox(
// width: 50,
// height: 50,
// child: CircularProgressIndicator(
// color: Colors.green,
// ),
// ),
// );
// }
//
// return InkWell(
// onTap: () async {
//
// },
// child: Container(
// height: 90,
// decoration: BoxDecoration(
// color: Colors.transparent,
// ),
// child: InkWell(
// onTap: () async {
// // await Navigator.push(
// //   context,
// //   MaterialPageRoute(
// //     builder: (context) =>
// //         ArtPiecePageWidget(
// //           artPiece:
// //           containerGetArtPieceResponse,
// //         ),
// //   ),
// // );
// },
// child: Card(
// clipBehavior: Clip.antiAliasWithSaveLayer,
// color: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// ),
// child: Padding(
// padding: EdgeInsetsDirectional.fromSTEB(
// 10, 5, 10, 5),
// child: Row(
// mainAxisSize: MainAxisSize.max,
// children: [
// Image.network(
// hotel.image,
// width: 56,
// height: double.infinity,
// fit: BoxFit.cover,
// ),
// Expanded(
// child: Padding(
// padding: EdgeInsetsDirectional
//     .fromSTEB(12, 0, 0, 0),
// child: SingleChildScrollView(
// child: Column(
// mainAxisSize:
// MainAxisSize.max,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "${hotel.title}",
// style: TextStyle(
// fontFamily:
// 'Playfair Display',
// fontSize: 16,
// fontWeight:
// FontWeight.bold,
// ),
// ),
// Padding(
// padding:
// EdgeInsetsDirectional
//     .fromSTEB(
// 0, 3, 0, 6),
// child: Row(
// mainAxisSize:
// MainAxisSize.max,
// children: [
// Padding(
// padding:
// EdgeInsetsDirectional
//     .fromSTEB(
// 0,
// 0,
// 6,
// 0),
// child: Text(
// "${hotel.title}",
// style: TextStyle(
// fontFamily:
// 'Playfair Display',
// color: Colors.grey,
// fontSize: 14,
// fontWeight:
// FontWeight
//     .normal,
// ),
// ),
// ),
// Expanded(
// child:
// AutoSizeText(
// "${hotel.title}",
// style: TextStyle(
// fontFamily:
// 'Playfair Display',
// color: Colors.grey,
// fontSize: 14,
// fontWeight:
// FontWeight
//     .normal,
// ),
// ),
// )
// ],
// ),
// ),
// Text(
// "${hotel.title}",
// style: TextStyle(
// fontFamily:
// 'Playfair Display',
// color:
// Colors.green,
// fontSize: 14,
// fontWeight:
// FontWeight.bold,
// ),
// )
// ],
// ),
// ),
// ),
// ),
// Icon(
// Icons.arrow_forward_ios,
// color: Colors.grey,
// size: 24,
// )
// ],
// ),
// ),
// ),
// ),
// ),
// );
// },
// ),
// );
// },
// );