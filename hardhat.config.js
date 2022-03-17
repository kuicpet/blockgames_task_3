require('@nomiclabs/hardhat-waffle')
require('dotenv').config()

const projectId = '240351bfa1164d4094e85ea5ebdd13c6'

module.exports = {
  solidity: '0.8.4',
  networks: {
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${projectId}`,
      accounts: [process.env.ACCOUNT_KEY],
    },
  },
}
