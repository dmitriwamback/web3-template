const Argon = artifacts.require('Argon')

module.exports = function(deployer) {
    deployer.deploy(Argon)
}