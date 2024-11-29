# Deploy a Smart Contract with Hardhat
# deploy
npx hardhat run --network sepolia scripts/deploy.ts (0x3E8E1E84FE3B93062f649eDFB5Bf4B4e96339396)

# verify
npx hardhat verify --contract contracts/TokenSpender.sol:TokenSpender --network sepolia 0x3E8E1E84FE3B93062f649eDFB5Bf4B4e96339396