pragma solidity ^0.5.0;

// address 1 = 0x3cd4713cb58FCE3dC14f0527E19EA2A451F4c787
// address 2 = 0x3235bb19f243a4D248439f878AeEbdd73C207C47
// address 3 = 0x53c3Bad1FD9B71Ba15E0560AC897a0260FE04cbA

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3;

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value - amount * 3);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit ();
    }
}
