int numRows = 8;
int numCols = 8;
int teamSize = 50;
int total;
PImage f1, f2, f3, f4, f5;
String[] win = {"Chiefs","Chiefs","Chiefs","Chiefs", "Eagles"};
String winReport;

void setup() {
  size(600,600);
  noLoop();
  
  f1 = loadImage("1.png");
  f2 = loadImage("2.png");
  f3 = loadImage("3.png");
  f4 = loadImage("4.png");
  f5 = loadImage("5.png");
  
  if (f1 == null) println("Error loading 1.png");
  if (f2 == null) println("Error loading 2.png");
  if (f3 == null) println("Error loading 3.png");
  if (f4 == null) println("Error loading 4.png");
  if (f5 == null) println("Error loading 5.png");
}

  void draw() {
    background(108, 142, 104);
    total = 0;
    winReport = "";
    
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        Team team = new Team(j * teamSize + 100, i * teamSize + 100);
        team.roll();
        team.show();
        total += team.getValue();
     }
   }
   
   fill(255);
   textSize(24);
   
   if (total <180) {
     winReport = win [0];
   } else if (total <= 190) {
     winReport = win [1];
   } else if (total <= 200) {
     winReport = win [2];
   } else if (total <= 210) {
     winReport = win [3];
   } else {
     winReport = win [4];
   }
   
   text("The team winning the Superbowl is: " + winReport, 100, 60);
 }
     void mousePressed() {
       redraw();
   }
   
   class Team {
     int x, y, value;
     
     Team(int x, int y) {
       this.x = x;
       this.y = y;
     }
     
     void roll() {
       value = (int) (Math.random() * 5) +1;
     }
     
     void show() {
       PImage img = null;
       if (value == 1) img = f1;
       else if (value == 2) img = f2;
       else if (value == 3) img = f3;
       else if (value == 4) img = f4;
       else if (value == 5) img = f5;
       
       if (img != null) {
         image(img, x, y, teamSize, teamSize);
       }
     }
     
     int getValue() {
       return value;
     }
   }
          
