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
