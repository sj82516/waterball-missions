package domain.state;

import domain.Role;
import domain.StateValue;

import java.util.ArrayList;

public class EruptingState extends State{
    public EruptingState(Role role) {
        super(role);
        this.stateValue = StateValue.Erupting;
        this.round = 3;
    }

    @Override
    public void attack() {
        ArrayList<Role> others = role.map.getOtherRoles(role);
        for (Role other : others) {
            other.attacked(50);
        }
    }

    @Override
    public boolean isInAttackRange(){
        return true;
    }

    @Override
    protected void exitState(){
        role.setState(new TeleportState(role));
    }
}
