function Get-Newsfeed
{
    [CmdletBinding()]
    [OutputType([String])]
    Param
    (
        # Specifies the RSS feed URL
        [Parameter(HelpMessage = 'Enter a valid RSS feed URL',
                   Position = 0,
                   Mandatory=$true,
                   ValueFromPipeline=$false)]
        [ValidateNotNullOrEmpty()]
        [string]
        $NewsFeed,
        # Specifies the number of articles to get
        [Parameter(Mandatory=$false,
                   ValueFromPipeline=$false)]
        [int]
        $Number = 3
    )

    Begin
    {
    }
    Process
    {
        $news = Invoke-RestMethod -Uri $NewsFeed.ToString()
        $news | Select-Object -First $Number | Select-Object -ExpandProperty title
    }
    End
    {
    # Optional One Time commands after process runs
    }
}