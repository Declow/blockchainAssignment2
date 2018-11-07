pragma solidity ^0.4.15;

contract DataManager {
    string public message;
    uint public accountsCount;
    mapping(uint => Account) public accounts;

    struct Account {
        uint Id;
        string Name;
        uint Balance;
    }

    function addAccount(string name) public {
        accountsCount++;
        accounts[accountsCount] = Account(accountsCount,name, 0);
    }

    function withdraw(uint amount, uint account) public returns(bool) {
        if (accounts[account].Balance >= amount) {
            accounts[account].Balance += -amount;
            return true;
        }
        return false;
    }

    function deposit(uint amount, uint account) public {
        accounts[account].Balance += amount;
    }

    function transfer(uint amount, uint fromAccount, uint toAccount) public returns(bool) {
        uint acBalance = accounts[fromAccount].Balance;
        if (acBalance >= amount) {
            accounts[fromAccount].Balance = acBalance - amount;
            accounts[toAccount].Balance += amount;
            return true;
        }
        return false;
    }

    function getBalance(uint account) public view returns(uint) {
        return accounts[account].Balance;
    }

    constructor () public {
        addAccount("FirstAccount");
    }
}