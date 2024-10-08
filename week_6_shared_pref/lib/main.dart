import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // step 1: create variables
  String? _selectedLanguage;
  final List<String> _languages = ['English', 'French'];

  // step 4: initialize preferred language
  void initState() {
    super.initState();

    _loadLanguagePreference();
  }

  // step 2: create 2 functions: save and load language preference
  // save method
  void _saveLanguagePreference(String language) async {
    // create instance of shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();

  // key always needs to be string; key-value pair
    await prefs.setString('preferred_language', language);

    setState(() {
      _selectedLanguage = language;
    });
  }

  // load method
  void _loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _selectedLanguage = prefs.getString('preferred_language') ?? _languages[0];
    });
  }


// step 3 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Preference DEMO')
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Preferred Language',
            style: TextStyle(fontSize: 16)
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: _languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language)
                );
              }).toList(),
              onChanged: (String? newLanguage) {
                if(newLanguage != null) {
                  // if there is selection, save a new preference
                  _saveLanguagePreference(newLanguage);
                }
              }
            ),
            SizedBox(height: 10),
            _selectedLanguage != null ? _getLocalizedText(_selectedLanguage!) : Text('No language selected')

          ],
        ),
      ),
    );
  }

  Widget _getLocalizedText(String language) {
    String text = language == 'English' ? 'Hello! Welcome to our app!' : 'Bonjour! Bienvenue dans notre application!';

    return Text(
      text,
      style: TextStyle(fontSize: 18)
    );
  }

}
