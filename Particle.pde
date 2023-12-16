abstract class Particle implements Renderable {
  PVector pos;
  PVector vel;
  PVector acel;
  float size;
  int lifetime;
  color c;
  
  int deathTime;
  
  Particle(PVector pos, PVector vel, PVector acel, float size, int lifetime, color c){
    this.pos = pos;
    this.vel = vel;
    this.acel = acel;
    this.size = size;
    this.lifetime = lifetime;
    deathTime = millis() + lifetime; //<>//
    this.c = c; //<>//
  }
  
  boolean render(){
    // If particle is dead don't render it
    if (millis() > deathTime) return false;
    
    pos = pos.add(vel);
    vel = vel.add(acel);
    
    vel = vel.div(1.05);
    
    fill(c);
    return true;
  }
}
