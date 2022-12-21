import 'package:flutter/material.dart';

import 'databaseHelper.dart';
import 'model.dart';


class FormPage extends StatelessWidget {
  final Note? note;
  const FormPage({
    Key? key,
    this.note
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final name = TextEditingController();

    if(note != null){
      name.text = note!.name;
      title.text = note!.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text( note == null
            ? 'Add a note'
            : 'Edit note'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: name,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'e.x John ',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )
                    )
                ),
              ),
            ),
            TextFormField(
              controller: title,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'e.x PPG',
                  labelText: 'Title',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )
                  )
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final name1 = name.value.text;
                      final title1 = title.value.text;

                      if (name1.isEmpty || title1.isEmpty) {
                        return;
                      }

                      final Note model = Note(name: name1, title: title1, id: note?.id);
                      if(note == null){
                        await DatabaseHelper.addNote(model);
                      }else{
                        await DatabaseHelper.updateNote(model);
                      }

                      Navigator.pop(context);
                    },
                    child: Text( note == null
                        ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
