package domain.state;

import domain.Role;
import domain.StateValue;

public class TeleportState extends State{
    public TeleportState(Role role) {
        super(role);
        this.stateValue = StateValue.Teleport;
        this.round = 1;
    }

    @Override
    protected void exitState() {
        role.setState(new NormalState(role));
        role.map.randomMove(role);
    }
}
