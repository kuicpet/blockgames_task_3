const { ethers } = require('hardhat')
const hre = require('hardhat')

const friends = [
  '0x13b65455de02f177Cbd71869beeFc9Ce442eeA02',
  '0x699df0090005A9eE1e380A1d6F7905B06ce44a96',
]

const contractAddress = '0xc730DE4fAfF7EDC08f1C6F931F0817fd99FaE607'

const main = async () => {
  const nft = await hre.ethers.getContractAt('KuicNFT', contractAddress)

  const signer0 = await ethers.provider.getSigner(0)
  const nonce = await signer0.getTransactionCount()
  for (let i = 0; i < friends.length; i++) {
    const tokenURI =
      'https://gateway.pinata.cloud/ipfs/Qmcy1dV13X6pfXoMbqFY7Q42nnbjnLuzmQbFEfXbXY8HLK'
    await nft.mintNFT(friends[i], tokenURI, {
      nonce: nonce + i,
    })

    console.log('Minting is completed')
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
