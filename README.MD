# Move Project

## 🔧 Development

### Local Development
```bash
# Start frontend development server
cd ui
npm install
npm run dev
```

### Smart Contract Development
```bash
# Build contracts
cd move
sui move build

# Run tests
sui move test

# Deploy to testnet
sui client publish
```

## "Admin Panel" Is Not Visible Issue

If you're unable to see the admin panels in your deployed application, it means your wallet address doesn't have the AdminCap. To resolve this issue, you need to use the address that published the package.

### Step 1: Get Your Wallet Address

First, check your available wallet addresses:

```bash
sui client addresses
```

This will display all your wallet addresses. Look for the one marked with `*` (active address) that was probably used for deploying your package.

### Step 2: Export Your Private Key

To use your wallet for admin operations, you'll need to export your private key:

```bash
sui keytool export --key-identity <YOUR-ALIAS>
```

Replace `<YOUR-ALIAS>` with the alias of your wallet (e.g., `condescending-cymophane`).

**Example output:**
```
╭────────────────────┬────────────────────────────────────────────────────────────────────────────────────────────╮
│ exportedPrivateKey │  suiprivkey1qr9xs5z77q6v8f5cumgcas0y3qavqch2x0lqvdnduqy49x0yun2k703zqwv                    │
│ key                │ ╭─────────────────┬──────────────────────────────────────────────────────────────────────╮ │
│                    │ │ alias           │  condescending-cymophane                                             │ │
│                    │ │ suiAddress      │  0xa11070a3877b77355a0afbc402559cae7501c666819f05491f0337016c219366  │ │
│                    │ │ publicBase64Key │  ADHRP+/iykiPas83db9JY2DcfNJbhrpdIKjGGzQIO39L                        │ │
│                    │ │ keyScheme       │  ed25519                                                             │ │
│                    │ │ flag            │  0                                                                   │ │
│                    │ │ peerId          │  31d13fefe2ca488f6acf3775bf496360dc7cd25b86ba5d20a8c61b34083b7f4b    │ │
│                    │ ╰─────────────────┴──────────────────────────────────────────────────────────────────────╯ │
╰────────────────────┴────────────────────────────────────────────────────────────────────────────────────────────╯
```

### Step 3: Connect Your Wallet

In your deployed application:
1. Click the "Connect Wallet" button
2. Import your wallet using the private key you exported
3. The admin panels should now be visible

### Important Security Notes

⚠️ **Never share your private key with anyone**
⚠️ **Use testnet addresses for development and testing**

## 🎯 Success Criteria

Your project is complete when:
- ✅ All smart contract tests pass
- ✅ All TODO items are implemented
- ✅ Frontend builds without errors
- ✅ App is successfully deployed to GitHub Pages
- ✅ All features work as expected