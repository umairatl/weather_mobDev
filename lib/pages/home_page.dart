import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//add controller for input field //to check for empty field
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _isCityNameEmpty = _controller.text.isEmpty;
      });
      // print('###' + _controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weaather API')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Please enter city name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: Text('City Name'),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: _isCityNameEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherDetail(
                            cityName: _controller.text,
                          ),
                        ),
                      );
                    },
              child: const Text('Search'))
        ],
      )),
    );
  }
}
