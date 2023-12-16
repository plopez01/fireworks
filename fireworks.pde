import java.lang.reflect.Array;

RenderableSystem<Firework> fireworks = new RenderableSystem<>(Firework.class, 50);

RenderableSystem<Explosion> explosions = new RenderableSystem<>(Explosion.class, 10);

PostProcessing post = new PostProcessing(2);

void setup(){
  fullScreen();
  background(0);
}

void draw(){
  background(0);
  fill(150);
  text(round(frameRate), 0, 10);
  
  fireworks.render();
  post.render();
}
