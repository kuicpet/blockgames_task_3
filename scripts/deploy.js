const hre = require('hardhat')

async function main() {
  const [deployer] = await hre.ethers.getSigners()
  console.log('Deploying contracts with the account: ', deployer.address)

  const weiAmount = (await deployer.getBalance()).toString()
  console.log(
    'Account Balance: ',
    await hre.ethers.utils.formatEther(weiAmount)
  )

  const Token = await hre.ethers.getContractFactory('KuicToken')
  const token = await Token.deploy()

  const NFT = await hre.ethers.getContractFactory('KuicNFT')
  const nft = await NFT.deploy()

  await token.deployed()
  await nft.deployed()

  console.log('Token contract was deployed to: ', token.address)
  console.log('NFT Contract deployed to: ', nft.address)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
