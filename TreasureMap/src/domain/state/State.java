package domain.state;

import domain.Role;
import domain.StateValue;

public abstract class State {
    protected int round = 3;
    protected StateValue stateValue;
    protected final Role role;

    public State(Role role) {
        this.role = role;
    }

    public void takeRound() {
        preAction();
        action();

        age();
        if (round == 0) {
            exitState();
        }
    }

    protected void age() {
        round--;
    }

    protected void preAction(){};

    protected void action(){
        role.action();
    };

    protected void exitState(){
        role.setState(new NormalState(role));
    };

    public void attack() {
        role.handleAttack();
    }

    @Override
    public String toString() {
        return this.stateValue.toString();
    }

    public void attacked(int damage) {
        role.handleAttacked(damage);
    }

    public boolean isInAttackRange() {
        return role.isInAttackRange();
    }
}
