import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workshop/model/photos_response.dart';
import 'package:workshop/services/placeholder_api.dart';
import 'package:workshop/widgets/spinner.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Layout")),
      body: FutureBuilder(
        future: PlaceholderApi().getPhotos(),
        builder: (context, AsyncSnapshot<List<PhotosResponse>?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return PhotosList(
              photos: snapshot.data!,
            );
          } else {
            return const Spinner();
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<PhotosResponse> photos;

  const PhotosList({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: photos.length,
      separatorBuilder: (c, i) => const Divider(
        height: 1,
        thickness: 1.2,
      ),
      itemBuilder: (c, i) => ListTile(
        title: Text(photos[i].id.toString()),
        subtitle: Text(photos[i].title),
        trailing: Image(
          image: NetworkImage(photos[i].thumbnailUrl),
        ),
      ),
    );
  }
}
