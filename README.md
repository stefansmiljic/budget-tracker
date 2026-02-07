## Napredno softversko inzenjerstvo
# Aplikacija za pracenje budzeta projektovana koriscenjem cross-platform framework-a Flutter

## Uvod

Savremeni razvoj softvera, narocito u domenu mobilnih aplikacija, zahteva alate i arhitekture koje omogucavaju brzu isporuku, lako odrzavanje i dugorocnu skalabilnost. Sve cesce se javlja potreba za razvojem aplikacija koje su dostupne na razlicitim platforma uz minimalne razlike u korisnickom iskustvu. Cilj ovog projekta je da prikaze rad FLutter-a u kombinaciji sa BLoC arhitekturom i time pokaze organizaciju koda i upravljanje stanjem aplikacije.

## Problem koji tehnologija resava

Kod tradicionalnog razvoja mobilnih aplikacija cesto se javljaju sledeci problemi:
- potreba za razvojem i odrzavanjem vise codebase-ova (Android, iOS),
- mesanje korisnickog interfejsa i business logike
- teskoce u pracenju i kontroli stanja aplikacije
- otezano testiranje i prosirivanje funkcionalnosti

U aplikacijama koje koriste asinhrone izvore podataka (REST API, fajlovi iz lokalne memorije itd) ovi problemi postaju izrazeniji. Flutter i BLoC resavaju ove probleme kroz cist arhitektonski pristup i  centralizovano upravljanje stanjem.

## Flutter

FLutter je open-source framework koji je razvio Google, namenjen razvoju cross-platform aplikacija uz jedinstven codebase. Aplikacije se pisu u programskom jeziku Dart i kompajliraju direktno u native kod, cime se postizu visoke performanse. Pri izradi korisnickog interfejsa, Flutter koristi deklarativni pristup, u smislu da se UI opisuje kao hijerarhija komponenti, koje se u kontekstu Fluttera zovu widgets.

Alternativne mogucnosti: React Native, Xamarin.

## BLoC arhitektura (Business Logic Component)

BLoC je arhitektonski obrazac koji se koristi u Flutter aplikacijama radi jaskog razdvajanja poslovne logike od UI-ja. Ideja je da se UI ne menja direktno, vec salje *evente* ka BLoC-u, dok BLoC emituje *state* (stanje) koje UI posmatra.

Kljucni elementi BLoC-a su:
- Event - korisnicka ili sistemska akcija koja se desava
- State - trenutno stanje aplikacije
- Bloc - komponenta koja na osnovu event-ova menja state
- BlocProvider - omogucava pristup BLoC-u u widget stablu
- BlocBuilder - reaguje na promene stanja i gradi UI

### Event
Posebne klase koje predstavljaju sve moguce akcije 

<img width="404" height="351" alt="image" src="https://github.com/user-attachments/assets/99c457d1-3ce2-4961-ac4f-1181104c8e0f" />

Eventi su jednostavne klase koje ne sadrze bilo kakvu logiku, vec samo opisuju nameru

### State

State je stanje u kome se aplikacija trenutno nalazi, takodje se definise kao klasa

<img width="571" height="645" alt="image" src="https://github.com/user-attachments/assets/6158ecf7-fcaf-4624-ad83-c8dbbe0a841b" />

### Bloc

Bloc povezuje eventove i state-ove, na osnovu eventa emituje odgovarajuci state

<img width="473" height="365" alt="image" src="https://github.com/user-attachments/assets/9e8239f4-b210-43a5-a934-883f985d8964" />

### Tok podataka u BLoC arhitekturi
`UI -> Event -> BLoC -> State -> UI`
