/* Static Text
 - Testing for Aspect Ratio
 - Introduce single and multiple executed code
 - Activity: Create another rectangle with text in it
 - Copy and paste to dynamic program
 */

// Global Variables
int appWidth, appHeight;
float titleX, titleY, titleWidth, titleHeight;
float textX, textY, textWidth, textHeight;
float footerX, footerY, footerWidth, footerHeight;
PFont titleFont, footerFont, phraseFont;
color ink, Blue = #00BFFF, Black = #000000, White = #FFFFFF, resetDefaultInk = White; // Not Night Mode Friendly
int size;
String title = "idk", footer = "idk", phrase = "idk";
Boolean randomColour = false;

// Display
void setup() {
  size(500, 700); // Portrait CANVAS
  appWidth = width;
  appHeight = height;

  // Text: Single Executed Code
  titleFont = createFont("Comic Sans MS", 55); // Verify the font exists in Processing.Java
  footerFont = createFont("Arial", 55);
  phraseFont = createFont("Times New Roman", 55);

  /* Population
   - using 10's
   - Could be 100's or percent
   - Able to use decimals to dial in the values
  */
  titleX = appWidth * 1 / 10;
  titleY = appHeight * 1 / 10;
  titleWidth = appWidth * 8 / 10;
  titleHeight = appHeight * 1 / 10;
  textX = titleX; // Best Practice: change on formula
  textY = appHeight * 4.5 / 10; // Ratio done last. How is this Centered Vertically?
  textWidth = titleWidth; // Best Practice
  textHeight = titleHeight; // Best Practice
  footerX = titleX; // Best Practice
  footerY = appHeight * 8 / 10;
  footerWidth = titleWidth; // Best Practice
  footerHeight = titleHeight; // Best Practice
  
  // DIVs
  fill(Blue);
  rect(titleX, titleY, titleWidth, titleHeight); // Title Background
  rect(textX, textY, textWidth, textHeight); // Phrase Background
  rect(footerX, footerY, footerWidth, footerHeight); // Footer Background
}

// Drawing Text
void draw() {
  fill(Blue); // Background color
  textAlign(CENTER, CENTER); // Align X&Y

  ink = color(random(0, 256), random(256), random(256)); // Random color for title text
  fill(ink);
  size = 45; // Adjust size to fit
  textFont(titleFont, size);
  text(title, titleX, titleY, titleWidth, titleHeight);

  ink = color(random(0, 256), random(256), random(256)); // Random color for footer text
  fill(ink);
  size = 75; // Adjust size to fit
  textFont(footerFont, size);
  text(footer, footerX, footerY, footerWidth, footerHeight);

  ink = color(random(0, 256), random(256), random(256)); // Random color for phrase text
  fill(ink);
  size = 65; // Adjust size to fit
  textFont(phraseFont, size);
  text(phrase, textX, textY, textWidth, textHeight);
}
