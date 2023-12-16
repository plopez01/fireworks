void mousePressed(){
  fireworks.add(new Firework(new PVector(mouseX, height), 0.8, 1000, 500, color(random(255), random(255), random(255))));
}
