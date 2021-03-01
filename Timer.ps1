param([Int32]$delay=60)

#Create form
$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = "Countdown Timer!"
$Counter_Form.Width = 450
$Counter_Form.Height = 200

#Create label
$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.AutoSize = $true 

#Add label to form
$Counter_Form.Controls.Add($Counter_Label)

#Show countdown-timer
while ($delay -ge 0)
{
  $Counter_Form.Show()
  $Counter_Label.Text = "Seconds Remaining: $($delay)"
  start-sleep 1
  $delay -= 1
}
#Close form
$Counter_Form.Close() 

#Start TaskProcessor
Invoke-Expression -Command "C:\Users\loc.BOOY3105\Documents\Powershell\TaskProcessor\TaskProcessor.ps1"
