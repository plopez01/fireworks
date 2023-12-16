class SquareParticle extends Particle {
  
  SquareParticle(PVector pos, PVector vel, PVector acel, int size, int lifetime, color c){
    super(pos, vel, acel, size, lifetime, c);
  }
  
  @Override
  boolean render(){
    if (super.render()) {
      noStroke();
      square(pos.x, pos.y, size);
      return true;
    }
    return false;
  }
}
