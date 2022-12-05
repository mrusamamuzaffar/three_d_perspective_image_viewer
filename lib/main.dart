import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three_d_perspective_image_viewer/perspective_pageview.dart';

import 'options_bottom_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Perspective Image Viewer',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Cover',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Nature forever',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              const Text(
                'Display this title on the cover',
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Expanded(
            child: PerspectivePageView(
              children: <Widget>[
                for(int i = 1; i <= 19; i++)
                  Center(
                    child: Image(
                      fit: BoxFit.fitWidth,
                      height: 200,
                      width: 200,
                      image: AssetImage('assets/$i.jpg'),
                    ),
                  ),
              ],
            ),
          ),
          const OptionsBottomBar(),
        ],
      ),
    );
  }
}