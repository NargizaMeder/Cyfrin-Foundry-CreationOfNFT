# MoodNft

An on-chain NFT that reflects your mood — fully stored on the blockchain as SVG, no IPFS needed.

## What it does

Each NFT has two states: **Happy** 😊 and **Sad** 😢. The owner can flip the mood at any time. Both the metadata and images are base64-encoded SVGs stored entirely on-chain.

## Contracts

| File                               | Description                                |
| ---------------------------------- | ------------------------------------------ |
| `src/MoodNft.sol`                  | Core ERC-721 contract                      |
| `script/DeployMoodNft.s.sol`       | Deployment script (reads SVGs from `/img`) |
| `script/MoodNftInteractions.s.sol` | Mint and flip mood scripts                 |

## Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/)
- SVG files at `./img/happy.svg` and `./img/sad.svg`

### Install dependencies

```bash
forge install
```

### Run tests

```bash
forge test
```

### Deploy (local Anvil)

```bash
# Terminal 1
anvil

# Terminal 2
forge script script/DeployMoodNft.s.sol:DeployMoodNft \
  --rpc-url http://127.0.0.1:8545 \
  --private-key <anvil_private_key> \
  --broadcast
```

## Usage

After deploying, interact with the contract using the interaction scripts:

```bash
# Mint a new NFT (starts as Happy)
forge script script/MoodNftInteractions.s.sol:MintMoodNft \
  --rpc-url http://127.0.0.1:8545 --private-key <key> --broadcast

# Flip mood: Happy → Sad (or Sad → Happy)
forge script script/MoodNftInteractions.s.sol:FlipMoodNft \
  --rpc-url http://127.0.0.1:8545 --private-key <key> --broadcast
```

## Key Functions

| Function                    | Description                                                  |
| --------------------------- | ------------------------------------------------------------ |
| `mintNft()`                 | Mints a new NFT, defaults to Happy mood                      |
| `flipMood(uint256 tokenId)` | Toggles mood — only callable by the token owner              |
| `tokenURI(uint256 tokenId)` | Returns base64-encoded on-chain JSON metadata with SVG image |

## Test Coverage

```
src/MoodNft.sol   95.45% lines   94.44% statements   75% branches
```

## License

MIT
