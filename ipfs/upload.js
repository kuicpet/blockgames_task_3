const {create} = require('ipfs-http-client');

const ipfs = create('https://ipfs.infura.io:5001');

const run = async () => {
const file = {
    path: '/',
    content: JSON.stringify({
        name: 'Kuic',
        image: 'https://gateway.pinata.cloud/ipfs/Qmcy1dV13X6pfXoMbqFY7Q42nnbjnLuzmQbFEfXbXY8HLK',
        description: 'Exterminates all the Demons'
    })
};

const result = await ipfs.add(file);
console.log(result)
}

run();