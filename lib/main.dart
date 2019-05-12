import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate = 18;
  var selectedBarber = 'Jonathan';
  var selectedTime = '12:30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'BOOKING ',
          style: TextStyle(
            fontFamily: 'firaSans',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 4,
                    ),
                  ],
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 20,
                left: 15,
                right: 15,
                child: Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      getDate(18, 'Tue'),
                      SizedBox(width: 25),
                      getDate(19, 'Wed'),
                      SizedBox(width: 25),
                      getDate(20, 'Thu'),
                      SizedBox(width: 25),
                      getDate(21, 'Fri'),
                      SizedBox(width: 25),
                      getDate(22, 'Sat'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Center(
            child: Text(
              'Hagorapt',
              style: TextStyle(
                letterSpacing: 2,
                fontFamily: 'Nunito',
                fontSize: 30,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              SizedBox(width: 15),
              getService('Beards', 50),
              getService('Crew Cut', 15),
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 175,
            child: ListView(
              padding: EdgeInsets.only(left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getBarber('assets/images/style2.jpg', 'Anton'),
                SizedBox(width: 15),
                getBarber('assets/images/style1.jpg', 'Jonathan'),
                SizedBox(width: 15),
                getBarber('assets/images/style3.jpeg', 'Jim'),
                SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 15),
                getTime('11:00'),
                SizedBox(width: 25),
                getTime('12:30'),
                SizedBox(width: 25),
                getTime('13:30'),
                SizedBox(width: 25),
                getTime('15:00'),
                SizedBox(width: 25),
                getTime('16:00'),
                SizedBox(width: 25),
                getTime('17:00'),
                SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'BOOK',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontFamily: 'FiraSins',
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color switchTimeColor(time) {
    if (time == selectedTime) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.grey.withOpacity(0.2);
    }
  }

  Color switchTimeContentColor(time) {
    if (time == selectedTime) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  selectTime(time) {
    setState(() {
      selectedTime = time;
    });
  }

  Widget getTime(time) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: switchTimeColor(time),
      ),
      height: 50,
      width: 75,
      child: InkWell(
        onTap: () {
          selectTime(time);
        },
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: switchTimeContentColor(time),
            ),
          ),
        ),
      ),
    );
  }

  Widget getBarber(String imgPath, String name) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                selectBarber(name);
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: getSelectedBarber(name),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  selectBarber(name) {
    setState(() {
      selectedBarber = name;
    });
  }

  Color getSelectedBarber(name) {
    if (name == selectedBarber) {
      return Colors.green.withOpacity(0.3);
    } else {
      return Colors.transparent;
    }
  }

  Widget getService(String name, int price) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 5),
          Text(
            '\$${price.toString()}',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget getDate(int date, String day) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: switchColor(date),
      ),
      width: 60,
      height: 60,
      child: InkWell(
        onTap: () {
          selectDate(date);
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 7),
              Text(
                date.toString(),
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: switchContentColor(date),
                ),
              ),
              Text(
                day,
                style: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 15,
                  color: switchContentColor(date),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color switchColor(date) {
    if (date == selectedDate) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.grey.withOpacity(0.2);
    }
  }

  Color switchContentColor(date) {
    if (date == selectedDate) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  selectDate(date) {
    setState(() {
      selectedDate = date;
    });
  }
}
