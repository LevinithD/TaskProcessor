$Tasks = Get-Content "C:\Users\loc.BOOY3105\My Documents\Powershell\TaskProcessor\Tasks\Tasks.txt"
[Datetime]$Date = Get-Date -Format "dddd dd MMM yyyy HH:mm:ss"

#Create Form
$Form_TaskProcessor = new-object System.Windows.Forms.Form
$Form_TaskProcessor.Text = "TaskProcessor"
$Form_TaskProcessor.Width = 450
$Form_TaskProcessor.Height = 200

#Create Label
$Label_TaskProcessor = New-Object System.Windows.Forms.Label
$Label_TaskProcessor.AutoSize = $true 

#Add Label to Form
$Form_TaskProcessor.Controls.Add($Label_TaskProcessor)

#Show Form
$Form_TaskProcessor.Show()

#Run through script
foreach ($line in $Tasks)
    {
        $fields = $line.Split("`t")

        [Datetime]$ExecutionDate = $fields[1]
       
        $Executiondate

        If( get-date $fields[1] -gt $Date)
            {
                #Add text to form
                
                $Label_TaskProcessor.text = $fields[0], $fields[1]
                
                #Run tasks
                $TaskPath = "C:\Users\loc.BOOY3105\'My Documents'\Powershell\TaskProcessor\Tasks\"
                $TaskPath = $TaskPath + $fields[0] + ".ps1"
                Invoke-Expression -Command $TaskPath

                $fields[0], [datetime]::parseexact($fields[1], 'dd-mmm-yyyy',$null) 
            }
    }
#Close form
#$Form_TaskProcessor.Close() 

#Open Countdown Timer
Invoke-Expression -Command "C:\Users\loc.BOOY3105\'My Documents'\Powershell\TaskProcessor\Timer.ps1"