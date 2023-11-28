import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data/providers/Products.dart';
import 'package:shop_app/utils/networkHelper.dart';

import '../../data/models/Product.dart';

class AddProductScreen extends StatefulWidget {
  static const route = "/add_product_screen";

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _titleNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _priceNode = FocusNode();
  final _imageUrlNode = FocusNode();
  final _imageUrlController = TextEditingController();
  var _imageUrl = "";
  final _form = GlobalKey<FormState>();
  late Products products ;
  var _tempProduct = Product(
    id: "",
    title: '',
    description: '',
    price: 0.0,
    imageUrl: '',
  );

  @override
  void dispose() {
    _titleNode.dispose();
    _priceNode.dispose();
    _descriptionNode.dispose();
    _imageUrlNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _imageUrlNode.addListener(() {
      setState(() {
        _imageUrl = _imageUrlController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          IconButton(
            onPressed: () {
              _saveProduct();
            },
            icon: const Icon(
              Icons.save,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Title"),
                  textInputAction: TextInputAction.next,
                  focusNode: _titleNode,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_descriptionNode),
                  onSaved: (value){
                   _tempProduct = _tempProduct.copy(title: value);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "price"),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceNode,
                  onSaved: (value){
                    _tempProduct = _tempProduct.copy(price: double.parse(value ?? "0.0"));
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "description"),
                  textInputAction: TextInputAction.newline,
                  focusNode: _descriptionNode,
                  maxLines: 4,
                  minLines: 1,
                  onSaved: (value){
                    _tempProduct = _tempProduct.copy(description: value);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "image Url"),
                  textInputAction: TextInputAction.done,
                  focusNode: _imageUrlNode,
                  controller: _imageUrlController,
                  onFieldSubmitted: (_) {
                    setState(() {
                      _imageUrl = _imageUrlController.text;
                    });
                  },
                  onSaved: (value){
                    _tempProduct = _tempProduct.copy(imageUrl: value);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        _imageUrl,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveProduct() {
    _form.currentState?.save();
    products.addProduct(_tempProduct);
    NetworkHelper.postProduct("products", _tempProduct).then((response) {
      if (response != null && response.body.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Product Was Added"),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error"),
          ),
        );
      }
    });
  }
}
