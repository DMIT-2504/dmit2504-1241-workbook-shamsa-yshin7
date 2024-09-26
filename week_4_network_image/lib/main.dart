import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Image',
      home: ImageScreen() // stateful widget passed here
    );
  }
}


//Stateful widget to track state of network image

class ImageScreen extends StatefulWidget{

  // this function creates instantiates a state object
  // this state object handles the changes to the data (state)
  @override
  _ImageState createState() {
    return _ImageState();
  }
}

// State class

class _ImageState extends State<ImageScreen>{
  
  String? _imageURL; // variable to track image data
  int _likes = 0; // Like counter
  int _dislikes = 0; // Dislike counter

  //call the endpoint
  //callback to get the image
  Future<void> _fetchImage() async{
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if(response.statusCode == 200){
      final data = json.decode(response.body);

      // rebuild UI once image is received
      setState(() {
        _imageURL = data['message'];
      });
    }

  }

  // Function to handle image change and likes
  void _onTap() {
    _fetchImage().then((_) { // since the function returns void, we can use underscore here
      setState(() {
        _likes += 1;
      });
    });
  }

  void _onLongPress() {
        _fetchImage().then((_) {
      setState(() {
        _dislikes += 1;
      });
    });
  }

  void _onTwoFingerGesture() {
    _fetchImage();
  }

  @override
  void initState() {
    super.initState();
    // perform any initializations
    _fetchImage();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Image')
      ),
    
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // image displayed here
          // wrap container with gesture detector
          GestureDetector(
            onTap: _onTap,
            onLongPress: _onLongPress,
            onScaleStart: (values) { // onScaleStart expects function with args (values)
              if(values.pointerCount == 2) { // the passed values provide info on how many fingers are touching the screen, in this case we're checking for two fingers
                _onTwoFingerGesture();
              }
            },
            child: Container(
            height: 500,
            width: double.infinity, // this will take up the entire width of the screen
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: _imageURL == null ? Center(child: Text('Please try again')) 
            : Image.network(
              _imageURL!,
              fit: BoxFit.contain  // this prevents cropping
            ) 
          )
          ),
          // space between image and button
          SizedBox(
            height: 20
          ),
          LikesDislikesText(like: true, num: _likes,),
          LikesDislikesText(like: false, num: _dislikes,),
        ]
      ),
    ));
  }
}

// display likes and dislikes counters with stateless widget
class LikesDislikesText extends StatelessWidget{

  final bool like; // use this to determine which label to use
  final int num; // value for like or dislike
  
  const LikesDislikesText({this.like = true, this.num = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0
      ),
      child: Row(
        children: <Widget>[
          // label, either like or dislike
          Text(
            like ? "Likes: " : "Dislikes: ",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold
            )
          ),
          // value for like or dislike
          Text(
            '$num',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )
          )
        ]
      )
    );
  }
}