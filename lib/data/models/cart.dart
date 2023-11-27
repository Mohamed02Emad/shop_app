class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
  static int lastId=0;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl
  });

  static String getNewId(){
    lastId+=1;
    return (lastId-1).toString();
  }

}
