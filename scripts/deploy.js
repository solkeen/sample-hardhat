// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());
  // We get the contract to deploy
  const Liquidity = await hre.ethers.getContractFactory("Liquidity");
  const hardhatLiquidity = await hre.upgrades.deployProxy(Liquidity, {
    initiaizer: "initiailize"
  });

  await hardhatLiquidity.deployed();

  console.log("Marketplace is Deployed to ", hardhatLiquidity.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
  