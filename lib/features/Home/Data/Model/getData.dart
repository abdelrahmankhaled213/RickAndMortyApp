class HomeData{

  String price;
  String name;
  String image;
  Map<String,dynamic>size;
  HomeData({

    required this.size,
required this.price,
    required this.name,
    required this.image
  });

  factory HomeData.fromJson(Map<String,dynamic>json){
    return HomeData(

        size: json['size'],
        price: json['price'],

        name: json['name'],
        image: json['image']);
  }
  Map<String,dynamic> toJson(){
    return {
      "price":this.price,
      "name":this.name,
      "image":this.image,
      "size":this.size,

    };
  }

}
