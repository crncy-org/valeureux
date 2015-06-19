# valeureux
app for Valeureux local currency


## What is the Valeureux app for?
The Valeureux is a local complementary currency used in Liège (Belgium). The aim of the app is to provide a payment platform for the local currency. This will enable all the users of the currency to: 
- subscribe to the app, 
- top up some money (by wiring Euros into a given bankaccount), 
- check her/his account balance,
- wire Valeureux local currency into another user's bank account, 
- request a payment from another user (either via a QR code system or via a request that the user can send to a specific user),
- update her/his profile.

There are 3 user types:
- citizens,
- shop owners,
- administrators

In a later stage, this application should be available as a platform. Any local complementary currency willing to deploy an electronic version of their currency should be able to do so in a few clicks via www.crncy.org.

## Beta version

It's beta version is deployed onto Heroku at: valeureux.herokuapp.com.
Anyone can try the app with the following credentials:
- citizen: 
	user: ruben@ruben.com 
	pw: 12345678
- shop owner: 
	user: info@letempsdescfraises.be
	pw: 12345678

## About the technology

The Valeureux is a Ruby on Rails app. The following gems have been used:
Twilio for incoming and outgoing sms notifications
Puma for deployment
geocoder for using the Google api
devise for authentication
figaro for private key handling (AWS, Twilio, ...)
rqrcode for QR code generation
activeadmin for active-admin panel
paperclip and aws-sdk or image uploading

## List of functionalities

- subscribe to the app, 
- top up some money (by wiring Euros into a given bankaccount), 
- check her/his account balance,
- wire Valeureux local currency into another user's bank account, 
- request a payment from another user (either via a QR code system or via a request that the user can send to a specific user),
- update her/his profile.

## Roadmap

1) make sure the app can work in production
* fix bugs in existing functionalities
* add additional simple features (only very few for the app to be fully functional)
* add more admin features (monitoring)
* add security features
* make app configurable

2) make it a platform: make it possible for any local currency to create en electronic payment solution for their local currency

3) integrate with regular banks for top-ups (via APIs)
