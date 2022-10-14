#! /bin/bash
function generate_keys(){
sudo rm -r validator_keys
docker run -it --rm -v $(pwd)/validator_keys:/app/validator_keys public.ecr.aws/n2u0q7l0/depositcli:v2.3.0 new-mnemonic --num_validators=1 --mnemonic_language=english
}
generate_keys
echo -e "Success!"
