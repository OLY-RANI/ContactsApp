
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final List<String> _names = [];
  final List<String> _numbers = [];

  void _addItemsToList() {
    setState(() {
      String nameInput = _nameTEController.text;
      String numberInput = _numberTEController.text;
      if (nameInput.isNotEmpty) {
        _names.add('$nameInput');
        _numbers.add('$numberInput');
      }
      _nameTEController.clear();
      _numberTEController.clear();
    });
  }

  void _deleteItem (int index){
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure for delete?'),
          actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel_presentation)),
          IconButton(
              onPressed: () {
                setState(() {
                  _names.removeAt(index);
                  _numbers.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete_outline_sharp)),
          ],
        ),);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contact List')),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _nameTEController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 8,),
            TextFormField(
              controller: _numberTEController,
              decoration: const InputDecoration(
                labelText: 'Number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItemsToList,
              child: const Text('Add to List'),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return contactsItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card contactsItem(int index) {
    return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.person,color: Colors.brown),
                    title: Text(_names[index],style: TextStyle(color: Colors.red),),
                    subtitle: Text(_numbers[index]),
                    trailing: const Icon(Icons.phone,color: Colors.blue),
                    onLongPress: () {_deleteItem(index);
                    },
                  ),
                );
  }
}



