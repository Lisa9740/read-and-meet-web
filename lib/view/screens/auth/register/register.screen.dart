import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_and_meet_web/view/screens/auth/register/components/register.form.dart';
import 'package:read_and_meet_web/view/widgets/auth/auth.container.dart';

import '../../../../core/utils/layout/screen.layout.dart';
import '../../../widgets/logo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/inscription';


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: ScreenLayout.getScreenWidth(context) ,
            color: Colors.orange,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ AuthContainer(child: Padding(padding: EdgeInsets.only(top:100, bottom: 100),child:Column(
                    children: <Widget>[
                      SizedBox(height: 50, width: 50, child: const Logo()),
                       Center(child: Padding(padding: EdgeInsets.only(top: 100, bottom : 30), child: Text("Inscrivez-vous ! ",
                        style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25)))),
                      RegisterForm()
                    ]
                ))
                )]
            ))
    );

  }
}