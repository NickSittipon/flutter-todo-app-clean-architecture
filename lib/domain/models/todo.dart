/*
TO Do Model

this is what a todo object is

---------------------------------

It has these properties:

-id
-text
isCompleted

-----------------------------------

Methods:
 - toggle completion on & off
*/

class Todo{
  final String id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted =false, //initally ,todo is considered not completed
  });

  Todo toggleCompletion(){
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted, //toggle the completion status
    );
  }

}

