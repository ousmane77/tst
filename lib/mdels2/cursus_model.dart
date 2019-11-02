import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;



class ListCursus{
  final List<Cursus> cursus;

  ListCursus({this.cursus});

  factory ListCursus.fromJson(List<dynamic> json) {
    List<Cursus> cursuss = List<Cursus>();
    cursuss = json.map((f) => Cursus.fromJson(f)).toList();
    return ListCursus(
      cursus: cursuss,
    );
  }

}

class Cursus{
  final String id;
  final String nom_cursus;
  final String image_cursus;
  final ListLevel level;

  Cursus({
   this.id,
   this.nom_cursus,
   this.image_cursus,
   this.level
});

  factory Cursus.fromJson(Map<String, dynamic>json) => Cursus(
    id: json["id"],
    nom_cursus: json["nom_cursus"],
    image_cursus: json["image_cursus"],
    level: ListLevel.fromJson(json["level"])
  );
}




class ListLevel{
  final List<Level> listLevel;

  ListLevel({this.listLevel});

  factory ListLevel.fromJson(List<dynamic> json) {
    List<Level> levels = List<Level>();
    levels = json.map((f)=> Level.fromJson(f)).toList();

    return ListLevel(

      listLevel:levels,
    );
  }
}


class Level{
  final String id;
  final String nom_level;
  final String image_level;
  final ListStage stage;

  Level({this.id, this.nom_level, this.image_level, this.stage});

  factory Level.fromJson(Map<String, dynamic>json) => Level(
    id: json["id"],
    nom_level: json["nom_level"],
    image_level: json["image_level"],
    stage: ListStage.fromJson(json["stage"])
  );


}

class ListStage{
  final List<Stage> listStage;
  
  ListStage({this.listStage});

  factory ListStage.fromJson(List<dynamic> json) {
    List<Stage> listStages = List<Stage>();
    listStages = json.map((f) => Stage.fromJson(f)).toList();
    return ListStage(
      listStage: listStages,
    );
  }
  
}

class Stage {
  String nomStage;
  ListCour cour;

  Stage({
    this.nomStage,
    this.cour,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
    nomStage: json["nom_stage"],
    cour: ListCour.fromJson(json["cour"])
  );


}


class ListCour{
  final List<Cour> cours;

  ListCour({this.cours});


  factory ListCour.fromJson(List<dynamic> json) {
    List<Cour> courss = List<Cour>();
    courss = json.map((f) => Cour.fromJson(f)).toList();
    return ListCour(
      cours: courss,
    );
  }
  
}

class Cour {

 final String titre;
 final ListVideo listVideo;


  Cour({
    this.titre,
    this.listVideo
  });



  factory Cour.fromJson(Map<String, dynamic> json){
    return  Cour(
        titre: json["titre"],
        listVideo:  ListVideo.fromJson(json["video"])
    );

  }


}

class ListVideo{
  final List<Video> videoList;

  ListVideo({this.videoList});

  factory ListVideo.fromJson(List<dynamic> json)
  {
    List<Video> arr = new List<Video>();
    arr = json.map((f)=> Video.fromJson(f)).toList();
    return ListVideo(
        videoList: arr
    );
  }
}


class Video{

  final String titre;
  final String lien;

  Video({ this.titre, this.lien});

  factory Video.fromJson(Map<String, dynamic> json)
  {
    return Video(

      titre: json['titre'],
      lien: json['lien'],
    );
  }
}


