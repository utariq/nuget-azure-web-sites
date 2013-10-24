param($installPath, $toolsPath, $package, $project)

$extensionFile = $project.ProjectItems.Item("newrelic").ProjectItems.Item("extensions").ProjectItems.Item("extension.xsd")
if($extensionFile -ne $null){
	$extensionFile.Properties.Item("BuildAction").Value = 2
}

Write-Host "***Package install is complete***" -ForegroundColor DarkGreen
	
Write-Host "Please make sure to go add the following configurations to your Azure website." -ForegroundColor DarkGreen
Write-Host "Go to manage.windowsazure.com, log in, navigate to your Web Site, choose 'configure' and add the following as 'app settings' " -ForegroundColor DarkGreen

#Write-Host $appSettings | Format-Table @{Expression={$_.Key};Label="Key";width=25},Value
Write-Host "Key					Value"
Write-Host "---------------------------------------"
Write-Host "COR_ENABLE_PROFILING	1"
Write-Host "COR_PROFILER			{71DA0A04-7777-4EC6-9643-7D28B46A8A41}"
Write-Host "COR_PROFILER_PATH		C:\Home\site\wwwroot\newrelic\NewRelic.Profiler.dll"
Write-Host "NEWRELIC_HOME			C:\Home\site\wwwroot\newrelic"

