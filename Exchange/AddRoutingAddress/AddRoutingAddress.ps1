#################################################################
# Adds onmicrosoft routing alias to provided users in CSV       #
#   ExportData.csv must contain the primary email address       #
#   one per line                                                #
#################################################################

#Set the following variables
$MicrosoftRoutingAddress = "@CHANGEME.mail.onmicrosoft.com"

#Code
start-transcript
Import-Csv ExportData.csv | Foreach-Object{
   Try {
         $email = $_.emailaddress
         $user = Get-Mailbox -Identity $_.EmailAddress -erroraction stop   
         $SecondayAddress = $user.alias + $MicrosoftRoutingAddress
         $user.EmailAddresses+=$SecondayAddress
         Set-Mailbox $user -EmailAddresses $user.EmailAddresses -WarningAction silentlyContinue
         Write-Host "Successfully added secondary alias to $email"
        }
   Catch {
        Write-Host "Could not find the email address $email"}}
Stop-Transcript

   