class PostProcessing implements Renderable {
  float flashRecovery;
  float flash = 0;
  color flashColor = color(255);
  
  PostProcessing(float flashRecovery) {
    this.flashRecovery = flashRecovery;
  }
  
  void flash(float intensity, color c){
    flash = intensity;
    if (flash > 255) flash = 255;
    
    flashColor = c;
  }
  
  boolean render(){
    flash -= flashRecovery;
    if (flash < 0) flash = 0;
    
    fill(flashColor, flash);
    rectMode(CORNER);
    rect(0, 0, width, height); //<>//
    return true;
  }
  
}
