import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alaa'),
          
          backgroundColor: const Color.fromARGB(60, 255, 255, 255),
        ),
         body: Container(
          color: const Color.fromARGB(255, 18, 106, 142),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Alaa Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                enabled: false,   
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'ALaa Phone',
                    labelStyle: TextStyle(color: Colors.white),

                  border: OutlineInputBorder(),
                  
                ),
                enabled: false, 
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Alaa Email',
                    labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                enabled: false,   
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Alaa Address',
                    labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                enabled: false,   
              ),
              SizedBox(height: 16),
              ElevatedButton(
                
                onPressed: null,  
                
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

