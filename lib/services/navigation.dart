import 'package:delilo/screens/authenticate/authenticate.dart';
import 'package:delilo/screens/authenticate/getlocation.dart';
import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/authenticate/signinphone.dart';
import 'package:delilo/screens/auxillary/rate_us.dart';
import 'package:delilo/screens/home/CustomerSupport/customer_support.dart';
import 'package:delilo/screens/home/account.dart';
import 'package:delilo/screens/home/cart.dart';
import 'package:delilo/screens/home/coupons/coupons.dart';
import 'package:delilo/screens/home/fashion/fashionmain.dart';
import 'package:delilo/screens/home/fashion/kids/kids_fashion_category.dart';
import 'package:delilo/screens/home/fashion/kids/kidsfashion.dart';
import 'package:delilo/screens/home/fashion/men/men_fashion_category.dart';
import 'package:delilo/screens/home/fashion/men/mensfashion.dart';
import 'package:delilo/screens/home/fashion/women/women_fashion_category.dart';
import 'package:delilo/screens/home/fashion/women/womenfashion.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:delilo/screens/home/orders.dart';
import 'package:delilo/screens/home/paymentpage.dart';
import 'package:delilo/screens/home/productdetailspage.dart';
import 'package:delilo/screens/seller/authenticate/registration/bank_details.dart';
import 'package:delilo/screens/seller/authenticate/registration/business_details.dart';
import 'package:delilo/screens/seller/authenticate/registration/email_verification.dart';
import 'package:delilo/screens/seller/authenticate/registration/signature.dart';
import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:delilo/screens/seller/authenticate/sellersignin.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
import 'package:delilo/screens/seller/home/orderpage.dart';
import 'package:delilo/screens/seller/home/payin.dart';
import 'package:delilo/screens/seller/home/sellercatgorylisting.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:delilo/screens/seller/home/sellerprofile.dart';
import 'package:flutter/material.dart';

class NavigationHelper{

  static Route<dynamic> onGenerateroutes(RouteSettings settings){
    final args = settings.arguments;
    
    switch(settings.name)
    {
      case '/usersignin':return MaterialPageRoute(builder: (_) => AuthenticateScreen());
      case '/getlocation':return MaterialPageRoute(builder: (_) => GetLocationPage());
      case '/signin':return MaterialPageRoute(builder: (_) => SigninPage());
      case '/siginphone':return MaterialPageRoute(builder: (_) => SigninPhonePage());
      case '/homescreen':return MaterialPageRoute(builder: (_) => HomePageScreen());
      case '/fashionmain':return MaterialPageRoute(builder: (_) => FashionMainPage());
      case '/womenfashion':return MaterialPageRoute(builder: (_) => WomenFashionScreen());
      case '/womenfashiondetail':return MaterialPageRoute(builder: (_)=>WomenFashionScreen());
      case '/mensfashion':return MaterialPageRoute(builder: (_) => MensFashionScreen());
      case '/kidsfashion':return MaterialPageRoute(builder: (_) => KidsFashionScreen());
      case '/productsdetail':return MaterialPageRoute(builder: (_) => ProductDetailPage(args));
      case '/cart':return MaterialPageRoute(builder: (_) => CartPage());
      case '/payment':return MaterialPageRoute(builder: (_)=>PaymentPage());
      case '/adressconfirm':return MaterialPageRoute(builder: (_) => AdressPage());
      case '/orderdone':return MaterialPageRoute(builder: (_)=>OrderPlaced());
      case '/orders':return MaterialPageRoute(builder: (_) => OrdersPage());
      case '/accountinfo':return MaterialPageRoute(builder: (_) => AccountInfo());
      case '/coupns': return MaterialPageRoute(builder: (_) => Coupons());
      case '/customersupport': return MaterialPageRoute(builder: (_) => CustomerSupport());
      case '/menfashioncategory': return MaterialPageRoute(builder: (_) => MenFashionCategory(args));
      case '/womenfashioncategory':return MaterialPageRoute(builder: (_) => WomenFashionCategory(args));
      case '/kidsfashioncategory' : return MaterialPageRoute(builder: (_) => KidsFashionCategory(args));
      case '/rateus' : return MaterialPageRoute(builder: (_) => RateUs());



      /* seller screens*/
      case '/sellerlogin':return MaterialPageRoute(builder: (_) => SellerSigninScreen());
      case '/sellersignup':return MaterialPageRoute(builder: (_) => SellerRegisterScreen());
      case '/getbusinessdetails':return MaterialPageRoute(builder: (_) => BusinessDetails());
      case '/getbankdetails':return MaterialPageRoute(builder: (_) => BankDetails());
      case '/getsign':return MaterialPageRoute(builder: (_) => Signature());
      case '/verificationpage':return MaterialPageRoute(builder: (_) => EmailVerification());
      case '/sellerhome':return MaterialPageRoute(builder: (_) => SellerHomeScreen());
      case '/categorylisting':return MaterialPageRoute(builder: (_)=>SellerCategoryListing());
      case '/addproductpage':return MaterialPageRoute(builder: (_)=>NewProductPage());
      case '/outofstock':return MaterialPageRoute(builder: (_)=>OutOfStock());
      case '/orderslist':return MaterialPageRoute(builder: (_)=>SellerOrdersPage());
      case '/payin':return MaterialPageRoute(builder: (_)=>PayinPage());
      case '/sellerprofile':return MaterialPageRoute(builder: (_)=>SellerProfile());



      default:
        return null;











    //case '/login':return MaterialPageRoute(builder: (_)=>AuthScreen());


    }
  }
}