import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_status_saver/providers/videos_provider.dart';
import 'package:whatsapp_status_saver/widgets/custom_card.dart';

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideosProvider>(
      builder: (context, snapshot,widget) {
        return Container(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount:snapshot.getVideo.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) =>
                            CustomCard(vid: snapshot.getVideo[index],isVideo: true,)),
                  );
      }
    ); 
  }
}