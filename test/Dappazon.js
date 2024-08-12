const { expect } = require("chai")
const { ethers } = require("hardhat")

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe("Dappazon", () => {
  let dappazon
  let deployer, buyer

  beforeEach(async () => {
    // Setup and fetch accounts with ethers.js, npx hardhart node shows 20 test accounts from ethers
    [deployer, buyer] = await ethers.getSigners()
    // console.log(deployer.address, buyer.address)

    // Deploy contract
    const Dappazon = await ethers.getContractFactory("Dappazon")
    dappazon = await Dappazon.deploy()


  })


  describe("Deployment", () => {

    it('sets the owner', async () => {
      expect(await dappazon.owner()).to.equal(deployer.address)
    })

    // Used to test setup, can delete afterwards
    it('has a name', async () => {
      const name = await dappazon.name()
      expect(name).to.equal("Dappazon")
    })
  })
  
})
