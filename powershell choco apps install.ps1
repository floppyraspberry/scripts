# powershell choco install

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install 7zip -z
choco install googlechrome -y
choco install firefox -y
choco install authy-desktop -y
choco install awscli -y
choco install vscode -y
choco install visualstudio2022enterprise -y
choco install resharper -y

choco install adblockplus-firefox -y
choco install docker-desktop -y
choco install slack -y
choco install postman -y
choco install notepadplusplus -y
choco install keepass -y
choco install keybase -y
choco install git -y
choco install github-desktop -y
choco install office365business -y
choco install terraform -y
choco install nodejs -y
choco install pgadmin4 -y
choco install gsudo -y

refreshenv

npm install -g npm
npm install -g aws-azure-login
aws-azure-login --configure --profile knabsaml
