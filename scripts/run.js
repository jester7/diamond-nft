const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('DiamondNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("contract deployed to:", nftContract.address);
    
    let txn;
    
    for (let i = 0; i < 5; i++) {
      txn = await nftContract.mint();
      await txn.wait();
      console.log("minted NFT %s", i);
    }
    
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();
  