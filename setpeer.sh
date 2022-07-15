
#!/bin/bash
export ORDERER_CA=/opt/ws/crypto-config/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem

#For fabric 2.2.x extra environment variables

export ORG1_PEER0_CA=/opt/ws/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt

export ORG2_PEER0_CA=/opt/ws/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt

export ORG3_PEER0_CA=/opt/ws/crypto-config/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt



if [ $# -lt 2 ];then
	echo "Usage : . setpeer.sh Org1|Org2|Org3| <peerid>"
fi
export peerId=$2

if [[ $1 = "Org1" ]];then
	echo "Setting to organization Org1 peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.org1.example.com:7051
	export CORE_PEER_LOCALMSPID=Org1MSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/org1.example.com/peers/$peerId.org1.example.com/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/org1.example.com/peers/$peerId.org1.example.com/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/org1.example.com/peers/$peerId.org1.example.com/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
fi

if [[ $1 = "Org2" ]];then
	echo "Setting to organization Org2 peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.org2.example.com:7051
	export CORE_PEER_LOCALMSPID=Org2MSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/org2.example.com/peers/$peerId.org2.example.com/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/org2.example.com/peers/$peerId.org2.example.com/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/org2.example.com/peers/$peerId.org2.example.com/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
fi

if [[ $1 = "Org3" ]];then
	echo "Setting to organization Org3 peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.org3.example.com:7051
	export CORE_PEER_LOCALMSPID=Org3MSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/org3.example.com/peers/$peerId.org3.example.com/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/org3.example.com/peers/$peerId.org3.example.com/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/org3.example.com/peers/$peerId.org3.example.com/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp
fi

	