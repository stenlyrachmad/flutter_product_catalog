import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/product.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency();
    return Scaffold(
      appBar: AppBar(
          title: Text(product.title,
              maxLines: 1, overflow: TextOverflow.ellipsis)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: SizedBox(
              height: 260,
              child: CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (c, s) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (c, s, e) =>
                    const Icon(Icons.broken_image, size: 80),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(product.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(currency.format(product.price),
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, size: 18),
              const SizedBox(width: 4),
              Text('${product.rating.rate} (${product.rating.count} reviews)'),
            ],
          ),
          const SizedBox(height: 12),
          Text('Category: ${product.category}'),
          const SizedBox(height: 12),
          Text(product.description),
        ]),
      ),
    );
  }
}
