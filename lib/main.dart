import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Provider/AddressProvider.dart';
import 'package:petcare/Provider/CartProvider.dart';
import 'package:petcare/Provider/CategoryProvider.dart';
import 'package:petcare/Provider/ProductProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/screen/IntroPage.dart';
import 'package:petcare/screen/LoginPage.dart';
import 'package:petcare/screen/RegisterPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/SettingProvider.dart';
import 'Provider/UserProvider.dart';
import 'helper/Demo_Localization.dart';
import 'helper/Session.dart';

void main() async {
  // await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: prefs));
}

class MyApp extends StatefulWidget {
  late SharedPreferences sharedPreferences;

  MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    if (mounted) {
      setState(
        () {
          _locale = locale;
        },
      );
    }
  }

  @override
  void didChangeDependencies() {
    getLocale().then(
      (locale) {
        if (mounted) {
          setState(
            () {
              _locale = locale;
            },
          );
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingProvider>(
          create: (context) => SettingProvider(widget.sharedPreferences),
        ),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<AddressProvider>(
            create: (context) => AddressProvider()),
      ],
      child: MaterialApp(
        locale: _locale,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
          Locale('es', 'ES'),
          Locale('hi', 'IN'),
          Locale('fr', 'FR'),
          Locale('ar', 'DZ'),
          Locale('ru', 'RU'),
          Locale('ja', 'JP'),
          Locale('de', 'DE')
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: primaryColor,
            primaryColorDark: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: accentColors),
            useMaterial3: true),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePage createState() => _ChoosePage();
}

class _ChoosePage extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double margin = MediaQuery.of(context).size.width * 0.03;
    double left = MediaQuery.of(context).size.width * 0.05;
    // double margin=10;
    // double left=5;
    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: ExactAssetImage(
                        Constants.assetsImagePath + "background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Expanded(
              //   child:
              Container(
                color: Colors.black54,
                padding: EdgeInsets.only(bottom: margin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: margin,
                            bottom: margin,
                            left: left,
                            right: left),
                        height: 50,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Center(
                              child: getCustomText(
                                  S.of(context).register,
                                  Colors.white,
                                  1,
                                  TextAlign.center,
                                  FontWeight.w900,
                                  15)),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            bottom: margin, left: left, right: left),
                        height: 50,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Center(
                            child: getCustomText(
                                S.of(context).login,
                                Colors.black87,
                                1,
                                TextAlign.center,
                                FontWeight.w900,
                                15),
                          ),
                        )),
                  ],
                ),
              )
              // flex: 1,
              // )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Constants.stopApp();
        return false;
      },
    );
  }
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    // Constants.setThemePosition();

    signInValue();
    super.initState();

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
            backgroundColor: ConstantColors.bgColor,
            body: Container(
              child: splashPage(),
              // child: getSignInWidget(),
            )),
        onWillPop: _requestPop);
  }

  Future<bool> _requestPop() {
    Constants.stopApp();
    return new Future.value(false);
  }

  bool _isSignIn = false;
  bool _isIntro = false;

  void signInValue() async {
    _isSignIn = await PrefData.getIsSignIn();
    _isIntro = await PrefData.getIsIntro();
    setState(() {
      Timer(Duration(seconds: 3), () {
        if (_isIntro) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IntroPage(),
              ));
        } else if (_isSignIn) {
          print("isSignIn--" + _isSignIn.toString());
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(0),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChoosePage(),
              ));
        }
      });
    });
  }

  Widget getSignInWidget() {
    if (_isSignIn) {
      return splashPage();
    } else {
      return choosePage();
    }
  }

  Widget splashPage() {
    // SizeConfig().init(context);
    return Container(
      child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            Constants.assetsImagePath + "logo_app.jpg",
            // Constants.assetsImagePath + "logo.png",
            fit: BoxFit.cover,
            width: SizeConfig.safeBlockHorizontal! * 35,
            height: SizeConfig.safeBlockHorizontal! * 35,
          )),
    );
  }

  Widget choosePage() {
    double margin = MediaQuery.of(context).size.width * 0.03;
    double left = MediaQuery.of(context).size.width * 0.05;
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: ExactAssetImage(
                    Constants.assetsImagePath + "background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Expanded(
          //   child:
          Container(
            color: Colors.black54,
            margin: EdgeInsets.only(bottom: margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: margin, bottom: margin, left: left, right: left),
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(
                            child: getCustomText(
                                S.of(context).register,
                                Colors.white,
                                1,
                                TextAlign.center,
                                FontWeight.w900,
                                15)),
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(
                          bottom: margin, left: left, right: left),
                      height: 50,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(
                          child: getCustomText(
                              S.of(context).login,
                              Colors.black87,
                              1,
                              TextAlign.center,
                              FontWeight.w900,
                              15),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ],
            ),
          )
          // flex: 1,
          // )
        ],
      ),
    );
  }
}
