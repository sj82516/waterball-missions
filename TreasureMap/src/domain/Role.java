package domain;

import domain.state.NormalState;
import domain.state.State;

public abstract class Role extends MapObject{
    public final TreasureMap map;
    protected State state;
    public int MAX_HP = 1;
    public int hp;

    public Role (int row, int col, TreasureMap map) {
        super(row, col);
        this.map = map;
        this.state = new NormalState(this);
    }

    public void setState(State state) {
        this.state = state;
    }

    public void takeRound() {
        state.takeRound();
    }

    public void action() {}

    abstract public void handleAttack();

    public void attacked(int damage) {
        state.attacked(damage);
    }

    public void handleAttacked(int damage) {
        this.hp -= damage;
        if (this.hp <= 0) {
            map.removeMapObject(this);
        }
    };

    public boolean isInAttackRange() {
        return true;
    };

    public boolean isDead() {
        return this.hp <= 0;
    };

    public int choose(int[] ints) {
        return 0;
    }

    public void move(char direction){
        int row = this.row;
        int col = this.col;
        switch (direction) {
            case '1' -> row--;
            case '2' -> col++;
            case '3' -> row++;
            case '4' -> col--;
        }
        map.move(this, row, col);
    };
}
