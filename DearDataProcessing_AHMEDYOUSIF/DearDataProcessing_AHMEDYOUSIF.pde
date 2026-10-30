// Dear Data - Cars I noticed around London
// Each line in data.csv is one car = one observation

String[] lines;

void setup() {
  size(800, 600);

  // Each line of the CSV goes into the array as a String
  // lines[0] is the header row, so the cars start at lines[1]
  lines = loadStrings("data.csv");

  // Minus 1 because the header isn't a car
  println("Cars loaded: " + (lines.length - 1));
  println("Black cars: " + countColour("Black"));
}

void draw() {
  background(20);
  noStroke();

  for (int i = 1; i < lines.length; i++) {
    String[] parts = split(lines[i], ',');

    // Time is like "17:42", so split at ':' and keep the hour
    String[] timeParts = split(parts[1], ':');
    int hour = int(timeParts[0]);

    // map() scales the hour (0 to 24) to a spot across the window
    float x = map(hour, 0, 24, 50, width - 50);

    // Each car gets its own row, top to bottom
    float y = map(i, 1, lines.length - 1, 50, height - 50);

    setCarColour(parts[3]);
    ellipse(x, y, 20, 20);
  }

  drawTitle();
  drawHourLabels();
}

void drawTitle() {
  fill(255);
  textAlign(LEFT);
  textSize(18);
  text("Cars I noticed - " + (lines.length - 1) + " cars", 20, 30);
}

// Puts a label every 3 hours along the bottom
// Uses the same map() as the circles so the labels line up with them
void drawHourLabels() {
  fill(180);
  textAlign(CENTER);
  textSize(12);

  for (int h = 0; h <= 24; h += 3) {
    float x = map(h, 0, 24, 50, width - 50);
    text(h + ":00", x, height - 15);
  }
}

// Method that returns a value: "int" is the type it gives back,
// "colour" is the parameter we pass in
int countColour(String colour) {
  int count = 0;

  // Start at 1 to skip the header
  for (int i = 1; i < lines.length; i++) {
    // Cut the line at each comma:
    // [0] date, [1] time, [2] make, [3] colour, [4] type, [5] location, [6] why
    String[] parts = split(lines[i], ',');

    // Strings are compared with .equals(), not ==
    if (parts[3].equals(colour)) {
      count++;
    }
  }

  return count;
}

// Picks a fill colour from the car's colour
// Anything not listed (like "Nardo Grey") just becomes grey
void setCarColour(String colour) {
  if (colour.equals("Black")) {
    fill(60);
  } else if (colour.equals("White")) {
    fill(255);
  } else if (colour.equals("Red")) {
    fill(220, 40, 40);
  } else if (colour.equals("Blue")) {
    fill(40, 90, 220);
  } else if (colour.equals("Green")) {
    fill(40, 170, 80);
  } else {
    fill(150);
  }
}
