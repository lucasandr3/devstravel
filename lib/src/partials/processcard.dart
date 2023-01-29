import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessCard extends StatelessWidget {

  ProcessCard({required this.data, required this.onTap});

  final data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: () {},
     child: Container(
         padding: EdgeInsets.all(10),
         margin: EdgeInsets.only(bottom: 10),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(5)),
         child: Row(
           children: [
             Container(
               padding: EdgeInsets.all(25),
               decoration: BoxDecoration(
                   color: Color(0xFF7460ee),
                   borderRadius: BorderRadius.circular(5)),
               child: Icon(Icons.warehouse_sharp, color: Colors.white),
             ),
             SizedBox(width: 20),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('0', style: GoogleFonts.abyssinicaSil(
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                 )),
                 SizedBox(width: 15),
                 Text('Total de prefeituras', style: GoogleFonts.abel(
                     fontSize: 16
                 )),
               ],
             )
           ],
         )
     ),
   );
  }
}