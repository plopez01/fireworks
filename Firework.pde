class Firework implements Renderable {
  PVector pos;
  PVector vel;
  PVector acel;
  
  int duration;
  int explosionDelay;
  long lastTime;
  
  float speed;
  color c;
  
  RenderableSystem<Particle> particles = new RenderableSystem<>(Particle.class, 200);
  
  Explosion explosion;
  Firework(PVector pos, float speed, int duration, int explosionDelay, color c){
    this.pos = pos;
    this.vel = new PVector(0, 0);
    this.acel = new PVector(0, 0);
    
    this.speed = speed;
    
    this.duration = duration;
    this.explosionDelay = explosionDelay;
    this.lastTime = millis();
    this.c = c;
    
    explosion = new Explosion(100, 10, 100, 6, c);
  }
  
  boolean render(){
    pos = pos.add(vel);
    vel = vel.add(acel);
    vel = vel.div(2); // Drag
    
    long currentTime = millis();
    duration -= currentTime - lastTime;
    lastTime = currentTime;
    
    // Accelerating up
    if (duration > 0) {
      acel.y -= speed;
      acel = acel.rotate(random(-0.1, 0.1));
      // Sparkles
      particles.add(new SquareParticle(pos.copy(), new PVector(random(-0.5, 0.5), random(-0.5, 0.5)), new PVector(0, 0), 2, 100, color(255, 197, 3)));
      
      // Smoke
      particles.add(new FadingParticle(pos.copy(), new PVector(random(-0.5, 0.5), random(-0.5, 0.5)), new PVector(0, 0.01), 4, 5000, color(255, 10), 0.5));
    } else if (!explosion.exploded && duration < -explosionDelay){
      // Explode
      explosion.explode(pos);
      post.flash(100, c);
    }
    
    // Gravity
    acel.y += 0.5;
    
    rectMode(CENTER);
    particles.render();
    
    if (explosion.exploded){
      explosion.render();
    } else {
      fill(100);
      pushMatrix();
      rectMode(CENTER);
      translate(pos.x, pos.y);
      rotate(vel.heading() + HALF_PI);
      rect(0, 0, 5, 10);
      popMatrix();
    }
    
    return true;
  }
}
