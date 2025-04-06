ZyptoPulse | Flutter Crypto App

ZyptoPulse is a Flutter based crypto tracker app that provides cryptocurrency prices and allows users to login, signup and manage favorites, and interact with Directus securely using JWT tokens

# for login and signup

send POST request to /auth/login or /users with credentials to verify the user

Directus returns JWT access_token.

Store securely using flutter_secure_storage package

Authorization with Bearer<JWT_TOKEN>

Once the user logout then delete the token and now user is move to login screen again after successfully logout


# how fav are stored

making a post request using given api and bloc state management to add to fav. as per given headers and all

make a separate model of fav for better code maintainability and readability.


=> how to fetch fav
make a get api call to fetch the item and show on fav screen using bloc state management

=> how to delete fav
in fav model pass id and make a delete request to delete an item form fav with proper use of token


Technology used

1 Flutter

2 Directus as headless cms

3 CoinGecko api for fetch crypto data

4 flutter_secure_storage package to store jwt token securely

5 Bloc state management for handling the fetch the data and curd operation for fav(i.e. addToFav, removeFromFav),
this app also using Getx, Provider state management for better app performance
