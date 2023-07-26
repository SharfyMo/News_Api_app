import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTemplate extends StatelessWidget {
  String title, description, urlToImage, url;
  NewsTemplate(
      {super.key,
      required this.title,
      required this.url,
      required this.description,
      required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var websitUri = Uri.parse(url);
        launchUrl(
          websitUri,
          mode: LaunchMode.externalApplication,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color.fromARGB(26, 0, 0, 0),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  // imageUrl: urlToImage,
                  imageUrl: urlToImage != null
                      ? urlToImage
                      : 'https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                  width: 380,
                  height: 200,
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 8),
            Text(
              title != null ? title : '',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              description != null ? description : '',
              style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
