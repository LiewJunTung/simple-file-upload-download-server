# simple-file-upload-download-https-server

A simple host file to quickly upload or download file, from curl ([curl for windows](https://curl.haxx.se/download.html)) command.

No user no authentication no complexity

Upload a file :

```
curl -F file=@myFile.zip http://domain.com
>>
{"downloadLink":"http://domain.com/file?file=myFile.zip","curl":"curl http://domain.com/file?file=myFile.zip > myFile.zip"}
```

Download the file from your browser or use curl command display after upload

# Compilation

install tsc :

```
npm install -g tsc
npm install
```

compile with command : 

```
tsc
```

# Run

run with command :

```
node server.js {port} {dest_folder} {publicurl}
ex
node server.js 9000 ./upload http://domain.com
```

to upload a file :

```
curl http://domain.com/file?file=myFile.zip > myFile.zip
```

# Docker

```
docker run -d -e SERVER="https://192.168.1.47:8082" -p 8082:3000 -v /Users/user/tmp:/tmp liewjuntung/simple-upload-download-https-server
```
