package domain;

import domain.state.State;

import java.util.ArrayList;
import java.util.Collections;

public class TreasureMap {
    public static final int ROW_COUNT = 10;
    public static final int COL_COUNT = 10;
    public static final int TREASURE_COUNT = 15;
    public static final int MONSTER_COUNT = 10;
    public final MapObject[][] map;
    public Character character;
    public ArrayList<Monster> monsters = new ArrayList<>();
    private final ArrayList<int[]> valuePositions = new ArrayList<>();

    public TreasureMap() {
        this.map = new MapObject[ROW_COUNT][COL_COUNT];
        for (int row = 0; row < ROW_COUNT; row++) {
            for (int col = 0; col < COL_COUNT; col++) {
                map[row][col] = null;
                valuePositions.add(new int[]{row, col});
            }
        }
        Collections.shuffle(valuePositions);


        // generate treasure
        int treasureCount = TREASURE_COUNT;
        while (treasureCount > 0) {
            int[] position = getPosition();
            int row = position[0];
            int col = position[1];
            map[row][col] = new Treasure(row, col);
            treasureCount--;
        }

        // generate monster
        int monsterCount = MONSTER_COUNT;
        while (monsterCount > 0) {
            int[] position = getPosition();
            int row = position[0];
            int col = position[1];
            Monster monster = new Monster(row, col, this);
            map[row][col] = monster;
            monsters.add(monster);
            monsterCount--;
        }

        // generate obstacle
        int obstacleCount = 10;
        while (obstacleCount > 0) {
            int[] position = getPosition();
            int row = position[0];
            int col = position[1];
            map[row][col] = new Obstacle(row, col);
            obstacleCount--;
        }

        // generate character
        int[] position = getPosition();
        int row = position[0];
        int col = position[1];
        map[row][col] = new Character(row, col, this);
        character = (Character) map[row][col];
    }

    public void printMap() {
        System.out.println("Map:");
        for (int row = 0; row < ROW_COUNT; row++) {
            for (int col = 0; col < COL_COUNT; col++) {
                MapObject mapObject = map[row][col];
                String symbol = "_";
                if (mapObject != null) {
                    symbol = mapObject.symbol;
                }
                System.out.print(" " + symbol + " ");
            }
            System.out.println();
        }
    }

    private int[] getPosition() {
        return valuePositions.remove(0);
    }

    public void removeMapObject(MapObject mapObject) {
        freePosition(mapObject);
    }

    private void freePosition(MapObject mapObject) {
        int row = mapObject.row;
        int col = mapObject.col;
        map[row][col] = null;
        valuePositions.add(new int[]{row, col});
    }

    public void move(Role role, int row, int col) {
        if (row < 0 || row >= ROW_COUNT || col < 0 || col >= COL_COUNT) {
            return;
        }
        if (map[row][col] instanceof Obstacle) {
            return;
        }
        if (map[row][col] instanceof Monster) {
            return;
        }
        if (map[row][col] instanceof Character) {
            return;
        }

        freePosition(role);
        if (map[row][col] instanceof Treasure) {
            // apply state
            State state = ((Treasure) map[row][col]).applyState(role);
            role.setState(state);
            System.out.println(role + " meet treasure!, apply state: " + role.state);
        }

        // move to new position
        role.row = row;
        role.col = col;
        map[row][col] = role;
        for (int[] position : valuePositions) {
            if (position[0] == row && position[1] == row) {
                valuePositions.remove(position);
                break;
            }
        }
    }

    public void start(){
        while (true) {
            character.printInfo();
            printMap();
            character.takeRound();
            if (isAllMonsterDead()) {
                System.out.println("You win!");
                break;
            }

            for (Monster monster : monsters) {
                if (monster.isDead()) {
                    continue;
                }
                monster.takeRound();
            }

            // check if monster is dead
            this.monsters = monsters.stream().filter(monster -> !monster.isDead()).collect(ArrayList::new, ArrayList::add, ArrayList::addAll);

            if (isAllMonsterDead()) {
                System.out.println("You win!");
                break;
            }

            if (character.isDead()) {
                System.out.println("You are dead!");
                break;
            }
        }
    }

    public ArrayList<Role> getOtherRoles(Role role) {
        ArrayList<Role> otherRoles = new ArrayList<>();
        if (role instanceof Character) {
            otherRoles.addAll(monsters);
        } else if (role instanceof Monster) {
            otherRoles.add(character);
            for (Monster monster : monsters) {
                if (monster != role) {
                    otherRoles.add(monster);
                }
            }
        }
        return otherRoles;
    }

    private boolean isAllMonsterDead() {
        return monsters.size() == 0;
    }

    public void randomMove(Role role) {
        int newRow = valuePositions.get(0)[0];
        int newCol = valuePositions.get(0)[1];
        move(role, newRow, newCol);
    }
}
