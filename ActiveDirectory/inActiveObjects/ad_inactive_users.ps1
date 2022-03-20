$CURRENT_MONTH =  Get-Date -Format y
$ATTACH_FILE = 'C:\Public\AD\Inactive_users.txt'
$MAIL_SERVER="NAME.SERVER"
$SENDER_EMAIL="NAME@DOMAIN"
$RECIPIENT_EMAIL="NAME@DOMAIN"
$USERNAME = "USERNAME"
$PWD_TXT = Get-Content "C:\Public\AD\Stored_Password.txt"
$SEC_PWD = $PWD_TXT | ConvertTo-SecureString  -AsPlainText -Force
$CRED = New-Object System.Management.Automation.PSCredential ($USERNAME, $SEC_PWD)
$SUBJECT ="Inactive users for $CURRENT_MONTH"
$BODY = "Inactive users for $CURRENT_MONTH"
$PORT = '587'
$COUNT_DAY= '30'

                     
function send_Mail {
   Send-MailMessage -From $SENDER_EMAIL `
                 -To $RECIPIENT_EMAIL `
                 -Subject $SUBJECT `
                 -Body $BODY `
                 -Attachments $ATTACH_FILE `
                 -SmtpServer $MAIL_SERVER `
                 -Port $PORT `
                 -Credential $CRED
}

function get_User {
    $DATE_WITH_OFFSET= (Get-Date).AddDays(-$COUNT_DAY)

    Get-ADUser -Properties LastLogonDate `
               -Filter {(LastLogonDate -lt $DATE_WITH_OFFSET) -and (Enabled -eq 'True')} |`
                Sort LastLogonDate | FT Name, LastLogonDate,Enabled > $ATTACH_FILE
}

get_User
send_Mail