
$Name="hello.zip"
If (Test-Path $Name){
	Remove-Item $Name
}
$Name="world.zip"
If (Test-Path $Name){
	Remove-Item $Name
}
dep ensure
$OLD_GOOS=$env:GOOS
$env:GOOS="linux"
go build -ldflags="-s -w" -o bin/hello hello/main.go
go build -ldflags="-s -w" -o bin/world world/main.go
$env:GOOS=$OLD_GOOS
wsl zip -r hello.zip bin/hello
wsl zip -r world.zip bin/world
