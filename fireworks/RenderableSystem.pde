class RenderableSystem<T extends Renderable> implements Renderable {
  int SYSTEM_SIZE;
  T[] elements;
  
  int elementCount = 0;
  
  RenderableSystem(Class<T> c, int renderableLimit){
    SYSTEM_SIZE = renderableLimit;
    elements = (T[]) Array.newInstance(c, renderableLimit);
  }
  
  void add(T element){
    if (elementCount >= SYSTEM_SIZE) elementCount = 0;
    elements[elementCount++] = element;
  }
  
  boolean render(){
    for (T element : elements) {
      if (element == null) continue;
      element.render();
    }
    return true;
  }

}
