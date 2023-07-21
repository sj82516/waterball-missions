package domain.state;

import domain.Role;
import domain.StateValue;

public class PoisonedState extends State{
    public static final int DAMAGE = 15;

    public PoisonedState(Role role) {
        super(role);
        this.stateValue = StateValue.Poisoned;
        this.round = 3;
    }

    @Override
    protected void preAction() {
        role.handleAttacked(DAMAGE);
    }
}
