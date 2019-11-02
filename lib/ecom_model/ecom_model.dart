
class User{

  final int id;
  final String nom;
  final String prenom;
  final String email;


  User({this.id, this.nom, this.prenom, this.email});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
        id: json["id"],
        nom: json["nom"],
      prenom: json["prenom"],
      email: json["email"]
    );
  }

}


class Commande{
  final int id;
  final String produit;
  final User user;
  final int quantite;
  final String status;

  Commande({this.id,this.produit,this.quantite,this.status,this.user});

  factory Commande.fromJson(Map<String, dynamic>json){
    return Commande(
      id: json["id"],
      produit: json["commande"],
      quantite: json["quantite"],
      status: json["stauts"],
      user: User.fromJson(json["utilisateur"]),
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
  final int prix;
  final String image;

  final ListCommande listCommande;

  Produit({this.nom,this.desciption,this.prix,this.image,this.listCommande});

  factory Produit.fromJson(Map<String, dynamic>json){
    return Produit(
      nom: json["nom"],
        image: json["image"],
        prix: json["prix"],
        desciption: json["description"],
        listCommande: ListCommande.fromJson(json["commande"])

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
  final String image;
  final ListProduit listProduits;

  Categorie({this.nom,this.id, this.image, this.listProduits});

  factory Categorie.fromJson(Map<String, dynamic>json){
    return Categorie(
      id: json["id"],
      nom: json["nom"],
      image: json["image"],
      listProduits: ListProduit.fromJson(json["produit"])
    );
  }
}


