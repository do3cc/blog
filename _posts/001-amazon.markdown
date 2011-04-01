---
categories: python
tags: Amazon
date: 2007/09/19 10:10:10
title: How to merge wishlists from amazon.de and amazon.com
---
Or in german for googlers: Wie man Wunschlisten von Amazon.de und Amazon.com zusammenführen kann.

Maybe you also had this problem:
You browse through some blogs and see a book review of a book that you like. It has an amazon link, that you click on. Now you don't want to buy this book now, but you might want to add it to your wishlist. That is easy to do, and after a while you have a nice set of books you want to read.

Fast forwart, birthday/christmas time. You would like to tell your friends/family about the books you want, and you look into your wishlist in your country and see that not all books are there.

Merging them completely by hand is very cumbersome. Here helps the amazon api.
For this you need pyamazon, your own amazon api key and the wishlist id. The wishlist id was tricky. It strangely is not in the url when you go on your wishlist, but when you visit one of your wishlist items. Then the url contains a "colid" parameter those value you use.

This script shown below will look into your amazon.com wishlist, and opens a window for each book you have there on the german site. You don't need to save this script to a file, just paste it into an interactive python window:

$$code(lang=python)
key="get yours at amazon"
wishlist="find yours on amazon.com"

import amazon
import webbrowser
amazon.setLicense(key)
page = 1
isbnlist = set()
numberOfBooks = len(isbnlist)
while True:
  books = amazon.searchByWishlist(wishlist, page = page)
  page += 1
  for book in books:
    isbnlist.add(book.Isbn)
  if numberOfBooks == len(isbnlist):
    break
  numberOfBooks = len(isbnlist)

for isbn in isbnlist:
  webbrowser.open("http://www.amazon.de/dp/" + isbn)
$$/code

Now you can add each book to your german wishlist, and close the window. Still some manual action, but much faster than before.
