$domain = "DOMINIO DA EMPRESA"
$password = ConvertTo-SecureString "SENHA DE ACESSO AO DOMINIO" -AsPlainText -Force
$username = "$domain\LOGIN DO DOMINIO"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential -Restart; Set-ExecutionPolicy Restricted