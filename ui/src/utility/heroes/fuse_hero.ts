import { Transaction } from "@mysten/sui/transactions";

export const fuseHero = (
  packageId: string,
  hero1Id: string,
  hero2Id: string
) => {
  const tx = new Transaction();

  tx.moveCall({
    target: `${packageId}::hero::fuse_heroes`,
    arguments: [tx.object(hero1Id), tx.object(hero2Id)],
  });

  return tx;
};

