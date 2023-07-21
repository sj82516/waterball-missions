package domain.state;

import domain.Role;
import domain.StateValue;

public class StockpileState extends State{
    public StockpileState(Role role) {
        super(role);
        this.stateValue = StateValue.Stockpile;
    }

    @Override
    public void attacked(int damage) {
        role.handleAttacked(damage);
        role.setState(new NormalState(role));
    }

    @Override
    protected void exitState() {
        role.setState(new EruptingState(role));
    }
}
