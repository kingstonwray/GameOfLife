public class IntObj {
  private int value;

  public IntObj() {
    value = 0;
  }
  public void setValue(int v_) {
    int value = v_;
  }
  public int getValue() {
    return value;
  }
  public void show() {
    for (int i = 0; i<value; i++) {
      ellipse((int)Math.random()*500, (int)Math.random()*500, 10, 10);
    }
  }
}
