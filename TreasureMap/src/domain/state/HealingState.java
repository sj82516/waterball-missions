package domain.state;

import domain.Role;
import domain.StateValue;

public class HealingState extends State{
    public HealingState(Role role) {
        super(role);
        this.stateValue = StateValue.Healing;
        this.round = 5;
    }

    @Override
    protected void preAction() {
        role.hp += 15;
        if (role.hp >= role.MAX_HP) {
            role.hp = role.MAX_HP;
            role.setState(new NormalState(role));
        }
    }
}
