import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Testing')
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Text('Weather API'),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.cloud),
                  ),
            ],
        ),
      ),
    );
  }
}
