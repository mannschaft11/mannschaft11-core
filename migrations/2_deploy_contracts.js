var ConvertLib = artifacts.require("./ConvertLib.sol");
var MSCCoin = artifacts.require("./MSCCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MSCCoin);
  deployer.deploy(MSCCoin);
};
