var DataManager = artifacts.require("./DataManager.sol");

contract("DataManager", function(accounts) {

  it("initializes with one account", function() {
    return DataManager.deployed().then(function(instance) {
      return instance.accountsCount();
    }).then(function(count) {
      assert.equal(count, 1);
    });
  });

  it("Deposit", function() {
    return DataManager.deployed().then(function(instance) {
        instance.deposit(100, 1);
      return instance.accounts(1);
    }).then(function(candidate) {
      assert.equal(candidate[2], 100, "contains the correct id");
    });
  });

  it("it initializes the account with the correct values", function() {
    return DataManager.deployed().then(function(instance) {
        
      return instance.accounts(1);
    }).then(function(candidate) {
      assert.equal(candidate[0], 1, "contains the correct id");
      assert.equal(candidate[1], "FirstAccount", "contains the correct name");
      assert.equal(candidate[2], 0, "contains the correct votes count");
    });
  });
});