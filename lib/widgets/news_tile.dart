import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  // Function to open the news article URL in the browser
  Future<void> _launchURL(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the Column in a GestureDetector to detect taps
      onTap: () {
        if (articleModel.url != null && articleModel.url!.isNotEmpty) {
          _launchURL(articleModel.url!);  // Open the article URL
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('URL not available')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            // Make it easy to give a border to the image
            borderRadius: BorderRadius.circular(6),
            child: articleModel.image != null && articleModel.image!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: articleModel.image!,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset('assets/no-image-icon-512x512-lfoanl0w.png'),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    'assets/no-image-icon-512x512-lfoanl0w.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            articleModel.title ?? 'No Title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            articleModel.subtitle ?? ' ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
