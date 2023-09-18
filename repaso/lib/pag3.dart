import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key, required this.callback});
  
  final Function(String) callback;
  @override
  State<Page3> createState() => _Page3State();
  

}

class _Page3State extends State<Page3> {

  void _sendFace(String face){
    setState(() {
      widget.callback(face);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 3'),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _sendFace('૮ ˶ᵔ ᵕ ᵔ˶ ა') , 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), 
                    )
                  ), child: const Text('૮ ˶ᵔ ᵕ ᵔ˶ ა')
                ),
                ElevatedButton(onPressed: () => _sendFace('♡⸜(> ᵕ < )⸝') , 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), 
                    )
                  ), child: const Text('♡⸜(> ᵕ < )⸝')
                ),
                ElevatedButton(onPressed: () => _sendFace('ฅ^._.^ฅ') , 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), 
                    )
                  ), child: const Text('ฅ^._.^ฅ')
                ),
              ],
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}