

class Products{
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rating;
  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Products.fromJson(Map<String,Object?> json) {
    return Products(
      id: json["id"] as int,
      title: json["title"] as String,
      price: json["price"] as num,
      description: json["description"] as String,
      category: json["category"] as String,
      image: json["image"] as String,
      rating : Rating.fromJson(json["rating"] as Map<String,Object?>),
    );
  }


  Map<String,Object> toJson() => {
    "id" : id,
    "title" : title,
    "price" : price,
    "description" : description,
    "category" : category,
    "image" : image,
    "rating": rating.toJson(),
  };

  @override
  String toString() {
    return 'Products{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}

class Rating{
  num rate;
  int count;

  Rating({required this.rate,required this.count});

  factory Rating.fromJson(Map<String,Object?> json){
    return Rating(
        rate: json["rate"] as num,
        count: json["count"] as int
    );
  }
  Map<String,Object> toJson() => {
    "rate" : rate,
    "count" : count,
  };
}


