import 'package:flutter/material.dart';

void main() => runApp(ContactProfilePage());

enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  //method to provide light theme

  static ThemeData appThemeLight() {
    return ThemeData(
      //Define the default brightness and colors
      brightness: Brightness.light,

      ////Theme for app bar
      appBarTheme: AppBarTheme(
        //AppBar's color
        color: Colors.white,

        //Theme for AppBar's icons
        iconTheme: IconThemeData(
          //Dark color icons on light colored background
          color: Colors.black,
        ),
      ),

      //Theme for apps icon
      iconTheme: IconThemeData(
        color: Colors.indigo.shade800,
      ),

      //Theme for FAB
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,

        //Black plus (+) sign for FAB
        foregroundColor: Colors.black,
      ),
    );
  }

  //Method to provide dark theme

  static ThemeData appThemeDark() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.dark,

      //Theme for app bar
      appBarTheme: AppBarTheme(
        //AppBar's background color is dark this time
        color: Colors.black,

        //Light color for the app bar's icons
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      //App's icons are colored in orange color
      iconTheme: IconThemeData(
        color: Colors.orange,
      ),

      //Theme for FAB
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB
        foregroundColor: Colors.white,
      ),
    );
  }
}

class ContactProfilePage extends StatefulWidget {
  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  //NEW CODE
  var currentTheme = APP_THEME.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

//NEW CODE: Applying theme based on the current selection.
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),

      //SOLUTION: Use method for dark theme
      // theme: MyAppThemes.appThemeDark(),

      home: Scaffold(
        //Creating app bar
        appBar: buildAppBarWidget(),

        //Creating body part of the app
        body: buildBodyWidget(),
        //Code for FAB
        floatingActionButton: FloatingActionButton(
          child: IconButton(
            icon: Icon(Icons.threesixty),
            onPressed: () {
              setState(() {
                //NEW CODE: Currently selected theme toggles when FAB is pressed
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildAppBarWidget() {
    return AppBar(
      leading: Icon(
        Icons.arrow_back,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            print("Contact is starred");
          },
        ),
      ],
    );
  }

  Widget buildBodyWidget() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2020/11/06/05/33/woman-5716875_1280.png",
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ms Abs",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              /* NEW CODE: Applying local theme to profileActionItems()
              child: Theme(
                data: ThemeData(
                  //Applying iconTheme locally
                  iconTheme: IconThemeData(
                    //NOTE: Try Colors.orange or a diffrent color
                    color: Colors.pink,
                  ),
                ), */
              child: profileActionItems(),
            ),
            Divider(
              color: Colors.grey,
            ),
            mobilePhoneListTile(),
            otherPhoneListTile(),
            Divider(
              color: Colors.grey,
            ),
            emailListTile(),
            Divider(
              color: Colors.grey,
            ),
            addressListTile(),
          ],
        ),
      ],
    );
  }

  //NOTE: Builds the action items widget
  Widget profileActionItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildCallButton(),
        buildTextButton(),
        buildVideoCallButton(),
        buildEmailButton(),
        buildDirectionsButton(),
        buildPayButton(),
      ],
    );
  }

  //Adding "Call" action item
  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.call,
          ),
          onPressed: () {},
        ),
        Text("Call"),
      ],
    );
  }

  //Adding "Text" action item
  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.message,
          ),
          onPressed: () {},
        ),
        Text("Text"),
      ],
    );
  }

  //Adding "Video" action item
  Widget buildVideoCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.video_call),
          onPressed: () {},
        ),
        Text("Video"),
      ],
    );
  }

  //Adding "Email" action item
  Widget buildEmailButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
        Text("Email"),
      ],
    );
  }

  //Adding "Directions" action item
  Widget buildDirectionsButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.directions),
          onPressed: () {},
        ),
        Text("Directions"),
      ],
    );
  }

  //Adding "Pay" action item
  Widget buildPayButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.attach_money,
          ),
          onPressed: () {},
        ),
        Text("Pay"),
      ],
    );
  }

  //Adding "Mobile Phone Number" item
  Widget mobilePhoneListTile() {
    return ListTile(
      leading: Icon(
        Icons.call,
        color: Colors.grey,
      ),
      title: Text("330-803-3390"),
      subtitle: Text("mobile"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }

  //Adding "Other Phone Number" item
  Widget otherPhoneListTile() {
    return ListTile(
      leading: Text(""),
      title: Text("440-440-3390"),
      subtitle: Text("other"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }

  //NEW CODE: Adding "Email Address" item
  Widget emailListTile() {
    return ListTile(
      leading: Icon(
        Icons.email,
        color: Colors.grey,
      ),
      title: Text("abc@.com"),
      subtitle: Text("work"),
    );
  }

  //NEW CODE: Adding Contact's home address
  Widget addressListTile() {
    return ListTile(
      leading: Icon(
        Icons.location_on,
        color: Colors.grey,
      ),
      title: Text("abs home address"),
      subtitle: Text("home"),
      trailing: IconButton(
        icon: Icon(Icons.directions),
        onPressed: () {},
      ),
    );
  }
}
