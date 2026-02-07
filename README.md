# Napredno softversko inzenjerstvo
# Aplikacija za pracenje budzeta projektovana koriscenjem cross-platform framework-a Flutter

# Uvod

Savremeni razvoj softvera, narocito u domenu mobilnih aplikacija, zahteva alate i arhitekture koje omogucavaju brzu isporuku, lako odrzavanje i dugorocnu skalabilnost. Sve cesce se javlja potreba za razvojem aplikacija koje su dostupne na razlicitim platforma uz minimalne razlike u korisnickom iskustvu. Cilj ovog projekta je da prikaze rad FLutter-a u kombinaciji sa BLoC arhitekturom i time pokaze organizaciju koda i upravljanje stanjem aplikacije.

# Problem koji tehnologija resava

Kod tradicionalnog razvoja mobilnih aplikacija cesto se javljaju sledeci problemi:
- potreba za razvojem i odrzavanjem vise codebase-ova (Android, iOS),
- mesanje korisnickog interfejsa i business logike
- teskoce u pracenju i kontroli stanja aplikacije
- otezano testiranje i prosirivanje funkcionalnosti

U aplikacijama koje koriste asinhrone izvore podataka (REST API, fajlovi iz lokalne memorije itd) ovi problemi postaju izrazeniji. Flutter i BLoC resavaju ove probleme kroz cist arhitektonski pristup i  centralizovano upravljanje stanjem.

# Flutter

FLutter je open-source framework koji je razvio Google, namenjen razvoju cross-platform aplikacija uz jedinstven codebase. Aplikacije se pisu u programskom jeziku Dart i kompajliraju direktno u native kod, cime se postizu visoke performanse. Pri izradi korisnickog interfejsa, Flutter koristi deklarativni pristup, u smislu da se UI opisuje kao hijerarhija komponenti, koje se u kontekstu Fluttera zovu widgets.

Alternativne mogucnosti: React Native, Xamarin.

# BLoC arhitektura (Business Logic Component)
