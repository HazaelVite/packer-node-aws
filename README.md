wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install packer



AKIASI2B6HR2LGMLNHAU
2ncMoz+VA5/p4v7hd1WPSAbYHLGMbWFm+5KoPknI


export AWS_ACCESS_KEY_ID="AKIASI2B6HR2LGMLNHAU" 
export AWS_SECRET_ACCESS_KEY="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" 

packer build template.pkr.hcl