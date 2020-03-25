const CrypsndipToken = artifacts.require("CrypsndipToken");

module.exports = function(deployer) {
  deployer.deploy(CrypsndipToken);
};
