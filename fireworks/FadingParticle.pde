class FadingParticle extends SquareParticle {
  int initialSize;
  
  float fadingStart;
  
  
  FadingParticle(PVector pos, PVector vel, PVector acel, int size, int lifetime, color c, float fadingStart){
    super(pos, vel, acel, size, lifetime, c);
    initialSize = size;
    this.fadingStart = fadingStart;
  }
  
  @Override
  boolean render(){
    if (super.render()) {
      float lifePercentage = (float)(millis() - deathTime)/lifetime;
      if (lifePercentage <= fadingStart){
        size = map(lifePercentage, fadingStart, 0, initialSize, 0);
      }
      return true;
    }
    return false;
  }
}
