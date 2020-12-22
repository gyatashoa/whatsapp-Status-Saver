import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_status_saver/providers/images_provider.dart';
import 'package:whatsapp_status_saver/widgets/custom_card.dart';
class Pictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Consumer<ImagesProvider>(
        builder: (context, snapshot,widget) {
          return Container(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.getImage.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) =>
                            CustomCard(path: snapshot.getImage[index])),
                  );
        }
      );
  }
}