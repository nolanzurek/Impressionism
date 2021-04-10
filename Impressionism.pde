PImage photo;
final int TRANSLATIONAL_DISPERSION = 2;
final int SIZE_MEAN = 3;
final int SIZE_STANDARD_DERIVATION = 3;
final int PIXEL_SKIP = 4;
final int[] ALPHA_RANGE = {0, 255};

void setup() {
  size(1920, 1080);
  //must be located in the sketch folder
  //supported: .jpg, .png, .tiff
  photo = loadImage("fileNameHere.extention");
  photo.resize(width, 0);
  background(0xFFFFFF);
}

void draw() {
  
  for(int i = 0; i < width; i += PIXEL_SKIP) {
  
    for(int j = 0; j < height; j += PIXEL_SKIP) {
      
      float size = randomGaussian()*SIZE_STANDARD_DERIVATION + SIZE_MEAN;
    
      noStroke();
      fill(photo.pixels[i + photo.width*j], map(randomGaussian(), -1, 1, ALPHA_RANGE[0], ALPHA_RANGE[1]));
      ellipse(i + randomGaussian()*TRANSLATIONAL_DISPERSION, j + randomGaussian()*TRANSLATIONAL_DISPERSION, size, size);
      
    }
    
  }
  
  //for saving a frame
  //saveFrame("output/frame " + frameCount + ".png");
  
}
