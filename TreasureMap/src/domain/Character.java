package domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Character extends Role {
    public String[] directions = {"↑", "→", "↓", "←" };
    protected int damage = 1;
    private int attackValue = 1;

    public Character(int row, int col, TreasureMap map) {
        super(row, col, map);
        this.symbol = directions[(int) (Math.random() * directions.length)];
        this.hp = 300;
        this.MAX_HP = 300;
    }

    @Override
    public void action() {
        System.out.println("Character action");
        System.out.println("type 1 to attack, type 2 to move");
        Scanner scanner = new Scanner(System.in);
        char input = scanner.next().charAt(0);
        if (input == '1') {
            state.attack();
        } else if (input == '2') {
            chooseMove();
        }
    }

    @Override
    public void handleAttack() {
        // monsters in line
        ArrayList<Monster> monsters = new ArrayList<>();

        int row = this.row;
        int col = this.col;
        while (true) {
            switch (this.symbol) {
                case "↑" -> row--;
                case "→" -> col++;
                case "↓" -> row++;
                case "←" -> col--;
            }

            // if out of map, stop
            if (row < 0 || row >= map.ROW_COUNT || col < 0 || col >= map.COL_COUNT) {
                break;
            }

            // if there is an obstacle, stop
            if (map.map[row][col] instanceof Obstacle) {
                break;
            }
            if (map.map[row][col] instanceof Monster) {
                monsters.add((Monster) map.map[row][col]);
            }
        }

        for (Monster monster : monsters) {
            monster.attacked(attackValue);
        }
    }

    @Override
    public void handleAttacked(int damage) {
        super.handleAttacked(damage);
    }

    private void chooseMove() {
        System.out.println("type 1 to move up, type 2 to move right, type 3 to move down, type 4 to move left");
        Scanner scanner = new Scanner(System.in);

        char input = scanner.next().charAt(0);
        move(input);
    }

    public void move(char input) {
        switch (input) {
            case '1' -> this.symbol = "↑";
            case '2' -> this.symbol = "→";
            case '3' -> this.symbol = "↓";
            case '4' -> this.symbol = "←";
        }
        super.move(input);
    }

    public void printInfo() {
        System.out.println("Character direction:" + this.symbol + " HP: " + this.hp + ", State:" + state);
    }

    @Override
    public int choose(int[] choices) {
        Scanner scanner = new Scanner(System.in);
        Integer input = Integer.valueOf(scanner.next().charAt(0) - '0');
        if (Arrays.stream(choices).anyMatch(input::equals)) {
            return input;
        }
        return choices[0];
    }
}
