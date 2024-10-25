import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;
float playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y;
//
color black=#1C1C1C, red=#FF5733, yellow=#FFC300, blue=#3498DB, green=#2ECC71;
color dayForeground=green, dayHoverover=red, dayBackground=yellow;
color darkForeground=black, darkHoverover=green, darkBackground=red;
color nightForeground=yellow, nightHoverover=blue, nightBackground=black;
color appColorForeground=red, appColorHoverover=blue, appColorBackground=green;
color stopButtonHoverOver=blue;
//
Boolean colorDarkMode=true; //Preference: true or false //Future: Build Button for Dark Mode Preference
//
void setup()
{
  size(1000, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height- musicButtonDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //Work out a case Study: shorter  side of DIV
  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
  }
  //See Case Studies and paper folding
  stopWidth = musicButtonSquareWidth*1/2;
  stopHeight = musicButtonSquareHeight*1/2;
  stopX = musicButtonSquareX + musicButtonSquareWidth*1/4;
  stopY = musicButtonSquareY + musicButtonSquareHeight*1/4;
  playButton1X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton1Y  = musicButtonSquareY + musicButtonSquareHeight*1/4;
  playButton2X = musicButtonSquareX + musicButtonSquareWidth*3/4;
  playButton2Y = musicButtonSquareY + musicButtonSquareHeight*1/2;
  playButton3X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton3Y = musicButtonSquareY + musicButtonSquareHeight*3/4;
  //playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String mangos = "mangos";
  String eureka = "Eureka";
  String cycles = "Cycles";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file;
  file = directory + mangos + mp3FileName;
  println(currentSong, file);
  song[currentSong] = minim.loadFile( file );
  file = directory + eureka + mp3FileName;
  println(currentSong, file);
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + cycles + mp3FileName;
  println(currentSong, file);
  song[currentSong+=1] = minim.loadFile( file );
  //
  //song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  //rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
  //
  println(colorDarkMode);
  if ( colorDarkMode==false && ( hour()<=7 || hour()>=17 ) ) { //Testing: change 5PM to earlier time, shortcut colorNightMode==true
    //Night
    appColorForeground = nightForeground;
    appColorHoverover = nightHoverover;
    appColorBackground = nightBackground;
    println("here1");
  } else if ( colorDarkMode==false && ( hour()>7 || hour()<17 ) ) {
    //Day
    appColorForeground = dayForeground;
    appColorHoverover = dayHoverover;
    appColorBackground = dayBackground;
    println("here2");
  } else {
    //Dark Mode
    appColorForeground = darkForeground;
    appColorHoverover = darkHoverover;
    appColorBackground = darkBackground;
    println("here3");
  }
  //
} //End setup
//
void draw() {
  background(appColorBackground); //Gray Scale: 0-255, full BLUE Colour
  //
  //fill() is default
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  //
  /* Note: 3 types of colour, in pairs for hoverover
   - Day, Foreground: #DB05FF | Hoverover: #037EFF | Background: #FFFFFF
   - Dark, Foreground: #DB05FF | Hoverover: #E9FF00 | Background: #000000
   - Night, no blue, Foreground: #00FF00 | Hoverover: #E9FF00 | Background: #000000
   - Dark Mode is for all the time, how bright the screen is and eye strain
   - API: when does sunrise, when does sunset, is the system time within those hours
   - Night mode is for all the time or just
   - Note: preferences are hardcoded here but can be choices in CS20
   */
  //if ( day ) {} else if ( dark ) {} else {}
  //
  //Hoverover IF - Used in all other buttons too
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopButtonHoverOver = appColorHoverover; // See SetUp: Single Line IFs for Day, Dark, and Night Booleans
  } else {
    stopButtonHoverOver = appColorForeground; // See SetUp: Single Line IFs for Day, Dark, and Night Booleans
  }
  fill(stopButtonHoverOver);
  noStroke(); //Colour
  //
  triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  fill(255); //noFill(); //White in Gray Scale
  stroke(1); //Reset default
  //
  //Music Buttons Interactions: cascading IFs can become AND Statements
  //Note: keypressed must have click on screen
  //
} //End draw
//
void mousePressed() {
  //Boolean for Click
  //if() {} else {}
  //
  /* STOP Button Mouse Press, after Hoverover
   Must have Hoverover to ensure mouse will activate, visual confirmation of algorithm
   */
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    song[currentSong].loop(0); //Simple Play, double tap possible
  }
  //
} //End mousePressed
//
void keyPressed() {
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
  //
  //if ( key=='P' || key=='p' ) song[currentSong].loop(0); //Simple Play, double tap possible
  /* Note: double tap is automatic rewind, no pause
   Symbol is two triangles
   This changes what the button might become after it is pressed
   */
  //if ( key=='S' || key=='s' ) song[currentSong].pause(); //Simple Stop, no double taps
  //
  if ( key=='S' | key=='s' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause(); //single tap
    } else {
      song[currentSong].rewind(); //double tap
    }
  }
  if ( key=='L' || key=='l' ) song[currentSong].loop(1); // Loop ONCE: Plays, then plays again, then stops & rewinds
  if ( key=='K' || key=='k' ) song[currentSong].loop(); // Loop Infinitely //Parameter: BLANK or -1
  if ( key=='F' || key=='f' ) song[currentSong].skip( 10000 ); // Fast Forward, Rewind, & Play Again //Parameter: milliseconds
  if ( key=='R' || key=='r' ) song[currentSong].skip( -10000 ); // Fast Reverse & Play //Parameter: negative numbers
  if ( key=='M' || key=='m' ) { // MUTE
    //
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( song[currentSong].isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      song[currentSong].unmute();
    } else {
      //Possible ERROR: Might rewind the song
      song[currentSong].mute();
    }
  }
  if ( key=='O' || key=='o' ) { // Pause
    //
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else {
      song[currentSong].play();
    }
  }
  if ( key==CODED || keyCode==ESC ) exit(); // QUIT //UP
  if ( key=='Q' || key=='q' ) exit(); // QUIT
  //
  //if ( key=='' || key=='' ) ; // NEXT //See .txt for starter hint
  //if ( key=='' || key=='' ) ; // Previous //Students to finish
  //
  //if ( key=='' || key=='' ) ; // Shuffle - PLAY (Random)
  //if ( key=='' || key=='' ) ; // Play-Pause-STOP
} //End keyPressed
//
// End Main Program
