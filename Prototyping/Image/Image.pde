PImage img1, img2;

void setup() {
  // Load both images
  img1 = loadImage("Kylian.jpg");  // Replace with your first image path
  img2 = loadImage("Cat03.jpg");  // Replace with your second image path
  
  size(800, 600);  // Set canvas size
}

void draw() {
  background(255);  // Clear the background with a white color
  
  // Draw the first image
  image(img1, 0, 0);
  
  // Draw the second image on top of the first image
  image(img2, 100, 100);  // Adjust the position as needed
}
