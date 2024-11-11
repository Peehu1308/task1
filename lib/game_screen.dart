import 'dart:math';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _playerChoice = '';
  String _computerChoice = '';
  String _result = '';

  
  final List<String> _choices = ['Rock', 'Paper', 'Scissors'];

  
  void _makeComputerChoice() {
    final random = Random();
    _computerChoice = _choices[random.nextInt(_choices.length)];
  }

  //result
  void _determineResult() {
    if (_playerChoice == _computerChoice) {
      _result = "It's a draw!";
    } else if ((_playerChoice == 'Rock' && _computerChoice == 'Scissors') ||
               (_playerChoice == 'Paper' && _computerChoice == 'Rock') ||
               (_playerChoice == 'Scissors' && _computerChoice == 'Paper')) {
      _result = 'You win!';
    } else {
      _result = 'You lose!';
    }
  }

  //player selection
  void _onPlayerChoice(String choice) {
    setState(() {
      _playerChoice = choice;
      _makeComputerChoice();
      _determineResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your move:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            //for Rock, Paper, Scissors buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rock button
                Flexible(
                  child: InkWell(
                    onTap: () => _onPlayerChoice('Rock'),
                    child: Image.asset(
                      'images/rock_btn.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Paper 
                Flexible(
                  child: InkWell(
                    onTap: () => _onPlayerChoice('Paper'),
                    child: Image.asset(
                      'images/paper_btn.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                //scissor
                Flexible(
                  child: InkWell(
                    onTap: () => _onPlayerChoice('Scissors'),
                    child: Image.asset(
                      'images/scisor_btn.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            
            if (_playerChoice.isNotEmpty) ...[
              Text(
                'Your choice: $_playerChoice',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                'Computer\'s choice: $_computerChoice',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                _result,
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
            ],

            // Retry Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _playerChoice = '';
                  _computerChoice = '';
                  _result = '';
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Retry",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
