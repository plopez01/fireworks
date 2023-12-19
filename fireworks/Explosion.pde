class Explosion implements Renderable {
  PVector pos;
  int duration, explosionSize, particlesAmount, particlesRange;
  
  long explosionEnd;
  
  color c;
  
  boolean exploded = false;
  
  RenderableSystem<Particle> particles;
  
  Explosion(int duration, int explosionSize, int particlesAmount, int particlesRange, color c){
    this.duration = duration;
    this.explosionSize = explosionSize;
    this.particlesAmount = particlesAmount;
    this.particlesRange = particlesRange;
    this.c = c;
    
    particles = new RenderableSystem<>(Particle.class, particlesAmount);
  }
  
  void explode(PVector pos){
    this.pos = pos.copy();
    for (int i = 0; i < particlesAmount; i++) {
      PVector particleDir = PVector.random2D();
      particleDir.setMag(random(particlesRange));
      
      particles.add(new FadingParticle(pos.copy(),
                    particleDir, 
                    new PVector(0, 0.03),
                    2, 
                    2000,
                    c,
                    0.5));
    }
    exploded = true;
    explosionEnd = millis() + duration;
  }
  
  boolean render(){
    float life = (float)(explosionEnd - millis())/duration;
    
    particles.render();
    
    noStroke();
    fill(255, map(life, 0.5, 0, 255, 0));
    circle(pos.x, pos.y, map(life, 1, 0.5, explosionSize, 0));
    
    return true;
  }
}
