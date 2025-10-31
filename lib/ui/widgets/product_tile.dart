import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  ProductTile({required this.product, required this.onTap, Key? key})
      : super(key: key);

  final _currency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 60,
        height: 60,
        child: CachedNetworkImage(
          imageUrl: product.image,
          placeholder: (c, s) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          errorWidget: (c, s, e) => const Icon(Icons.broken_image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Text(_currency.format(product.price)),
      onTap: onTap,
    );
  }
}
