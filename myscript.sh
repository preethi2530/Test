#! /bin/bash
#public.ecr.aws/n2u0q7l0/depositcli:v2.3.0
echo "Enter .pem file path: "
read  pemFilePath
echo "Enter AWS public IPv4 and external DNS hostname[eg: ec2-user@ec2-x-xx-xxx-xxx.compute-1.amazonaws.com]: "
read  instanceCredential
ssh -i "$pemFilePath" $instanceCredential
sudo rm -r validator_keys
function generate_keys(){
docker run -it --rm -v $(pwd)/validator_keys:/app/validator_keys public.ecr.aws/n2u0q7l0/depositcli:v2.3.0 new-mnemonic --num_validators=1 --mnemonic_language=english
sudo scp -r "$pemFilePath" $instanceCredential:/home/ec2-user/validator_keys ~/Desktop/
}

generate_keys

echo -e "Success!"