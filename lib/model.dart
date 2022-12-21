class Note{
  final int? id;
  final String name;
  final String title;


  Note({required this.id, required this.name, required this.title});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    name: json['name'],
    title: json['title']
  );

  Map<String, dynamic> toJson() =>{
    'id' :id,
    'name' :name,
    'title' :title,

  };
}