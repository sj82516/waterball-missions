package domain.state;

import domain.Role;
import domain.StateValue;

public class InvincibleState extends State{
    public InvincibleState(Role role) {
        super(role);
        this.stateValue = StateValue.Invincible;
        this.round = 2;
    }

    @Override
    public void attacked(int damage) {
        // do nothing
    }
}
