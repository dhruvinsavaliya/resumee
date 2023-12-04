// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Capture and Share Image'),
//         ),
//         body: ImageCaptureScreen(),
//       ),
//     );
//   }
// }
//
// class ImageCaptureScreen extends StatefulWidget {
//   @override
//   _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
// }
//
// class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
//   GlobalKey globalKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           RepaintBoundary(
//             key: globalKey,
//             child: Container(
//               color: Colors.yellow,
//               width: 200,
//               height: 200,
//               child: Center(
//                 child: Text(
//                   'Capture Me!',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               saveImage();
//             },
//             child: Text('Save Image'),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               shareImage();
//             },
//             child: Text('Share Image'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> saveImage() async {
//     Uint8List? imageBytes = await captureWidget();
//     if (imageBytes != null) {
//       String directory = (await getApplicationDocumentsDirectory()).path;
//       String filePath = '$directory/captured_image.png';
//
//       // Save the image to the device
//       await File(filePath).writeAsBytes(imageBytes);
//
//       // Show a confirmation dialog
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Image Saved'),
//           content: Text('The image has been saved to $filePath.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   Future<void> shareImage() async {
//     Uint8List? imageBytes = await captureWidget();
//     if (imageBytes != null) {
//       // Save the image to a temporary file
//       String directory = (await getTemporaryDirectory()).path;
//       String tempFilePath = '$directory/captured_image_temp.png';
//       await File(tempFilePath).writeAsBytes(imageBytes);
//
//       // Share the image using share_plus
//       await Share.shareFiles([tempFilePath], text: 'Check out this captured image!');
//     }
//   }
//
//   Future<Uint8List?> captureWidget() async {
//     try {
//       RenderRepaintBoundary boundary =
//       globalKey.currentContext!.findRenderObject() as
//       RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();
//       return pngBytes;
//     } catch (e) {
//       print("Error capturing widget: $e");
//       return null;
//     }
//   }
// }
