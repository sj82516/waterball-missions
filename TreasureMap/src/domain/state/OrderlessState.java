package domain.state;

import domain.Role;
import domain.StateValue;

public class OrderlessState extends State{
    public OrderlessState(Role role) {
        super(role);
        this.stateValue = StateValue.Orderless;
        this.round = 3;
    }

    @Override
    protected void action() {
        int rand = (int)(Math.random() * 2);
        if(rand == 0){
            moveVertical();
        }else{
            moveHorizontal();
        }
    }

    private void moveVertical(){
        System.out.println("you can only move vertical, 1 for up, 2 for down");
        int choice = role.choose(new int[]{1, 2});
        if(choice == 1){
            role.move('1');
        }else if(choice == 2){
            role.move('3');
        }
    }

    private void moveHorizontal(){
        System.out.println("you can only move horizontal, 1 for right, 2 for left");
        int choice = role.choose(new int[]{1,2});
        if(choice == 1){
            role.move('2');
        }else if(choice == 2){
            role.move('4');
        }
    }
}
