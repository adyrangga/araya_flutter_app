import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              // onPressed: _openDrawer,
              color: Colors.black,
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'GNC',
                style: TextStyle(
                    color: Colors.red, fontSize: 30, letterSpacing: 0),
                textAlign: TextAlign.center,
              ),
              Text(
                'Live Well',
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: Image.network(
                'https://cdn-ap-ec.yottaa.net/5b9fc7760b534475fab84de5/www.gnc.com/v~4b.3a/on/demandware.static/-/Sites-GNC2-Library/default/dwfe9292b9/firstspirit/media/september_2020/hp_b/818036_Sept_ImmuneBOGO50_Homepage_B_SPOT.jpg?yocs=s_f_',
                repeat: ImageRepeat.noRepeat,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'immune support bogo 50% off'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Text(
                'The best defense is a strong immune system',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
              child: RaisedButton(
                color: Colors.black,
                child: const Text('SHOP NOW',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: Image.network(
                'https://cdn-ap-ec.yottaa.net/5b9fc7760b534475fab84de5/www.gnc.com/v~4b.3a/on/demandware.static/-/Sites-GNC2-Library/default/dwac740413/firstspirit/media/september_2020/hp_b/September20_Bspots_Multivitamin.jpg?yocs=s_f_',
                repeat: ImageRepeat.noRepeat,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'did you know?'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Text(
                'GNC multis have vitamins C & D - plus zinc!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
              child: RaisedButton(
                color: Colors.black,
                child: const Text('SHOP NOW',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// Container(
// child: Column(
// children: <Widget>[
// Image.network(
// 'https://cdn-ap-ec.yottaa.net/5b9fc7760b534475fab84de5/www.gnc.com/v~4b.3a/on/demandware.static/-/Sites-GNC2-Library/default/dwfe9292b9/firstspirit/media/september_2020/hp_b/818036_Sept_ImmuneBOGO50_Homepage_B_SPOT.jpg?yocs=s_f_',
// repeat: ImageRepeat.noRepeat,
// ),
// Flexible(
// child: Padding(
// padding: EdgeInsets.all(0.0),
// child: Text(
// 'immune support bogo 50% off'.toUpperCase(),
// style: TextStyle(color: Colors.black, fontSize: 20),
// ),
// ),
// ),
// Flexible(
// child: Padding(
// padding: EdgeInsets.all(0.0),
// child: Text(
// 'The best defense is a strong immune system',
// style: TextStyle(
// color: Colors.black,
// ),
// ),
// ),
// )
// ],
// ),
// ),
