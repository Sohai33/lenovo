

/*import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.red.shade900,
        title: Center( child: Text('Feedback',style: TextStyle(
          color: Colors.white
        ),),
      ),),
      body: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _feedbackController,
            decoration: InputDecoration(labelText: 'Feedback'),
            maxLines: 3,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle feedback submission here
              submitFeedback(_feedbackController.text);
            },
            child: Text('Submit Feedback'),
          ),
        ],
      ),
    );
  }

  void submitFeedback(String feedback) {
    // Add your logic for submitting feedback here
    print('Feedback submitted: $feedback');
    // You can send feedback to a server, store it locally, etc.

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Feedback Submitted'),
            content: Text('Thank you for your feedback!'),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }
}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:lenovarustisia/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Center(child: Text('Feedback form',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),

      )),
      body: Center(
        child: ElevatedButton(
          child: const Text('send Feedback',style: TextStyle(color: Colors.red,),),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const FeedbackDialog());
          },
        ),
      ),
    );
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () async {
            // Only if the input form is valid (the user has entered text)
            if (_formKey.currentState!.validate()) {
              // We will use this var to show the result
              // of this operation to the user
              String message;

              try {
                // Get a reference to the `feedback` collection
                final collection =
                FirebaseFirestore.instance.collection('feedback');

                // Write the server's timestamp and the user's feedback
                await collection.doc().set({
                  'timestamp': FieldValue.serverTimestamp(),
                  'feedback': _controller.text,
                });

                message = 'Feedback sent successfully';
              } catch (e) {
                message = 'Error when sending feedback';
              }

              // Show a snackbar with the result
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
