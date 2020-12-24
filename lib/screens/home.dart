import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(8, 4, 92, 1),
        title: Text(
          'Queueing Theory',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .04,
              decoration: BoxDecoration(
                color: Color.fromRGBO(8, 4, 92, 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28))
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Choose Model',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .03),
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .07,
                      child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Text(
                          'D / D / 1 / k-1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/model1'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .03),
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .07,
                      child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Text(
                          'M / M / 1 ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/model2'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .03),
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .07,
                      child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Text(
                          'M / M / 1 / k',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/model3'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .03),
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .07,
                      child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Text(
                          'M / M / C ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/model4'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .03),
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height * .07,
                      child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Text(
                          'M / M / C / k',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(context, 'routeName'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}