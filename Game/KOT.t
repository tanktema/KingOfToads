#charset "us-ascii"

/*
 *   Copyright (c) 1999, 2002 by Michael J. Roberts.  Permission is
 *   granted to anyone to copy and use this file for any purpose.  
 *   
 *   This is a starter TADS 3 source file.  This is a complete TADS game
 *   that you can compile and run.
 *   
 *   To compile this game in TADS Workbench, open the "Build" menu and
 *   select "Compile for Debugging."  To run the game, after compiling it,
 *   open the "Debug" menu and select "Go."
 *   
 *   Please note that this file contains considerably more than the
 *   minimal set of definitions necessary to create a working game; this
 *   file has numerous examples meant to help you start making progress on
 *   your game more quickly, by giving you a few concrete examples that
 *   you can copy and modify.  As you flesh out your game, you should
 *   modify the objects we define here, or simply remove them when you no
 *   longer need them in your game.
 *   
 *   If you want a truly minimal set of definitions, create another new
 *   game in TADS Workbench, and choose the "advanced" version when asked
 *   for the type of starter game to create.  
 */

/* 
 *   Include the main header for the standard TADS 3 adventure library.
 *   Note that this does NOT include the entire source code for the
 *   library; this merely includes some definitions for our use here.  The
 *   main library must be "linked" into the finished program by including
 *   the file "adv3.tl" in the list of modules specified when compiling.
 *   In TADS Workbench, simply include adv3.tl in the "Source Files"
 *   section of the project.
 *   
 *   Also include the US English definitions, since this game is written
 *   in English.  
 */
#include <adv3.h>
#include <en_us.h>

/*
 *   Our game credits and version information.  This object isn't required
 *   by the system, but our GameInfo initialization above needs this for
 *   some of its information.
 *   
 *   IMPORTANT - You should customize some of the text below, as marked:
 *   the name of your game, your byline, and so on.  
 */
versionInfo: GameID
    IFID = '9f4fee23-6b5b-47cb-93e6-496e9d804e9d'
    name = 'King of Toard'
    byline = 'by Tanktema & Starpiece'
    htmlByline = 'by <a href="mailto:your-email@host.com">
                  Tanktema & Starpiece</a>'
    version = '1'
    authorEmail = 'Tanktema & Starpiece <your-email@host.com>'
    desc = 'Put a brief "blurb" about your game here'
    htmlDesc = 'Put a brief "blurb" about your game here'

    /* 
     *   other bibliographic tags you might want to set include:
     *
     *.    headline = 'An Interactive Sample'
     *.    seriesName = 'The Sample Trilogy'
     *.    seriesNumber = '1'
     *.    genreName = 'Sample Games'
     *.    forgivenessLevel = 'Polite'
     *.    gameUrl = 'http://mysite.com/mygame.htm'
     *.    firstPublished = '2006'
     *.    languageCode = 'en-US'
     *.    licenseType = 'Freeware'
     *.    copyingRules = 'Nominal cost only; compilations allowed'
     *.    presentationProfile = 'Default'
     */

    showCredit()
    {
        /* show our credits */
        "Put credits for the game here. ";

        /* 
         *   The game credits are displayed first, but the library will
         *   display additional credits for library modules.  It's a good
         *   idea to show a blank line after the game credits to separate
         *   them visually from the (usually one-liner) library credits
         *   that follow.  
         */
        "\b";
    }
    showAbout()
    {
        "Put information for players here.  Many authors like to mention
        any unusual commands here, along with background information on
        the game (for example, the author might mention that the game
        was created as an entry for a particular competition). ";
    }
;

/* 
 *   Entryway location.
 *   
 *   We use the class "Room" to define the location.  Room is a class,
 *   defined in the library, that can be used for most of the locations in
 *   the game.
 *   
 *   Our definition defines two strings.  The first string, which must be
 *   in single quotes, is the "name" of the room; the name is displayed on
 *   the status line and each time the player enters the room.  The second
 *   string, which must be in double quotes, is the "description" of the
 *   room, which is a full description of the room.  This is displayed
 *   when the player types "look around," when the player first enters the
 *   room, and any time the player enters the room when playing in VERBOSE
 *   mode.  
 */
entryway: Room 'Father\'s room'
    "You are standing inside a room, full of you elatives and friends. In front of you, on a bed, is your dying father - king Toadled IInd, the true king of The 
    Swamp Kingdom. Suddenly, he coughs and looks at you:
   \n\n - Come here, my son. I have something to tell you
    
    "

    /*
     *   In the description text above, we embedded the expression
     *   "describeAxe".  Whenever the description text is displayed, it
     *   will call evaluate that expression, which will in turn call this
     *   method, where we'll generate some additional text to describe the
     *   axe if it's still part of the suit of armor. 
     */
    
        

    /* 
     *   To the north is the hallway.  Set the "north" property to the
     *   destination room object.  Other direction properties that we
     *   could set: east, west, north, up, down, plus the diagonals:
     *   northeast, northwest, southeast, southwest.  We can also set "in"
     *   and "out", and the shipboard directions port, starboard, fore,
     *   and aft.  
     */
   

    /*
     *   To the south is the front door.  A travel direction link can
     *   point directly to another room, but it can also point to
     *   something like a door.  
     */
    south = outDoor
    left = yourRoom
    right = kitchenRoom
    
    +father
    

    /*
     *   The "out" direction is the same as south, since going south leads
     *   outside 
     */
    
