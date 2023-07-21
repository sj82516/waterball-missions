package domain;

public class Obstacle extends MapObject{
    public Obstacle(int row, int col) {
        super(row, col);
        this.symbol = "□";
    }
}
