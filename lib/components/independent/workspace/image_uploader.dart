import 'package:flutter/material.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({super.key});

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.5
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      _imagePath != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _imagePath!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                          : const Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Colors.grey,
                          ),
                ),
                if (_imagePath != null)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _imagePath = null;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    // Use `image_picler` plugin to select image(s)

    setState(() {
      _imagePath = 'https://scholar7r.cn/favicon.ico';
    });
  }
}
