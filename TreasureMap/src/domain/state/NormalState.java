package domain.state;

import domain.Role;
import domain.StateValue;

public class NormalState extends State{
    public NormalState(Role role) {
        super(role);
        this.stateValue = StateValue.Normal;
    }

    @Override
    protected void age() {
        // normal state does not age
    }
}
