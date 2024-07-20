import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer? _currentPlayer; // to keep track of the current player

void main() {
  runApp(const MusicWidget());
}

Flexible myButton(int musicNumber, String musicName) {
  Color buttonColor;
  if (musicNumber % 2 == 0) {
    buttonColor = Colors.purple;
  } else {
    buttonColor = Color.fromARGB(255, 103, 50, 112);
  }
  return Flexible(
    child: ElevatedButton(
      onPressed: () {
        playMusic(musicNumber);
      },
      child: Row(
        children: [
          Icon(
            Icons.music_note,
            color: buttonColor,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            musicName,
            style: TextStyle(fontSize: 30, color: buttonColor),
          ),
        ],
      ),
    ),
  );
}

void playMusic(int musicNumber) async {
  // Pause the current player if it exists
  if (_currentPlayer != null) {
    await _currentPlayer!.pause(); // Pause the current song
    _currentPlayer?.dispose(); // Dispose of the current player
  }

  // Create a new player
  _currentPlayer = AudioPlayer();

  try {
    await _currentPlayer!.setSource(AssetSource('song$musicNumber.mp3'));
    _currentPlayer!.resume(); // Start playing the new song
  } catch (e) {
    print("Error playing audio: $e"); // Error handling
  }
}

class MusicWidget extends StatelessWidget {
  const MusicWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[300],
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('My music'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              myButton(1, 'Ana Khaty Athem'),
              myButton(2, 'Here as in heaven'),
              myButton(3, 'Oceans'),
              myButton(4, 'I surrender'),
              myButton(5, 'Way maker'),
              myButton(6, 'Goodness of God'),
              myButton(7, 'King of kings'),
              myButton(8, 'What a beautiful name'),
            ],
          ),
        ),
      ),
    );
  }
}
