import 'package:flutter/material.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class EmotionsPage extends StatefulWidget {
  
  EmotionsPage({Key? key}) : super(key: key);
  
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

class _EmotionsPageState extends NyState<EmotionsPage> {

  @override
  widgetDidLoad() async {
  
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
