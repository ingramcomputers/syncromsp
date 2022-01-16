Import-Module $env:ProgramData\Syncro\bin\module.psm1

$SyncroSubdomain = "YOURSUBDOMAIN"
$SyncroAPIKey = "YOUR-API-KEY"
$SyncroID = "0123456789"
$tsubject = "Ticket Subject"
$tstatus = "New"
$ttype = "Maintenance"

function Create-Syncro-Ticket ($SyncroSubdomain,$SyncroAPIKey,$Subject,$CustomerID,$IssueType,$Status,$AssetName,$Created) {
  IF($AssetName){
    $assets = Query-Syncro-Assets $SyncroSubdomain $SyncroAPIKey $AssetName
    IF($assets.assets.count -gt 0){
      $AssetIds = @($assets.assets[0].id)
    } ELSE {
      $AssetIDs = $null
    }
  } ELSE {
    $AssetIDs = $null
  }
  $NewTicket = @{
      customer_id=$CustomerID
      subject=$Subject
      problem_type=$IssueType
      status="Monthly Maintenance"
      asset_ids=$AssetIds
      created_at=$Created
      api_key=$SyncroAPIKey
  }
  $body = (ConvertTo-Json $NewTicket)
  $url = "https://$SyncroSubdomain.syncromsp.com/api/v1/tickets"
  $response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType 'application/json'
  $response
}

function Create-Syncro-Ticket-TimerEntry ($SyncroSubdomain,$SyncroAPIKey,$TicketID, $StartTime,$DurationMinutes,$recorded,$Notes,$UserID) {
  $NewTimer = @{
      ticket_id=$TicketID
      start_at=$StartTime
      duration_minutes=$DurationMinutes
      notes=$Notes
      user_id= if ($UserID) {$UserID} else {$null}
      recorded=$recorded
      api_key=$SyncroAPIKey
  }
  $postBody = (ConvertTo-Json $NewTimer)
  Write-Output $postBody
  $url = "https://$SyncroSubdomain.syncromsp.com/api/v1/tickets/$TicketID/timer_entry"
  $response = Invoke-RestMethod -Uri $url -Method Post -Body $postBody -ContentType 'application/json'
  $response
}

function Charge-Time ($SyncroSubdomain,$SyncroAPIKey,$TicketID,$TimerID) {
  $Charge = @{
      id=$TicketID
      timer_entry_id=$TimerID
      api_key=$SyncroAPIKey
  }
  $postBody = (ConvertTo-Json $Charge)
  $url = "https://$SyncroSubdomain.syncromsp.com/api/v1/tickets/$TicketID/charge_timer_entry"
  $response = Invoke-RestMethod -Uri $url -Method Post -Body $postBody -ContentType 'application/json'
  $response
}



$newticket = create-syncro-ticket $SyncroSubdomain $SyncroAPIKey $tsubject $SyncroID $ttype $tstatus

$newtimerentry = create-syncro-ticket-timerentry $syncrosubdomain $syncroapikey $newticket.ticket.id (Get-Date).AddMinutes(-30).toString("o") 30 "Test Charge Time" $null

$ChargerTimeEntry = Charge-Time $syncrosubdomain $syncroapikey $newticket.ticket.id $newtimerentry.id
