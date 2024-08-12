const { expect } = require("chai")
const { ethers } = require("hardhat")

// Converts ETH number to smaller WEI number
const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

/*//////////////////////////////////////////////////////////////
                  GLOBAL CONSTANTS FOR LISTING AN ITEM
//////////////////////////////////////////////////////////////*/
const ID = 1
const NAME = 'Shoes'
const CATEGORY = 'Clothing'
const IMAGE = 'https://ipfs.io/ipfs/QmTYEboq8raiBs7GTUg2yLXB3PMz6HuBNgNfSZBx5Msztg/shoes.jpg'
const COST = tokens(1) // 1 ETh, will be converted to WEI using tokens function above
const RATING = 4
const STOCK = 5
    

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

  /*//////////////////////////////////////////////////////////////
                            DEPLOYMENT TEST
  //////////////////////////////////////////////////////////////*/

  describe("Deployment", () => {

    it('sets the owner', async () => {
      expect(await dappazon.owner()).to.equal(deployer.address)
    })

    // Used to test setup, can delete afterwards
    // it('has a name', async () => {
    //   const name = await dappazon.name()
    //   expect(name).to.equal("Dappazon")
    // })
  })

  /*//////////////////////////////////////////////////////////////
                            LISTING TEST
  //////////////////////////////////////////////////////////////*/

  describe("Listing", async () => {
    let transaction
    
    beforeEach(async () => {
     transaction = await dappazon.connect(deployer).list(
        ID,
        NAME,
        CATEGORY,
        IMAGE,
        COST,
        RATING,
        STOCK
      )

      await transaction.wait()
    })

    // it('returns item attributes', async () => {
    //   const item = await dappazon.items(1)
    //   expect(item.id).to.equal(1)
    //   expect(item.name).to.equal("Shoes")
    // })

    // Refactored
    it('returns item attributes', async () => {
      const item = await dappazon.items(ID)
      expect(item.id).to.equal(ID)
      expect(item.name).to.equal(NAME)
      expect(item.category).to.equal(CATEGORY)
      expect(item.image).to.equal(IMAGE)
      expect(item.cost).to.equal(COST)
      expect(item.rating).to.equal(RATING)
      expect(item.stock).to.equal(STOCK)
    })

    it('emits List events', () => {
      expect(transaction).to.emit(dappazon, 'List')
    })
  })
  
})
