package domain;

import domain.state.*;

public class Treasure extends MapObject {
    public String title = "";
    public StateValue stateValue;

    public static String[] titles = {
            "Super Star",
            "Poison",
            "Accelerating Potion",
            "Healing Potion",
            "Devil Fruit",
            "King's Rock",
            "Dokodemo Door",
    };

    public static StateValue[] stateValues = {
            StateValue.Invincible,
            StateValue.Poisoned,
            StateValue.Accelerated,
            StateValue.Healing,
            StateValue.Orderless,
            StateValue.Stockpile,
            StateValue.Erupting,
            StateValue.Teleport,
    };

    public static Double[] probabilities = {
            0.1,
            0.25,
            0.2,
            0.15,
            0.1,
            0.1,
            0.1
    };

    public Treasure(int row, int col) {
        super(row, col);
        this.symbol = "x";

        double rand = Math.random();
        for (int i = 0; i < probabilities.length; i++) {
            if (rand < probabilities[i]) {
                this.title = titles[i];
                this.stateValue = stateValues[i];
                break;
            }
            rand -= probabilities[i];
        }
    }

    public State applyState(Role role) {
        switch (stateValue) {
            case Invincible -> {
                return new InvincibleState(role);
            }
            case Poisoned -> {
                return new PoisonedState(role);
            }
            case Healing -> {
                return new HealingState(role);
            }
            case Erupting -> {
                return new EruptingState(role);
            }
            case Stockpile -> {
                return new StockpileState(role);
            }
            case Accelerated -> {
                return new AcceleratedState(role);
            }
            case Teleport -> {
                return new TeleportState(role);
            }
            case Orderless -> {
                return new OrderlessState(role);
            }
        }
        return new NormalState(role);
    }
}
