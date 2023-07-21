package domain;

public class Monster extends Role {
    protected int damage = 50;

    public Monster(int row, int col, TreasureMap map) {
        super(row, col, map);
        this.symbol = "M";
        this.hp = 1;
        this.MAX_HP = 1;
    }

    @Override
    public void action() {
        if (state.isInAttackRange()) {
            state.attack();
        } else {
            chooseMove();
        }
    }

    @Override
    public void handleAttack() {
        map.character.handleAttacked(50);
    }

    public boolean isInAttackRange() {
        Character character = map.character;
        return Math.abs(character.row - this.row) + Math.abs(character.col - this.col) <= 1;
    }

    private void chooseMove() {
        char direction = (char) ((int) (Math.random() * 4) + '0');
        super.move(direction);
    }

    @Override
    public int choose(int[] choices) {
        return choices[(int) (Math.random() * choices.length)];
    }
}
