import "package:flutter/material.dart";

class Favourites extends StatefulWidget {
  static List<String> favouriteDataList = [];

  const Favourites({super.key});

  static getFavouriteDataList() {
    return favouriteDataList;
  }

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Jokes'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: Colors.black87,
            child: Favourites.favouriteDataList.isEmpty
                ? const Center(
                    child: Text(
                      'There are no favourites yet. You can add them by '
                          'pressing "Star"-button',
                      style: TextStyle(color: Colors.white),
                    ),
                )
                : ListView.builder(
                itemCount: Favourites.favouriteDataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black87,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              Favourites.favouriteDataList[index],
                              style: const TextStyle(fontSize: 19.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Favourites.favouriteDataList
                                  .remove(Favourites.favouriteDataList[index]);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                              Colors.tealAccent.shade700,
                            ),
                          ),
                          child: const Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
            ),
        ),
      );
  }
}