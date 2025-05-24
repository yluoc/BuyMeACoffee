-include .env

remove:; rm -rf .gitmodules && rm -rf lib

build:; forge build

clean:; forge clean

test:; forge test

snapshot:; forge snapshot

coverage:; forge coverage

sepolia_coverage:
	forge coverage --fork-url $(SEPOLIA_RPC_URL)

deploy:
	forge script script/DeployFundMe.s.sol:DeployFundMe $(NETWORK_ARGS)

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
NETWORK_ARGS := --rpc-url http://localhost:8545 --PRIVATE_KEY $(DEFAULT_ANVIL_KEY) --broadcast

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv