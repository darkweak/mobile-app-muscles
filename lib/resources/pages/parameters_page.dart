import 'package:flutter/material.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class ParametersPage extends StatefulWidget {
  
  ParametersPage({Key? key}) : super(key: key);
  
  @override
  _ParametersPageState createState() => _ParametersPageState();
}

class _ParametersPageState extends NyState<ParametersPage> {

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
