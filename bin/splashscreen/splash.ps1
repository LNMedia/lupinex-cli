Set-ExecutionPolicy -Scope CurrentUser Bypass -Force
Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase
Add-Type -AssemblyName System.Windows.Forms  # Load WinForms for screen info

# Path to the splash image (relative to this script)
$imgPath = Join-Path $PSScriptRoot "splash.png"

# Prepare the bitmap image
$bitmap = New-Object Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.UriSource = New-Object Uri("file:///$imgPath")
$bitmap.CacheOption = [System.Windows.Media.Imaging.BitmapCacheOption]::OnLoad
$bitmap.EndInit()

# Create a new window
$win = New-Object Windows.Window

# Get all connected monitors
$monitors = [System.Windows.Forms.Screen]::AllScreens
# Select the primary (main) monitor
$primary = $monitors | Where-Object { $_.Primary }
# Get the bounds (position and size) of the primary monitor
$screenBounds = $primary.Bounds

# Set window size
$win.Width  = 800
$win.Height = 400

# Calculate the window position to center it on the primary monitor
$win.Left = $screenBounds.Left + (($screenBounds.Width - $win.Width) / 2)
$win.Top  = $screenBounds.Top + (($screenBounds.Height - $win.Height) / 2)

# Set window startup location to manual to apply custom position
$win.WindowStartupLocation = 'Manual'

# Window styling for splash screen
$win.WindowStyle = 'None'         # No window border or title bar
$win.AllowsTransparency = $true   # Allow transparent background
$win.Background = 'Transparent'   # Set background to transparent
$win.ResizeMode = 'NoResize'      # Disable resizing
$win.Topmost = $true              # Keep window on top of others

# Create an image control and assign the bitmap as its source
$img = New-Object Windows.Controls.Image
$img.Source = $bitmap
$img.Stretch = 'Uniform'          # Maintain image aspect ratio

# Set the window content to the image
$win.Content = $img

# Show the window
$win.Show()

# Keep the splash visible for 3 seconds
Start-Sleep -Seconds 3

# Close the window after the delay
$win.Close()