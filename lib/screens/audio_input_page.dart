import 'package:flutter/material.dart';
import 'dart:math';

class AudioInputPage extends StatefulWidget {
  const AudioInputPage({super.key});

  @override
  _AudioInputPageState createState() => _AudioInputPageState();
}

class _AudioInputPageState extends State<AudioInputPage> {
  final List<String> _audioOptions = [
    "Audio 1",
    "Audio 2",
    "Audio 3",
    "Audio 4",
    "Audio 5"
  ];

  // Function to generate a random English sentence
  String generateRandomSentence() {
    // Example sentences (you can replace with your own logic or a library like faker)
    List<String> sentences = [
      "He strives to keep the best lawn in the neighborhood.",
      "The light that burns twice as bright burns half as long.",
      "Her scream silenced the rowdy teenagers.",
      "The tears of a clown make my lipstick run, but my shower cap is still intact.",
      "The blue parrot drove by the hitchhiking mongoose.",
      "I liked their first two albums but changed my mind after that charity gig.",
      "Everybody should read Chaucer to improve their everyday vocabulary.",
      "Kevin embraced his ability to be at the wrong place at the wrong time.",
      "Iguanas were falling out of the trees.",
      "She lived on Monkey Jungle Road and that seemed to explain all of her strangeness.",
      "Various sea birds are elegant, but nothing is as elegant as a gliding pelican.",
      "Poison ivy grew through the fence they said was impenetrable.",
      "There are no heroes in a punk rock band.",
      "Fluffy pink unicorns are a popular status symbol among macho men.",
      "The group quickly understood that toxic waste was the most effective barrier to use against the zombies.",
      "They wandered into a strange Tiki bar on the edge of the small beach town.",
      "Iron pyrite is the most foolish of all minerals.",
      "I often see the time 11:11 or 12:34 on clocks.",
      "It's a skateboarding penguin with a sunhat!",
      "When I cook spaghetti, I like to boil it a few minutes past al dente so the noodles are super slippery.",
      "He didn't understand why the bird wanted to ride the bicycle.",
      "I currently have 4 windows open up… and I don’t know why.",
      "His thought process was on so many levels that he gave himself a phobia of heights.",
      "They were excited to see their first sloth.",
      "Today I dressed my unicorn in preparation for the race.",
      "For the 216th time, he said he would quit drinking soda after this last Coke.",
      "I've never seen a more beautiful brandy glass filled with wine.",
      "I think I will buy the red car, or I will lease the blue one.",
      "He ran out of money, so he had to stop playing poker.",
      "He fumbled in the darkness looking for the light switch, but when he finally found it there was someone already there.",
      "Let me help you with your baggage.",
      "Cats are good pets, for they are clean and are not noisy.",
      "Dan took the deep dive down the rabbit hole.",
      "It was difficult for Mary to admit that most of her workout consisted of exercising poor judgment.",
      "Dolores wouldn't have eaten the meal if she had known what it actually was.",
      "That was how he came to win 1 million.",
      "Not all people who wander are lost.",
      "The irony of the situation wasn't lost on anyone in the room.",
      "If eating three-egg omelets causes weight-gain, budgie eggs are a good substitute.",
      "She thought there'd be sufficient time if she hid her watch.",
      "The hand sanitizer was actually clear glue.",
      "Martha came to the conclusion that shake weights are a great gift for any occasion.",
      "He watched the dancing piglets with panda bear tummies in the swimming pool.",
      "I always dreamed about being stranded on a desert island until it actually happened.",
      "I made myself a peanut butter sandwich as I didn't want to subsist on veggie crackers.",
      "The wake behind the boat told of the past while the open sea for told life in the unknown future.",
      "The view from the lighthouse excited even the most seasoned traveler.",
      "The fence was confused about whether it was supposed to keep things in or keep things out.",
      "She tilted her head back and let whip cream stream into her mouth while taking a bath.",
      "I am counting my calories, yet I really want dessert.",
    ];

    // Generate a random index
    int randomIndex = Random().nextInt(sentences.length);

    // Return the random sentence
    return sentences[randomIndex];
  }

  void _navigateToAudioInput(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AudioRecordingPage(randomSentence: generateRandomSentence()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _audioOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_audioOptions[index]),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => _navigateToAudioInput(index),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true); // Go back to signup page
              },
              child: const Text('Back to Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioRecordingPage extends StatelessWidget {
  final String randomSentence;

  const AudioRecordingPage({super.key, required this.randomSentence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Recording'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please read the following sentence aloud:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              randomSentence,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.mic),
              label: const Text('Record'),
              onPressed: () {
                // Implement recording logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Recording audio...'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to audio input page
              },
              child: const Text('Back to Audio Input'),
            ),
          ],
        ),
      ),
    );
  }
}
