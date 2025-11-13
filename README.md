# dogceo
api for dog.ceo  dog image site 
# Example
```nim
import asyncdispatch, dogceo, json, strutils
let data = waitFor random_dog()
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
