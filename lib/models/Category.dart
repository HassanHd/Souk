class Category{
int id;
String name_en;
String name_ar;
String slug;
String image;

Category({required this.id, required this.name_en, required this.name_ar, required this.slug,required this.image});

factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name_en: json["name_en"],
      name_ar: json["name_ar"],
      slug: json["slug"],
      image: json["image"],
    );
  }

Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name_en": this.name_en,
      "name_ar": this.name_ar,
      "slug": this.slug,
      "image": this.image,
    };
  }
//

}