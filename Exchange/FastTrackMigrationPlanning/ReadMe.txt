<#
.SYNOPSIS
Use this script to generate a migration schedule for mailboxes being migrated from on-premises environments to O365. The script will first collect all permissions, identify associated delegates, and generate a schedule in the format expected by the Microsoft Onboarding Center (OBC) team.
You can use the generated schedule to manipulate the mailboxes that you would like to migrate and share with the OBC team to submit for migration.  

.DESCRIPTION
The sample scripts are not supported under any Microsoft standard support 
program or service. The sample scripts are provided AS IS without warranty  
of any kind. Microsoft further disclaims all implied warranties including,  
without limitation, any implied warranties of merchantability or of fitness for 
a particular purpose. The entire risk arising out of the use or performance of  
the sample scripts and documentation remains with you. In no event shall 
Microsoft, its authors, or anyone else involved in the creation, production, or 
delivery of the scripts be liable for any damages whatsoever (including, 
without limitation, damages for loss of business profits, business interruption, 
loss of business information, or other pecuniary loss) arising out of the use 
of or inability to use the sample scripts or documentation, even if Microsoft 
has been advised of the possibility of such damages.

=========================================
Published date: 08/11/2015
+Group enumeration for both FullAccess and Send As Permissions
+Ability to list out ActiveSync Devices and to add to migrated mailboxes
Authors: 
Alejandro Lopez - alejanl@microsoft.com
Sam Portelli - Sam.Portelli@microsoft.com
=========================================

.PARAMETER UserImportCSV
Use this parameter to specify a list of users to collect permissions for, rather than all mailboxes.
Make sure that the CSV file provided has a header titled "Email"

.PARAMETER RemoveServiceAccts
Use this parameter to specify a list of service accounts (or even public shared mailboxes that all users have permissions to) that you would like to exclude from permissions
Make sure that the CSV file provided has a header titled "Email"

.PARAMETER ListActiveSyncDevices
Use this parameter to include active sync devices allowed for the mailboxes in the on-premises environment. This will add a separate column to the migration schedule and list those devices in pipe-delimited format. 

.PARAMETER AddActiveSyncDevices
Use this parameter to update migrated cloud mailboxes (using a schedule file of migrated mailboxes - must be schedule that includes the active sync devices, can be generated using the -ListActiveSyncDevices parameter) and add the active sync devices to the cloud mailboxes

.EXAMPLE
#Create Migration Schedule for ALL users - by default
.\obcmigrationplanning.ps1 

.EXAMPLE
#Create Migration Schedule for ALL users EXCEPT service accounts
.\obcmigrationplanning.ps1 -RemoveServiceAccts

.EXAMPLE
#Create Migration Schedule for list of users
.\obcmigrationplanning.ps1 -UseImportCSV 

.EXAMPLE
#Create Migration Schedule for list of users except service accounts
.\obcmigrationplanning.ps1 -UseImportCSV -RemoveServiceAccts

#>