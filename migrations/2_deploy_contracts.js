const CrypsndipToken = artifacts.require("CrypsndipToken");
const CrypsndipTokenSale = artifacts.require("CrypsndipTokenSale");

module.exports = function(deployer) {
  deployer.deploy(CrypsndipToken, 1000000).then(function() {
    //Token price is 0.001 Ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(CrypsndipTokenSale, CrypsndipToken.address, tokenPrice);
  });
};
