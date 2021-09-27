import 'package:flutter/material.dart';
import 'package:transicion_app/src/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _crearRuta());
        },
        child: Icon(Icons.keyboard_arrow_right_outlined),
      ),
      body: Center(
        child: Text('Pagina 1'),
      ),
    );
  }

  _crearRuta() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            Pagina2Page(),
        transitionDuration: Duration(milliseconds: 800),
        transitionsBuilder: (contex, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          // return SlideTransition(
          //   position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
          //       .animate(curveAnimation),
          //   child: child,
          // );

          // return ScaleTransition(
          //     // filterQuality: FilterQuality.medium,
          //     child: child,
          //     scale: Tween<double>(begin: 0, end: 1).animate(curveAnimation));

          // return RotationTransition(
          //     child: child,
          //     turns: Tween<double>(begin: 0, end: 1).animate(curveAnimation));

          // return FadeTransition(
          //     child: child,
          //     opacity: Tween<double>(begin: 0, end: 1).animate(curveAnimation));

          //se pueden combinar !!!

          return SlideTransition(
            position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
                .animate(curveAnimation),
            child: FadeTransition(
                child: child,
                opacity:
                    Tween<double>(begin: 0, end: 1).animate(curveAnimation)),
          );
        });
  }
}
