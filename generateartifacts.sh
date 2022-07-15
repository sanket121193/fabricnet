
#!/bin/bash -e
export PWD=`/home/sanket.raiturkar_sna@npci.org.in/Documents/vajraGO/fabricnetgenerator`

export FABRIC_CFG_PATH=$PWD
export ARCH=$(uname -s)
export CRYPTOGEN=$PWD/bin/cryptogen
export CONFIGTXGEN=$PWD/bin/configtxgen

function generateArtifacts() {
	
	echo " *********** Generating artifacts ************ "
	echo " *********** Deleting old certificates ******* "
	
        rm -rf ./crypto-config
	
        echo " ************ Generating certificates ********* "
	
        $CRYPTOGEN generate --config=$FABRIC_CFG_PATH/crypto-config.yaml
        
        echo " ************ Generating tx files ************ "
	
		$CONFIGTXGEN -profile OrdererGenesis -channelID system-channel -outputBlock ./genesis.block  -channelID genesischannel
		
		
		$CONFIGTXGEN -profile mychannel -outputCreateChannelTx ./mychannel.tx -channelID mychannel
		
		echo "Generating anchor peers tx files for  Org1"
		$CONFIGTXGEN -profile mychannel -outputAnchorPeersUpdate  ./mychannelOrg1MSPAnchor.tx -channelID mychannel -asOrg Org1MSP
		
		echo "Generating anchor peers tx files for  Org0"
		$CONFIGTXGEN -profile mychannel -outputAnchorPeersUpdate  ./mychannelOrg2MSPAnchor.tx -channelID mychannel -asOrg Org2MSP
		
		
		$CONFIGTXGEN -profile All -outputCreateChannelTx ./all.tx -channelID all
		
		echo "Generating anchor peers tx files for  Org1"
		$CONFIGTXGEN -profile All -outputAnchorPeersUpdate  ./allOrg1MSPAnchor.tx -channelID all -asOrg Org1MSP
		
		echo "Generating anchor peers tx files for  Org2"
		$CONFIGTXGEN -profile All -outputAnchorPeersUpdate  ./allOrg2MSPAnchor.tx -channelID all -asOrg Org2MSP
		
		echo "Generating anchor peers tx files for  Org3"
		$CONFIGTXGEN -profile All -outputAnchorPeersUpdate  ./allOrg3MSPAnchor.tx -channelID all -asOrg Org3MSP
		
		

}

generateArtifacts 

cd $PWD

