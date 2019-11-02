/*
class User{

final int id;
final String nom;

User({this.id, this.nom});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      id: json["id"],
      nom: json["nom"]
    );
  }

}
*/
/*

class Commande{

  final String produit;
  final String user;
  final String quantite;
  final String status;

  Commande({this.produit,this.quantite,this.status,this.user});

  factory Commande.fromJson(Map<String, dynamic>json){
    return Commande(
    produit: json["commande"],
      quantite: json["quantite"],
      status: json["stauts"],
      user: json["user"],

    );
  }

}

class ListCommande{
  final List<Commande> listCommande;

  ListCommande({this.listCommande});
  factory ListCommande.fromJson(List<dynamic>json){

    List<Commande> boucle = new List<Commande>();
    boucle = json.map((f)=> Commande.fromJson(f)).toList();

    return ListCommande(
      listCommande: boucle
    );
  }
}

class Produit{

  final String nom;
  final String desciption;
  final String prix;
  final String image;
  final String categorie;
  final ListCommande listCommande;

  Produit({this.nom,this.desciption,this.prix,this.image,this.listCommande,this.categorie});

  factory Produit.fromJson(Map<String, dynamic>json){
    return Produit(
      image: json["image"],
      categorie: json["categorie"],
      prix: json["prix"],
      desciption: json["description"],
      listCommande: json["listCommande"]

    );
  }

}

class ListProduit{

  final List<Produit> listProduit;

  ListProduit({this.listProduit});
  factory ListProduit.fromJson(List<dynamic>json){

    List<Produit> boucle = new List<Produit>();
    boucle = json.map((f)=> Produit.fromJson(f)).toList();

    return ListProduit(
        listProduit: boucle
    );
  }
}

class Categorie{

  final int id;
  final String nom;

  Categorie({this.nom,this.id});

  factory Categorie.fromJson(Map<String, dynamic>json){
    return Categorie(
      id: json["id"],
      nom: json["nom"],
    );
  }
}


 */