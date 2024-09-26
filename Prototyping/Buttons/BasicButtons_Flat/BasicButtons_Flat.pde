import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight;
float stopX, stopY, stopWidth, stopHeight;
//
void setup()
{
  size(300, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonWidth = appWidth*1/2;
  musicButtonHeight = appHeight*1/2;
  musicButtonX = musicButtonWidth - musicButtonWidth*1/2;
  musicButtonY = musicButtonHeight - musicButtonHeight*1/2;
  if ( musicButtonWidth >= musicButtonHeight ) { //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonWidth = musicButtonHeight;
  } else {
    // musicButtonHeight needs to change
    musicButtonHeight = musicButtonWidth;
  }
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  float padding = 1.0/4.0;
  float stopButtonSize = 1.0-(1.0/4.0);
  stopWidth = musicButtonWidth*stopButtonSize; //stopButtonSize
  stopHeight = musicButtonHeight*stopButtonSize; //stopButtonSize
  stopX = musicButtonX+padding;
  stopY = musicButtonY+padding;
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String beatYourCompetition = "Beat_Your_Competition";
  String cycles = "Cycles";
  String eureka = "Eureka";
  String ghostWalk = "Ghost_Walk";
  String groove = "groove";
  String newsroom = "Newsroom";
  String startYourEngines = "Start_Your_Engines";
  String theSimplest = "The_Simplest";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = directory + groove + mp3FileName;
  song[currentSong] = minim.loadFile( file );
  file = directory + startYourEngines + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + beatYourCompetition + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + cycles + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + eureka + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + ghostWalk + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + newsroom + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + theSimplest + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  rect( musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight );
} //End setup
//
void draw() {
  background(200); // Gray Scale: 0-255
  rect( musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight );
  //fill();
  rect( stopX, stopY, stopWidth, stopHeight );
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
