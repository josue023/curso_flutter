import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ScaffoldApp",
      home: MyHomePage(title: "ScaffoldApp Home"),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key, this.title}):super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Material Icon: ", style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(Icons.home, color: Colors.deepPurple, size: 30,)
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Cupertino Icon: ", style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(CupertinoIcons.home, color: Colors.indigo, size: 30,)
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("FontAwesome Icon: ", style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  FontAwesomeIcons.house,
                  color: Colors.blueGrey,
                  size: 30,
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Image.asset("Assets/Images/profesora.jpg",
                  width: 150,
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Image.network("https://play-lh.googleusercontent.com/5e7z5YCt7fplN4qndpYzpJjYmuzM2WSrfs35KxnEw-Ku1sClHRWHoIDSw3a3YS5WpGcI",
                  width: 150,
                )
              ],
            ),
            
            Container (
              height: 100,
              width: MediaQuery.of(context).size.width / 1.2,
              color: Colors.black,
              child: const Text("Este es un texto cualquiera",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: "Fruktur"
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Text("Texto con google fonts",
              style: GoogleFonts.pacifico(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }

}
