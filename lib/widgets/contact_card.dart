import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final String? image;

  const ContactCard({
    super.key,
    required this.name,
    required this.phone,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: image != null
              ? AssetImage(image!)
              : null,
          child: image == null
              ? Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          )
              : null,
          backgroundColor: Colors.blueAccent,
          radius: 28,
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          phone,
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: const Icon(Icons.phone, color: Colors.green),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Menghubungi $name...')),
          );
        },
      ),
    );
  }
}
