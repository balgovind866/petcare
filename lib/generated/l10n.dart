// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.`
  String get lorem_text {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
      name: 'lorem_text',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.`
  String get lorem_text2 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
      name: 'lorem_text2',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Find Your New Friend`
  String get findYourNewFriend {
    return Intl.message(
      'Find Your New Friend',
      name: 'findYourNewFriend',
      desc: '',
      args: [],
    );
  }

  /// `All Pet Needs Are Here`
  String get allPetNeedsAreHere {
    return Intl.message(
      'All Pet Needs Are Here',
      name: 'allPetNeedsAreHere',
      desc: '',
      args: [],
    );
  }

  /// `Pet Deserves More Care`
  String get petDeservesMoreCare {
    return Intl.message(
      'Pet Deserves More Care',
      name: 'petDeservesMoreCare',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get createAnAccount {
    return Intl.message(
      'Create an Account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your details information`
  String get SignUpMsg {
    return Intl.message(
      'Enter your details information',
      name: 'SignUpMsg',
      desc: '',
      args: [],
    );
  }

  /// `Email Address*`
  String get emailAddress {
    return Intl.message(
      'Email Address*',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get password {
    return Intl.message(
      'Password*',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `I have accept`
  String get iHaveAccept {
    return Intl.message(
      'I have accept',
      name: 'iHaveAccept',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get termsCondition {
    return Intl.message(
      'Terms & Condition',
      name: 'termsCondition',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Have an Account?`
  String get haveAnAccount {
    return Intl.message(
      'Have an Account?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get termsAndCondition {
    return Intl.message(
      'Terms & Condition',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Pets Care`
  String get app_name {
    return Intl.message(
      'Pets Care',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `To Continue, first verify that it's you.`
  String get SignInMsg {
    return Intl.message(
      'To Continue, first verify that it\'s you.',
      name: 'SignInMsg',
      desc: '',
      args: [],
    );
  }

  /// `Let's Sign You In`
  String get signYouIn {
    return Intl.message(
      'Let\'s Sign You In',
      name: 'signYouIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Set your Password?`
  String get setYourPassword {
    return Intl.message(
      'Set your Password?',
      name: 'setYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address.You will receive a link to create a new password via email.`
  String get passwordDesc {
    return Intl.message(
      'Please enter your email address.You will receive a link to create a new password via email.',
      name: 'passwordDesc',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an Account?`
  String get donHaveAnAccount {
    return Intl.message(
      'Don\'t have an Account?',
      name: 'donHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Pets`
  String get pets {
    return Intl.message(
      'Pets',
      name: 'pets',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `What are you looking for?`
  String get whatAreYouLookingFor {
    return Intl.message(
      'What are you looking for?',
      name: 'whatAreYouLookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Treatment`
  String get treatment {
    return Intl.message(
      'Treatment',
      name: 'treatment',
      desc: '',
      args: [],
    );
  }

  /// `Pet Hotel`
  String get petHotel {
    return Intl.message(
      'Pet Hotel',
      name: 'petHotel',
      desc: '',
      args: [],
    );
  }

  /// `Adoption`
  String get adoption {
    return Intl.message(
      'Adoption',
      name: 'adoption',
      desc: '',
      args: [],
    );
  }

  /// `Latest Offers`
  String get latestOffers {
    return Intl.message(
      'Latest Offers',
      name: 'latestOffers',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling Items`
  String get bestSellingItems {
    return Intl.message(
      'Best Selling Items',
      name: 'bestSellingItems',
      desc: '',
      args: [],
    );
  }

  /// `Good to Read`
  String get goodToRead {
    return Intl.message(
      'Good to Read',
      name: 'goodToRead',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get orderNow {
    return Intl.message(
      'Order Now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `ChekOut`
  String get chekout {
    return Intl.message(
      'ChekOut',
      name: 'chekout',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Fee`
  String get shippingFee {
    return Intl.message(
      'Shipping Fee',
      name: 'shippingFee',
      desc: '',
      args: [],
    );
  }

  /// `Estimating Tax`
  String get estimatingTax {
    return Intl.message(
      'Estimating Tax',
      name: 'estimatingTax',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `New Address`
  String get newAddress {
    return Intl.message(
      'New Address',
      name: 'newAddress',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get deliverTo {
    return Intl.message(
      'Deliver to',
      name: 'deliverTo',
      desc: '',
      args: [],
    );
  }

  /// `Full Name*`
  String get fullName {
    return Intl.message(
      'Full Name*',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number*`
  String get phoneNumber {
    return Intl.message(
      'Phone Number*',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `City/District*`
  String get cityarea {
    return Intl.message(
      'City/Area*',
      name: 'cityarea',
      desc: '',
      args: [],
    );
  }

  /// `Zip*`
  String get zip {
    return Intl.message(
      'Zip*',
      name: 'zip',
      desc: '',
      args: [],
    );
  }

  /// `House/Apartment`
  String get houseapartment {
    return Intl.message(
      'House/Apartment',
      name: 'houseapartment',
      desc: '',
      args: [],
    );
  }

  /// `Agency/Company`
  String get agencycompany {
    return Intl.message(
      'Agency/Company',
      name: 'agencycompany',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueStr {
    return Intl.message(
      'Continue',
      name: 'continueStr',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Save Cards`
  String get saveCards {
    return Intl.message(
      'Save Cards',
      name: 'saveCards',
      desc: '',
      args: [],
    );
  }

  /// `New Card`
  String get newCard {
    return Intl.message(
      'New Card',
      name: 'newCard',
      desc: '',
      args: [],
    );
  }

  /// `Card No`
  String get cardNo {
    return Intl.message(
      'Card No',
      name: 'cardNo',
      desc: '',
      args: [],
    );
  }

  /// `Exp. Date`
  String get expDate {
    return Intl.message(
      'Exp. Date',
      name: 'expDate',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `CVV*`
  String get cvvHint {
    return Intl.message(
      'CVV*',
      name: 'cvvHint',
      desc: '',
      args: [],
    );
  }

  /// `Promo Code`
  String get promoCode {
    return Intl.message(
      'Promo Code',
      name: 'promoCode',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message(
      'Place Order',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupon`
  String get applyCoupon {
    return Intl.message(
      'Apply Coupon',
      name: 'applyCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Available Coupon`
  String get availableCoupon {
    return Intl.message(
      'Available Coupon',
      name: 'availableCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Rate & Review`
  String get rateReview {
    return Intl.message(
      'Rate & Review',
      name: 'rateReview',
      desc: '',
      args: [],
    );
  }

  /// `Rate the Food`
  String get rateTheFood {
    return Intl.message(
      'Rate the Food',
      name: 'rateTheFood',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name*`
  String get cardHolderName {
    return Intl.message(
      'Card Holder Name*',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Exp. Date*`
  String get expDateHint {
    return Intl.message(
      'Exp. Date*',
      name: 'expDateHint',
      desc: '',
      args: [],
    );
  }

  /// `Save the Cards`
  String get saveTheCards {
    return Intl.message(
      'Save the Cards',
      name: 'saveTheCards',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Adopt Now`
  String get adoptNow {
    return Intl.message(
      'Adopt Now',
      name: 'adoptNow',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Store Visit`
  String get storeVisit {
    return Intl.message(
      'Store Visit',
      name: 'storeVisit',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up`
  String get pickUp {
    return Intl.message(
      'Pick Up',
      name: 'pickUp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Booking`
  String get confirmBooking {
    return Intl.message(
      'Confirm Booking',
      name: 'confirmBooking',
      desc: '',
      args: [],
    );
  }

  /// `Check-in`
  String get checkin {
    return Intl.message(
      'Check-in',
      name: 'checkin',
      desc: '',
      args: [],
    );
  }

  /// `Check-Out`
  String get checkout {
    return Intl.message(
      'Check-Out',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Order Id`
  String get orderId {
    return Intl.message(
      'Order Id',
      name: 'orderId',
      desc: '',
      args: [],
    );
  }

  /// `Pet Name`
  String get petName {
    return Intl.message(
      'Pet Name',
      name: 'petName',
      desc: '',
      args: [],
    );
  }

  /// `Breed`
  String get breed {
    return Intl.message(
      'Breed',
      name: 'breed',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profiles`
  String get editProfiles {
    return Intl.message(
      'Edit Profiles',
      name: 'editProfiles',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddressHint {
    return Intl.message(
      'Email Address',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number*`
  String get mobileNumberAstrix {
    return Intl.message(
      'Mobile Number*',
      name: 'mobileNumberAstrix',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addressTitle {
    return Intl.message(
      'Address',
      name: 'addressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Saved Cards`
  String get mySavedCards {
    return Intl.message(
      'My Saved Cards',
      name: 'mySavedCards',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourName {
    return Intl.message(
      'Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Write your review`
  String get writeYourReview {
    return Intl.message(
      'Write your review',
      name: 'writeYourReview',
      desc: '',
      args: [],
    );
  }

  /// `Minimum characters:250`
  String get minimumCharacters250 {
    return Intl.message(
      'Minimum characters:250',
      name: 'minimumCharacters250',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Write Reviews`
  String get writeReviews {
    return Intl.message(
      'Write Reviews',
      name: 'writeReviews',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get toatalamount {
    return Intl.message(
      'Total Amount',
      name: 'toatalamount',
      desc: '',
      args: [],
    );
  }

  /// `Order Detail`
  String get orderDetail {
    return Intl.message(
      'Order Detail',
      name: 'orderDetail',
      desc: '',
      args: [],
    );
  }

  /// `New Pet`
  String get newPet {
    return Intl.message(
      'New Pet',
      name: 'newPet',
      desc: '',
      args: [],
    );
  }

  /// `Add your new furry friends`
  String get addYourNewFurryFriends {
    return Intl.message(
      'Add your new furry friends',
      name: 'addYourNewFurryFriends',
      desc: '',
      args: [],
    );
  }

  /// `Your Buddy Name`
  String get yourBuddyName {
    return Intl.message(
      'Your Buddy Name',
      name: 'yourBuddyName',
      desc: '',
      args: [],
    );
  }

  /// `Types of Pet`
  String get typesOfPet {
    return Intl.message(
      'Types of Pet',
      name: 'typesOfPet',
      desc: '',
      args: [],
    );
  }

  /// `Birthdate`
  String get birthdate {
    return Intl.message(
      'Birthdate',
      name: 'birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message(
      'Sub Total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `AGE`
  String get AGE {
    return Intl.message(
      'AGE',
      name: 'AGE',
      desc: '',
      args: [],
    );
  }

  /// `SEX`
  String get SEX {
    return Intl.message(
      'SEX',
      name: 'SEX',
      desc: '',
      args: [],
    );
  }

  /// `WEIGHT`
  String get WEIGHT {
    return Intl.message(
      'WEIGHT',
      name: 'WEIGHT',
      desc: '',
      args: [],
    );
  }

  /// `Search Here`
  String get searchHere {
    return Intl.message(
      'Search Here',
      name: 'searchHere',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, your pet is safe with us`
  String get dontWorryYourPetIsSafeWithUs {
    return Intl.message(
      'Don\'t worry, your pet is safe with us',
      name: 'dontWorryYourPetIsSafeWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Select Pet`
  String get selectPet {
    return Intl.message(
      'Select Pet',
      name: 'selectPet',
      desc: '',
      args: [],
    );
  }

  /// `Select pet that will get treatment`
  String get selectPetThatWillGetTreatment {
    return Intl.message(
      'Select pet that will get treatment',
      name: 'selectPetThatWillGetTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Service Types`
  String get serviceTypes {
    return Intl.message(
      'Service Types',
      name: 'serviceTypes',
      desc: '',
      args: [],
    );
  }

  /// `Additional Treatment(Optional)`
  String get additionalTreatmentoptional {
    return Intl.message(
      'Additional Treatment(Optional)',
      name: 'additionalTreatmentoptional',
      desc: '',
      args: [],
    );
  }

  /// `Select treatment for your pet`
  String get selectTreatmentForYourPet {
    return Intl.message(
      'Select treatment for your pet',
      name: 'selectTreatmentForYourPet',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Pet Treatment`
  String get petTreatment {
    return Intl.message(
      'Pet Treatment',
      name: 'petTreatment',
      desc: '',
      args: [],
    );
  }

  /// `The kind of care your pet deserve`
  String get theKindOfCareYourPetDeserve {
    return Intl.message(
      'The kind of care your pet deserve',
      name: 'theKindOfCareYourPetDeserve',
      desc: '',
      args: [],
    );
  }

  /// `Select Treatment`
  String get selectTreatment {
    return Intl.message(
      'Select Treatment',
      name: 'selectTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message(
      'Select Time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Pet Details`
  String get petDetails {
    return Intl.message(
      'Pet Details',
      name: 'petDetails',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up Address`
  String get pickUpAddress {
    return Intl.message(
      'Pick Up Address',
      name: 'pickUpAddress',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Additional treatment`
  String get additionalTreatment {
    return Intl.message(
      'Additional treatment',
      name: 'additionalTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Valid from`
  String get validFrom {
    return Intl.message(
      'Valid from',
      name: 'validFrom',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart`
  String get addedToCart {
    return Intl.message(
      'Added to cart',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Free Delivery`
  String get freeDelivery {
    return Intl.message(
      'Free Delivery',
      name: 'freeDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Share your opinion`
  String get shareYourOpinion {
    return Intl.message(
      'Share your opinion',
      name: 'shareYourOpinion',
      desc: '',
      args: [],
    );
  }

  /// `Your Review`
  String get yourReview {
    return Intl.message(
      'Your Review',
      name: 'yourReview',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Arrange based on the following types`
  String get arrangeBasedOnTheFollowingTypes {
    return Intl.message(
      'Arrange based on the following types',
      name: 'arrangeBasedOnTheFollowingTypes',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Filter products with more specific types`
  String get filterProductsWithMoreSpecificTypes {
    return Intl.message(
      'Filter products with more specific types',
      name: 'filterProductsWithMoreSpecificTypes',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message(
      'Price Range',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Submission`
  String get submission {
    return Intl.message(
      'Submission',
      name: 'submission',
      desc: '',
      args: [],
    );
  }

  /// `Fill these forms for adoption submission`
  String get fillTheseFormsForAdoptionSubmission {
    return Intl.message(
      'Fill these forms for adoption submission',
      name: 'fillTheseFormsForAdoptionSubmission',
      desc: '',
      args: [],
    );
  }

  /// `Living Address`
  String get livingAddress {
    return Intl.message(
      'Living Address',
      name: 'livingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Have you previously owned pets?`
  String get haveYouPreviouslyOwnedPets {
    return Intl.message(
      'Have you previously owned pets?',
      name: 'haveYouPreviouslyOwnedPets',
      desc: '',
      args: [],
    );
  }

  /// `Why do you want to adopt?`
  String get whyDoYouWantToAdopt {
    return Intl.message(
      'Why do you want to adopt?',
      name: 'whyDoYouWantToAdopt',
      desc: '',
      args: [],
    );
  }

  /// `Describe your reason`
  String get describeYourReason {
    return Intl.message(
      'Describe your reason',
      name: 'describeYourReason',
      desc: '',
      args: [],
    );
  }

  /// `We texted you a code to verify\nyour phone number`
  String get weTextedYouACodeToVerifynyourPhoneNumber {
    return Intl.message(
      'We texted you a code to verify\nyour phone number',
      name: 'weTextedYouACodeToVerifynyourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Account Created!`
  String get accountCreated {
    return Intl.message(
      'Account Created!',
      name: 'accountCreated',
      desc: '',
      args: [],
    );
  }

  /// `Your account has\nbeen successfully created!`
  String get yourAccountHasnbeenSuccessfullyCreated {
    return Intl.message(
      'Your account has\nbeen successfully created!',
      name: 'yourAccountHasnbeenSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Stay notified about course updates,\nnew exam tools and change to\nthe leaderboard`
  String get stayNotifiedAboutCourseUpdatesnnewExamToolsAndChangeTonthe {
    return Intl.message(
      'Stay notified about course updates,\nnew exam tools and change to\nthe leaderboard',
      name: 'stayNotifiedAboutCourseUpdatesnnewExamToolsAndChangeTonthe',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get allow {
    return Intl.message(
      'Allow',
      name: 'allow',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `List of your all orders`
  String get listOfYourAllOrders {
    return Intl.message(
      'List of your all orders',
      name: 'listOfYourAllOrders',
      desc: '',
      args: [],
    );
  }

  /// `List bio of your furry friends`
  String get listBioOfYourFurryFriends {
    return Intl.message(
      'List bio of your furry friends',
      name: 'listBioOfYourFurryFriends',
      desc: '',
      args: [],
    );
  }

  /// `Add New Pet`
  String get addNewPet {
    return Intl.message(
      'Add New Pet',
      name: 'addNewPet',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message(
      'Track Order',
      name: 'trackOrder',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