;

father: Person 
    "Your father, and old toad who had to run away from the capital after his brother captured the throne."
    doCommand()
;

frontKey: Item 
    "This is a key to the front door"
    
    isHeld = nil
;

kingsNote: Item
    "The paper with king's mark stating that you are the true heir of the throne"
    isHeld = nil
;

outDoor: Door 'Exit' 
    "That is a door out of your house. The door is ";
    if(outDoor.isOpen)
        "open";
    else 
        "closed";
        
    
    initiallyOpen = nil
    
    dobjFor(Open)
    {
        action()
        { 
            if(frontkey.IsIn(self))
            {
                outDoor.makeOpen(true)
                "The door is opened. You are ready to adventure!"
            }
            
              
             else 
                "You don't have the key. Perhaps, you should ask someone for it?"
        }
    }
    
/*
 *   Define the front door.  The "+" sign in front of the definition means
 *   that the object is located within the most recently defined room,
 *   which in this case is 'entryway' as defined above.
 *   
 *   We start this object definition with two strings, both in single
 *   quotes, and a third in double quotes.  The first is the vocabulary
 *   list for the object, which tells us how the player can refer to this
 *   object.  The second string is the name, which is how the game refers
 *   to the object in generated messages.  The third is the full
 *   description of the object, which is displayed when the player
 *   examines this object.
 *   
 *   The vocabulary list consists of any number of words separated by
 *   spaces.  Every word is an adjective except the last, which is a noun.
 *   You can specify more than one noun by listing several nouns separated
 *   by slash characters ("/").  The player can use any of the words
 *   defined here to refer to the object - the player doesn't have to use
 *   all of the words, or use them in the same order that we define them
 *   here, except that adjectives and nouns must be in the grammatically
 *   correct order (in English, this means that adjectives must precede
 *   nouns).  
 */
;
+

/*
 *   The battle axe, initially posed with the suit of armor.  We make this
 *   a Thing, because we want it to be something the player can pick up
 *   and manipulate.
 *   
 *   This definition starts with two "+" signs, to indicate that it is
 *   initially inside the last object defined with one "+" sign, which is
 *   the suit of armor.
 *   
 *   Note that we define a bunch of vocabulary words that aren't really
 *   synonyms for "axe," but are for things we describe as parts of the
 *   axe (the blade, the dried blood on the blade).  Those parts aren't
 *   worth defining as separate objects, but we can at least recognize
 *   them as vocabulary words that simply refer to the axe itself.  
 */


    
/*
 *   Define the portraits.  We don't want to define several individual
 *   portraits, because they're not important enough, so define a single
 *   object that refers to the portraits collectively.
 *   
 *   Because the library normally allows the player to abbreviate any word
 *   to its first six or more letters, note that we don't have to provide
 *   separate vocabulary words for "portrait" and "portraits", or for
 *   "picture" and "pictures" - "portrait" is an acceptable abbreviation
 *   for "portraits".  
 */
/*
 *   The hallway, north of the entryway.  
 */

/*
 *   Define the player character.  The name of this object is not
 *   important, but note that it has to match up with the name we use in
 *   the main() routine to initialize the game, below.
 *   
 *   Note that we aren't required to define any vocabulary or description
 *   for this object, because the class Actor, defined in the library,
 *   automatically provides the appropriate definitions for an Actor when
 *   the Actor is serving as the player character.  Note also that we
 *   don't have to do anything special in this object definition to make
 *   the Actor the player character; any Actor can serve as the player
 *   character, and we'll establish this one as the PC in main(), below.  
 */
me: Actor
    /* the initial location is the entryway */
    location = entryway
;

/*
 *   The "gameMain" object lets us set the initial player character and
 *   control the game's startup procedure.  Every game must define this
 *   object.  For convenience, we inherit from the library's GameMainDef
 *   class, which defines suitable defaults for most of this object's
 *   required methods and properties.  
 */
gameMain: GameMainDef
    /* the initial player character is 'me' */
    initialPlayerChar = me

    /* 
     *   Show our introductory message.  This is displayed just before the
     *   game starts.  Most games will want to show a prologue here,
     *   setting up the situation for the player, and show the title of the
     *   game.  
     */
    showIntro()
    {
        "Welcome to the TADS 3 Starter Game!\b";
    }

    /* 
     *   Show the "goodbye" message.  This is displayed on our way out,
     *   after the user quits the game.  You don't have to display anything
     *   here, but many games display something here to acknowledge that
     *   the player is ending the session.  
     */
    showGoodbye()
    {
        "<.p>Thanks for playing!\b";
    }
;
