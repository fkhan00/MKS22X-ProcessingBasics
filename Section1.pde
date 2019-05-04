int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer board;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    fill(255);
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.
    for(int i = 0; i < values.length; i++){
      if(values[i] < 0){
        fill(255, 0, 0);
        rect(x, 100, 200 / values.length, -1 * values[i]);
        x += 200 / values.length;
      }
       else{
         fill(0, 255, 0);
         rect(x, 100, 200 / values.length,  -1 * values[i]);
         x += 200/ values.length;
       }
    }
  }
    void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      if(values[i] > MAX_VALUE || values[i] < MIN_VALUE){
        speeds[i] *= -1;
      }
    }
  }
}

void setup(){
  background(255);
  size(600,500);
  board = new Visualizer(0.0, 0.0);
}
  void draw()
  {
    board = new Visualizer(0.0, 0.0);
    board.display();
    board.update();
  }
