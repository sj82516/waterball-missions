package domain.state;

import domain.Role;
import domain.StateValue;

public class AcceleratedState extends State{
    public AcceleratedState(Role role) {
        super(role);
        this.stateValue = StateValue.Accelerated;
        this.round = 3;
    }

    @Override
    protected void preAction() {
        role.action();
    }

    @Override
    public void attacked(int damage) {
        role.handleAttacked(damage);
        role.setState(new NormalState(role));
    }
}
