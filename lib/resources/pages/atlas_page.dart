import 'package:flutter/material.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class AtlasPage extends StatefulWidget {
  
  AtlasPage({Key? key}) : super(key: key);
  
  @override
  _AtlasPageState createState() => _AtlasPageState();
}

class _AtlasPageState extends NyState<AtlasPage> {

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
