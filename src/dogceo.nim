import asyncdispatch, httpclient, json, strutils
const api = "https://dog.ceo/api"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "dog.ceo",
    "accept": "application/json"
})

proc random_dog*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/breeds/image/random")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc dog_by_breed*(breed:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/breed/" & breed & "/images/random")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_list_breeds*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/breeds/list/all")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc all_dog_by_breed*(breed:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/breed/" & breed & "/images")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_list_sub_breeds*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/breed/hound/list")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
