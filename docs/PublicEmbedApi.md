# PublicEmbedApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**callPublicCompositionAdapter_0**](PublicEmbedApi.md#callPublicCompositionAdapter_0) | **POST** /embed/compositions/{compositionId}/adapters/{adapterId}/{operation} | Call a gateway operation of an adapter a published widget uses
[**createPublicCompositionEntry_0**](PublicEmbedApi.md#createPublicCompositionEntry_0) | **POST** /embed/compositions/{compositionId}/entries/{table} | Append a visitor entry through the gateway
[**getPublicCompositionEmbed_0**](PublicEmbedApi.md#getPublicCompositionEmbed_0) | **GET** /embed/compositions/{compositionId} | Resolve a composition UUID to a published widget URL
[**getPublicCompositionIframe_0**](PublicEmbedApi.md#getPublicCompositionIframe_0) | **GET** /embed/compositions/{compositionId}/frame | Embed a published composition with its saved values
[**postPublicCompositionEmbedStatus_0**](PublicEmbedApi.md#postPublicCompositionEmbedStatus_0) | **POST** /embed/compositions/status | Batch-check whether compositions are currently served for embed
[**uploadPublicCompositionAdapterFile_0**](PublicEmbedApi.md#uploadPublicCompositionAdapterFile_0) | **PUT** /embed/compositions/{compositionId}/adapters/upload/files/{ticket} | Send the file a visitor chose through the upload adapter of a published widget



## callPublicCompositionAdapter_0

Call a gateway operation of an adapter a published widget uses

The door a widget's adapter module calls, from the visitor's browser, for the operations that cannot run in the browser: anything with a secret, a charge in credits or the owner's storage behind it. A widget that uses such an adapter is handed the address of this route as 'adapters.url' in its 'widgetic:host' message (see the host bridge contract) and calls '{adapters.url}/{adapterId}/{operation}'. It is not meant to be called by hand, and it takes no API key.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/adapters/{adapterId}/{operation}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**What it serves.** Only an adapter, and a version of it, that the widget's LIVE manifest (what the version that is published uses) lists, and only an operation that runs on the gateway. Anything else is one 404 'ADAPTER_NOT_AVAILABLE', whatever the reason, so the route is no way to ask what a widget contains. An adapter an administrator stopped offering to NEW widgets keeps serving the widgets that already use it.
**Who may call.** The same rule as the entry route: a permitted 'Origin' header, which is the artifact origin the widget runs from or a website the owner allowed (or the owner's own platform). Page script cannot forge it. A request without a permitted 'Origin' is 403 'ORIGIN_NOT_ALLOWED'. A composition that is not served (unpublished, or its owner's plan does not serve it) is 404, with the codes of the other public embed routes. When the partner of the owner signs the host context, a context that is not signed as the partner requires is refused with 403 'CONTEXT_SIGNATURE_REQUIRED', 'CONTEXT_SIGNATURE_INVALID' or 'CONTEXT_SIGNATURE_EXPIRED'.
**Cost and retries.** An operation priced in credits is charged to the owner of the widget (for a customer a partner manages, to the partner's administrator, within the monthly credits set for that customer), once for each 'requestId', before it runs, and given back if it does not answer. A 'requestId' that was charged and not given back is 409 'REQUEST_ALREADY_USED' and the operation is NOT run a second time; one whose charge was given back may be tried again with the same 'requestId'. A visitor never sees an owner's balance: a feature that cannot be used because its owner has no credits left, because the customer's monthly credits are spent, or because an administrator stopped the adapter, is the same 503 'ADAPTER_UNAVAILABLE' as every other \"not right now\". The owner is told through a notice.
**Limits.** In front of everything, 120 calls a minute for each visitor address and composition and 600 a minute for a composition (429 'RATE_LIMITED'). Then, for each operation of a widget, a rate for each visitor address a minute and a cap for the widget a day: 30 and 5000 for an operation that is free, 10 and 500 for one that costs credits, unless the adapter says otherwise (never above 120 and 100000). A visitor over the rate is 429 'RATE_LIMITED'; a widget over its cap is 429 'WIDGET_LIMIT_REACHED'. Both carry a 'Retry-After' header. The body is at most 64 KiB (413 'PAYLOAD_TOO_LARGE') and JSON (415 'UNSUPPORTED_MEDIA_TYPE'); an operation has 30 seconds to answer (504 'ADAPTER_TIMEOUT', and the charge is given back).

### Example

```bash
client.sh callPublicCompositionAdapter_0 compositionId=value adapterId=value operation=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **compositionId** | **string** |  | [default to null]
 **adapterId** | **string** | The id of the adapter, the name its module is known by, for example 'upload'. | [default to null]
 **operation** | **string** | The name of one operation of the adapter, as its documentation gives it. | [default to null]
 **publicAdapterCallRequest** | [**PublicAdapterCallRequest**](PublicAdapterCallRequest.md) |  |

### Return type

[**PublicAdapterCallResult**](PublicAdapterCallResult.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createPublicCompositionEntry_0

Append a visitor entry through the gateway

Public append-only write into a published composition database. No API key. The browser must send a permitted 'Origin' header (the artifact iframe origin or a website the owner allowed). When the request comes from the shared artifact origin, it must also carry the per-composition write token ('X-Widgetic-Write-Token' header or 'writeToken' body field, handed to the widget in 'widgetic:host' as 'entries.writeToken' and returned as 'entryWriteToken' on 'getPublicCompositionEmbed'). Host 'context' is stored for partner attribution; it is not authenticated unless the partner signs it (see **Signed context**). Request bodies are limited to 16 KB before parsing.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/entries/{table}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**Signed context.** A partner that wants to trust 'context' (to bill a customer by it, say) makes a signing secret ('rotatePartnerEntryContextSecret'), and its server signs the context it hands to the embed. The signature travels inside 'context' as two reserved keys, 'widgetic_exp' (UTC seconds, at most seven days ahead) and 'widgetic_sig'. The gateway checks them after the 'Origin' and before anything else is judged, stored or announced, and keeps and announces the context WITHOUT them. A context that is not signed as the partner requires is refused with 403 'CONTEXT_SIGNATURE_REQUIRED', 'CONTEXT_SIGNATURE_INVALID' or 'CONTEXT_SIGNATURE_EXPIRED'; when the check cannot be made just now the answer is a retryable 503 'CONTEXT_SIGNATURE_UNAVAILABLE', never an unchecked entry. Until a partner makes a secret nothing changes: the two keys are dropped and the rest is taken as it came. A signature is good until its 'widgetic_exp' and may be used again until then, so a partner that must count each submission once keeps a unique value of its own (a 'submissionId', say) in the context. The recipe and a test vector are in the description of 'rotatePartnerEntryContextSecret'.

### Example

```bash
client.sh createPublicCompositionEntry_0 compositionId=value table=value X-Widgetic-Write-Token:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **compositionId** | **string** |  | [default to null]
 **table** | **string** |  | [default to null]
 **publicCompositionEntryRequest** | [**PublicCompositionEntryRequest**](PublicCompositionEntryRequest.md) |  |
 **xWidgeticWriteToken** | **string** | Signed per-composition write token handed to the widget in 'widgetic:host' as 'entries.writeToken' (and returned by 'GET /embed/compositions/{compositionId}' as 'entryWriteToken'). Required when the request comes from the shared Widgetic artifact origin; verified whenever present. | [optional] [default to null]

### Return type

[**PublicCompositionEntryCreated**](PublicCompositionEntryCreated.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPublicCompositionEmbed_0

Resolve a composition UUID to a published widget URL

Public customer embed lookup. No API key. Used by embed-sdk.js on third-party sites.
If the composition's owner listed the websites it may appear on (the workspace's domain list, or the 'allowedDomains' of a partner the owner administers), a request from any other website is refused with 403 'DOMAIN_NOT_ALLOWED'. The website is read from the 'Origin' header, or the host of 'Referer' when there is no 'Origin'; a request that names neither (a server, a tool) is not refused. An owner who listed nothing is not restricted, and a page on the visitor's own machine ('localhost', '127.0.0.1' or '[::1]', on any port) is always allowed. So is the website where a partner integrates Widgetic, with every subdomain of it ('platformDomain' in the answer of 'GET /partners/mine'), for the widgets of that partner: a partner's list never has to name it. The list stops other websites from showing the embed in a visitor's browser; it does not hide the published content from someone who holds the composition ID.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**Limit.** 500 calls for each visitor address and browser in one counting window, shared with the frame and the status routes. Over it the answer is 429 'RATE_LIMITED' with a 'Retry-After' header.

### Example

```bash
client.sh getPublicCompositionEmbed_0 compositionId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **compositionId** | **string** |  | [default to null]

### Return type

[**GetPublicCompositionEmbed200Response**](GetPublicCompositionEmbed200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPublicCompositionIframe_0

Embed a published composition with its saved values

Public HTML wrapper with an inner published artifact iframe. No API key or SDK required.
If the composition's owner listed the websites it may appear on, the page is sent with 'Content-Security-Policy: frame-ancestors' naming those websites (and Widgetic's own, and the website where the partner the owner administers integrates Widgetic, with its subdomains), so a browser refuses to show it inside any other website whatever 'Referer' policy that website uses. Opening the address directly still works. An owner who listed nothing is not restricted.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/frame': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.

### Example

```bash
client.sh getPublicCompositionIframe_0 compositionId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **compositionId** | **string** |  | [default to null]

### Return type

**string**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: text/html, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## postPublicCompositionEmbedStatus_0

Batch-check whether compositions are currently served for embed

Public batch health check for embed-sdk.js. No API key. Uses the same serving gate and domain policy as 'GET /embed/compositions/{compositionId}': the caller's website is read from 'Origin', or the host of 'Referer' when there is no 'Origin'. A request that names neither (a server or tool) is not refused for domain reasons.
**Address.** 'https://api.widgetic.com/embed/compositions/status': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**Limit.** The route counts against the same limit as the lookup and the frame routes: 500 calls for each visitor address and browser in one counting window. A call is ONE hit whatever the number of 'ids' it carries (up to 100), so a server that checks many compositions spends one call for each hundred of them. A visitor who is over the limit gets 429 'RATE_LIMITED' for the WHOLE call, with a 'Retry-After' header and no state for any id: there is no per-composition rate-limit state in the answer.

### Example

```bash
client.sh postPublicCompositionEmbedStatus_0
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postPublicCompositionEmbedStatusRequest** | [**PostPublicCompositionEmbedStatusRequest**](PostPublicCompositionEmbedStatusRequest.md) |  |

### Return type

[**PostPublicCompositionEmbedStatus200Response**](PostPublicCompositionEmbedStatus200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## uploadPublicCompositionAdapterFile_0

Send the file a visitor chose through the upload adapter of a published widget

The second of the two calls the 'upload' adapter's module makes from the visitor's browser (the first, the 'begin-upload' operation of 'callPublicCompositionAdapter', answers with the ticket this route takes). The module sends the file itself, as the body, with its media type as the 'Content-Type'. It is not meant to be called by hand, and it takes no API key.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/adapters/upload/files/{ticket}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**The ticket.** Single-use and valid for ten minutes, given for one file: its name, its media type and its exact size are what the visitor said when the ticket was asked for, after the widget's owner's settings (the kinds of file they take, the largest size) were applied. The 'Content-Type' and the 'Content-Length' of this request must be those, and the body must be exactly that many bytes (400 'UPLOAD_FILE_CHANGED' otherwise). The gateway never believes the type it was told: the first bytes of the file must be a file of that type and one the owner accepts (422 otherwise). A ticket whose file was stored and is sent again is answered with the same file, so a visitor whose connection dropped after the file landed does not store it twice; a ticket whose attempt failed is spent, and the module asks for a new one.
**What it stores.** The file goes to the widget owner's storage: Widgetic's, or the partner's own bucket for a widget of a customer a partner manages. It counts against the owner's storage allowance and is filed in the folder the owner chose, as a file sent by a visitor, which the owner's own file list leaves out. A full allowance, a partner's storage that cannot be used and a stopped feature are all the same 503 'UPLOAD_UNAVAILABLE' to a visitor, and the owner is told through a notice.
**Who may call.** The same rule as the entry route: a permitted 'Origin' header, which is the artifact origin the widget runs from or a website the owner allowed (or the owner's own platform). A request without a permitted 'Origin' is 403 'ORIGIN_NOT_ALLOWED'. A composition that is not served (unpublished, or its owner's plan does not serve it) is 404, with the codes of the other public embed routes.
**Limits.** 30 requests a minute for each visitor address and composition and 240 a minute for a composition (429 'RATE_LIMITED', with a 'Retry-After' header); at most 10 MB for a file, and only so many files held in memory at once on each gateway process (503 'UPLOAD_BUSY', with a 'Retry-After'). A file that does not arrive within two minutes is 408 'UPLOAD_TIMEOUT'. Every answer but a success closes the connection, so a client that is refused before it has sent the file reads the answer and stops.

### Example

```bash
client.sh uploadPublicCompositionAdapterFile_0 compositionId=value ticket=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **compositionId** | **string** |  | [default to null]
 **ticket** | **string** | The ticket the 'begin-upload' operation answered with. | [default to null]
 **body** | **binary** |  |

### Return type

[**PublicAdapterFileResult**](PublicAdapterFileResult.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/pdf, audio/aac, audio/flac, audio/mp4, audio/mpeg, audio/ogg, audio/wav, audio/webm, image/gif, image/heic, image/heif, image/jpeg, image/png, image/webp, video/mp4, video/quicktime, video/webm
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

