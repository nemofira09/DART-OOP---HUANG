import 'models/Card.dart';
import 'models/Contact.dart';

void main() {
  List<Card> holder = <Card>[];
  //Diamonds
  holder.add(Card("Ace of Diamonds", "Diamonds"));
  holder.add(Card("Two of Diamonds", "Diamonds"));
  holder.add(Card("Three of Diamonds", "Diamonds"));
  holder.add(Card("Four of Diamonds", "Diamonds"));
  holder.add(Card("Five of Diamonds", "Diamonds"));
  holder.add(Card("Six of Diamonds", "Diamonds"));
  holder.add(Card("Seven of Diamonds", "Diamonds"));
  holder.add(Card("Eight of Diamonds", "Diamonds"));
  holder.add(Card("Ten of Diamonds", "Diamonds"));
  holder.add(Card("Jack of Diamonds", "Diamonds"));
  holder.add(Card("King of Diamonds", "Diamonds"));
  holder.add(Card("Queen of Diamonds", "Diamonds"));
  //Hearts
  holder.add(Card("Ace of Hearts", "Hearts"));
  holder.add(Card("Two of Hearts", "Hearts"));
  holder.add(Card("Three of Hearts", "Hearts"));
  holder.add(Card("Four of Hearts", "Hearts"));
  holder.add(Card("Five of Hearts", "Hearts"));
  holder.add(Card("Six of Hearts", "Hearts"));
  holder.add(Card("Seven of Hearts", "Hearts"));
  holder.add(Card("Eight of Hearts", "Hearts"));
  holder.add(Card("Ten of Hearts", "Hearts"));
  holder.add(Card("Jack of Hearts", "Hearts"));
  holder.add(Card("King of Hearts", "Hearts"));
  holder.add(Card("Queen of Hearts", "Hearts"));
  //Clubs
  holder.add(Card("Ace of Clubs", "Clubs"));
  holder.add(Card("Two of Clubs", "Clubs"));
  holder.add(Card("Three of Clubs", "Clubs"));
  holder.add(Card("Four of Clubs", "Clubs"));
  holder.add(Card("Five of Clubs", "Clubs"));
  holder.add(Card("Six of Clubs", "Clubs"));
  holder.add(Card("Seven of Clubs", "Clubs"));
  holder.add(Card("Eight of Clubs", "Clubs"));
  holder.add(Card("Ten of Clubs", "Clubs"));
  holder.add(Card("Jack of Clubs", "Clubs"));
  holder.add(Card("King of Clubs", "Clubs"));
  holder.add(Card("Queen of Clubs", "Clubs"));
  //Spades
  holder.add(Card("Ace of Spades", "Spades"));
  holder.add(Card("Two of Spades", "Spades"));
  holder.add(Card("Three of Spades", "Spades"));
  holder.add(Card("Four of Spades", "Spades"));
  holder.add(Card("Five of Spades", "Spades"));
  holder.add(Card("Six of Spades", "Spades"));
  holder.add(Card("Seven of Spades", "Spades"));
  holder.add(Card("Eight of Spades", "Spades"));
  holder.add(Card("Ten of Spades", "Spades"));
  holder.add(Card("Jack of Spades", "Spades"));
  holder.add(Card("King of Spades", "Spades"));
  holder.add(Card("Queen of Spades", "Spades"));
  
  print("================1.) DECK OF CARDS================");
  CardDeck cd = CardDeck(holder);
  //Print Cards
  cd.printCards(cd._DeckOfCards);
  //Shuffle and make new 5 playing deck
  holder = cd.MakeADeck();
  print("\nCards With Suit: Finding Cards on the current playind deck with Spades Suit\n");
  //Finding Spades Suit within playing deck
  holder = cd.CardsWithSuit(holder, "Spades");

  print("================2.) PHONEBOOK================");
  List<Contact> holder2 = <Contact>[];
  //Populate the Phonebook with 5 contacts.
  holder2.add(Contact("Apple", "App", "ASDASD123", 13183510999));
  holder2.add(Contact("MANGO", "MAN", "ASDASD321", 13183510888));
  holder2.add(Contact("KIWI", "KIW", "ASDASD222", 13183510777));
  holder2.add(Contact("WATERMELON", "WAT", "ASDASD0", 13183510392));
  holder2.add(Contact("Papaya", "pap", "FD99ASDASD0", 13183510111));
  Contact temp = Contact("New", "Old", "Middle", 123);
  Phonebook pb = Phonebook(holder2);
  //Display the contacts.
  pb.displayAllContacts();
  //Add a contact.
  pb.AddContact(temp);
  //Display the contacts.
  pb.displayAllContacts();
  //Remove a contact.
  pb.DeleteContact(temp);
  //Display the contacts.
  pb.displayAllContacts();
  //Search and Display Searched Contact
  pb.SearchContact("Apple", "App");
}

class CardDeck {
  List<Card> _DeckOfCards;

  CardDeck(this._DeckOfCards);

  void printCards(List<Card> arg) {
  print("[");
  for (var Card in arg) {
    print("${Card.name}");
  }
  print("]");
  }

  void shuffleCards() {
    _DeckOfCards.shuffle();
  }

  List<Card> MakeADeck() {
    List<Card> newPlayingDeck = <Card>[];
    int x = 0;
    shuffleCards();
    print("Your New Playing Deck:\n");
    for(x = 0; x < 5; x++){
    print("${_DeckOfCards[x].name}");
    newPlayingDeck.add((_DeckOfCards[x]));
    }
    print("==================================");
    return newPlayingDeck;
  }

  List<Card> CardsWithSuit(List<Card> arg, String suit_arg) {
    List<Card> result = <Card>[];
    result = arg.where((x) => x.suit == suit_arg).toList();
    printCards(result);
    return result;
  }
}

class Phonebook {
  List<Contact> _ContactList;

  Phonebook(this._ContactList);

  void displayAllContacts() {
    for (var Contact in _ContactList) {
      print("--------------------------------------------------------");
      print("First Name: ${Contact.first_Name}");
      print("Last Name: ${Contact.last_Name}");
      print("Phone Number: ${Contact.phone_Number}");
      print("Address: ${Contact.address}");
    }
    print("--------------------------------------------------------\n\n");
  }

  void AddContact(Contact newContact){
    this._ContactList.add(newContact);
    print("\n*****New Contact Added!*****\n");
  }

  void DeleteContact(Contact ToBeRemoved) {
    _ContactList.removeWhere((x) => x.phone_Number == ToBeRemoved.phone_Number);
    print("\nSuccessfully Removed: ${ToBeRemoved.first_Name} ${ToBeRemoved.last_Name}\n");
  }

  void SearchContact(String fname, String lname) {
    Contact result = _ContactList.firstWhere((x) => x.first_Name == fname && x.last_Name == lname);
    if(result.first_Name.isEmpty){
      print("\nPhonebook entry not found!\n");
    }else{
      print("\nEntry Found! ${result.first_Name} ${result.last_Name}, ${result.phone_Number}, ${result.address}\n");
    }
  }
}