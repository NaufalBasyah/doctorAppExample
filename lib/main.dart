import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget> [IntrinsicHeight(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget> [
            selectionCard(context,"Appointment.png", "Make a Doctor's Appointment", 1.2, 1.2, appointmentPage_Date()),
            Column(
                children: <Widget>[
                  selectionCard(context,"FAQ.png", "FAQ", 0.4, .6, faqPage()),
                  selectionCard(context,"Medicine.png", "Non-Prescription Medicine", 0.4,.4, homePage()),
                  selectionCard(context,"Schedule.png","Your Schedules",0.4,.6, CalendarPage())
              ]
            )
        ],
        )
      ),
      Text("Medical News",
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.left,
      ),
      newsScroll()
    ]
    );
  }
}

Card selectionCard(BuildContext cntxt,String fileName, String title, double scale, double textScale, StatelessWidget s) {
  return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: InkWell(
            child: categoryContainer( fileName, title, scale, textScale),
            onTap: () {
              Navigator.push(
                cntxt,
                new MaterialPageRoute(builder: (cntxt) => s),);
            }
        ),
  );
}

Container categoryContainer(String imgName, String title, double inputNum, double inputNum2)
{
  return Container(
    width: 200*inputNum,
    height: 240*inputNum,
    child: Column(
      children: <Widget>[
        Image.asset('Assets/images/custom_icons/$imgName'),
        Text(
          "$title", style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18*inputNum2
        ),
            textAlign: TextAlign.center
        )
      ],
    ),
  );
}

Drawer myDrawer(){
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Naufal F. Basyah"),
          accountEmail: Text("naufal.basyah@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "N",
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.red[600]
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.red[600]),
        ),
        ListTile(
          title: Text('Edit Profile'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer

          },
        ),
        ListTile(
          title: Text('Sign Out'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer

          },
        ),
        ListTile(
          title: Text('Contact Us'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer

          },
        ),
      ],
    ),
  );
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo App'),
          centerTitle: true,
          backgroundColor: Colors.red[600],
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: MyStatelessWidget(),
        drawer: myDrawer()
    );
  }
}
Container createNewsWidget(String imgName, String articleName) {
  return Container(
    child: InkWell(
      child: Container(

        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'Assets/images/custom_icons/$imgName'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$articleName", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 250,
                    height: 50,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel erat a quam semper sagittis. ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    ),
  );
}
Container newsScroll() {
  return Container(
    height: 250,
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          createNewsWidget("FAQ.png", "News #1"),
          createNewsWidget("FAQ.png", "News #2"),
          createNewsWidget("FAQ.png", "News #3"),
          createNewsWidget("FAQ.png", "News #4"),
        ],
      ),
    ),
  );
}
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Calendar Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Table Calendar Demo'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
      Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: (){
              // Navigator.push(context, new MaterialPageRoute(builder: (context) => homePage()) );
            }
          )
        ],

        title: Text(widget.title),
      ),
      drawer: myDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
        TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
            ? Colors.brown[300]
            : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString()),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }
}

class faqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: myDrawer(),
      body: ListView(
        children: <Widget>[
          Text("FAQ",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Common Question'),
              subtitle: Text('Answer here'),
              trailing: Icon(Icons.beenhere_outlined),
            ),
          ),Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Common Question'),
              subtitle: Text('Answer here'),
              trailing: Icon(Icons.beenhere_outlined),
            ),
          ),Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Common Question'),
              subtitle: Text('Answer here'),
              trailing: Icon(Icons.beenhere_outlined),
            ),
          ),Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Common Question'),
              subtitle: Text('Answer here'),
              trailing: Icon(Icons.beenhere_outlined),
            ),
          ),Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Common Question'),
              subtitle: Text('Answer here'),
              trailing: Icon(Icons.beenhere_outlined),
            ),
          ),Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Common Question'),
              subtitle: Text('Answer here'),
              trailing: Icon(Icons.block_outlined),
            ),
          ),
        ]
      ),
    );
  }
}

class appointmentPage_Date extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Availability',
      theme: ThemeData(primarySwatch: Colors.red),
      home: DatePickerDemo()
    );
  }
}


class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  /// Which holds the selected date
  /// Defaults to today's date.
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Select date',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Colors.red,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => doctorsAvailable()) );
              },
              child: Text("Pick This Date", style:TextStyle(color: Colors.black))
            )
          ],
        ),
      ),
    );
  }
}

class doctorsAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose the Doctor'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              // Navigator.push(context, new MaterialPageRoute(builder: (context) => homePage()));
            },
          )
        ],
      ),
      drawer: myDrawer(),
      body: ListView(
          children: <Widget>[
            Text("Available GPs",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 550,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    createNewsWidget("Appointment.png", "Dr. A"),
                    createNewsWidget("Appointment.png", "Dr. B"),
                    createNewsWidget("Appointment.png", "Dr. C"),
                    createNewsWidget("Appointment.png", "Dr. D"),
                    createNewsWidget("Appointment.png", "Dr. E"),
                    createNewsWidget("Appointment.png", "Dr. F"),
                    createNewsWidget("Appointment.png", "Dr. G"),
                    createNewsWidget("Appointment.png", "Dr. H"),
                    createNewsWidget("Appointment.png", "Dr. I")
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
}
