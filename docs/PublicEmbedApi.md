# PublicEmbedApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**callPublicCompositionAdapter_0**](PublicEmbedApi.md#callPublicCompositionAdapter_0) | **POST** /embed/compositions/{compositionId}/adapters/{adapterId}/{operation} | Call a gateway operation of an adapter a published widget uses
[**createPublicCompositionEntry_0**](PublicEmbedApi.md#createPublicCompositionEntry_0) | **POST** /embed/compositions/{compositionId}/entries/{table} | Append a visitor entry through the gateway
[**getPublicCompositionEmbed_0**](PublicEmbedApi.md#getPublicCompositionEmbed_0) | **GET** /embed/compositions/{compositionId} | Resolve a composition UUID to a published widget URL
[**getPublicCompositionIframe_0**](PublicEmbedApi.md#getPublicCompositionIframe_0) | **GET** /embed/compositions/{compositionId}/frame | Embed a published composition with its saved values
[**getPublicWorkflowFrame_0**](PublicEmbedApi.md#getPublicWorkflowFrame_0) | **GET** /embed/workflows/{workflowId}/frame | Show a published Workflow in a page of its own
[**getPublicWorkflowVersion_0**](PublicEmbedApi.md#getPublicWorkflowVersion_0) | **GET** /embed/workflows/{workflowId}/versions/{versionId} | Read one published version of a Workflow
[**getPublicWorkflow_0**](PublicEmbedApi.md#getPublicWorkflow_0) | **GET** /embed/workflows/{workflowId} | Read the published Workflow of an embed
[**postPublicCompositionEmbedStatus_0**](PublicEmbedApi.md#postPublicCompositionEmbedStatus_0) | **POST** /embed/compositions/status | Batch-check whether compositions are currently served for embed
[**reportPublicWorkflowEvents_0**](PublicEmbedApi.md#reportPublicWorkflowEvents_0) | **POST** /embed/workflows/{workflowId}/events | Report what visitors did in a Workflow, as counts
[**uploadPublicCompositionAdapterFile_0**](PublicEmbedApi.md#uploadPublicCompositionAdapterFile_0) | **PUT** /embed/compositions/{compositionId}/adapters/upload/files/{ticket} | Send the file a visitor chose through the upload adapter of a published widget



## callPublicCompositionAdapter_0

Call a gateway operation of an adapter a published widget uses

The door a widget's adapter module calls, from the visitor's browser, for the operations that cannot run in the browser: anything with a secret, a charge in credits or the owner's storage behind it. A widget that uses such an adapter is handed the address of this route as 'adapters.url' in its 'widgetic:host' message (see the host bridge contract) and calls '{adapters.url}/{adapterId}/{operation}'. It is not meant to be called by hand, and it takes no API key.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/adapters/{adapterId}/{operation}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**What it serves.** Only an adapter, and a version of it, that the widget's LIVE manifest (what the version that is published uses) lists, and only an operation that runs on the gateway. Anything else is one 404 'ADAPTER_NOT_AVAILABLE', whatever the reason, so the route is no way to ask what a widget contains. An adapter an administrator stopped offering to NEW widgets keeps serving the widgets that already use it.
**Who may call.** The same rule as the entry route: a permitted 'Origin' header, which is the artifact origin the widget runs from or any website when the owner has not restricted the allowed websites (when the owner has, one of the websites the owner listed, Widgetic's own sites, the visitor's own machine or the owner's own platform). Page script cannot forge it. A request without a permitted 'Origin' is 403 'ORIGIN_NOT_ALLOWED'. A composition that is not served (unpublished, or its owner's plan does not serve it) is 404, with the codes of the other public embed routes. When the partner of the owner signs the host context, a context that is not signed as the partner requires is refused with 403 'CONTEXT_SIGNATURE_REQUIRED', 'CONTEXT_SIGNATURE_INVALID' or 'CONTEXT_SIGNATURE_EXPIRED'.
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

Public append-only write into a published composition database. No API key. The browser must send a permitted 'Origin' header: the artifact iframe origin, or any website when the owner has not restricted the allowed websites (when the owner has, one of the websites the owner listed, Widgetic's own sites, the visitor's own machine or the owner's own platform). When the request comes from the shared artifact origin, it must also carry the per-composition write token ('X-Widgetic-Write-Token' header or 'writeToken' body field, handed to the widget in 'widgetic:host' as 'entries.writeToken' and returned as 'entryWriteToken' on 'getPublicCompositionEmbed'). Host 'context' is stored for partner attribution; it is not authenticated unless the partner signs it (see **Signed context**). Request bodies are limited to 16 KB before parsing.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/entries/{table}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**Signed context.** A partner that wants to trust 'context' (to bill a customer by it, say) makes a signing secret ('rotatePartnerEntryContextSecret'), and its server signs the context it hands to the embed. The signature travels inside 'context' as two reserved keys, 'widgetic_exp' (UTC seconds, at most seven days ahead) and 'widgetic_sig'. The gateway checks them after the 'Origin' and before anything else is judged, stored or announced, and keeps and announces the context WITHOUT them. A context that is not signed as the partner requires is refused with 403 'CONTEXT_SIGNATURE_REQUIRED', 'CONTEXT_SIGNATURE_INVALID' or 'CONTEXT_SIGNATURE_EXPIRED'; when the check cannot be made just now the answer is a retryable 503 'CONTEXT_SIGNATURE_UNAVAILABLE', never an unchecked entry. Until a partner makes a secret nothing changes: the two keys are dropped and the rest is taken as it came. A signature is good until its 'widgetic_exp' and may be used again until then, so a partner that must count each submission once keeps a unique value of its own (a 'submissionId', say) in the context. The recipe and a test vector are in the description of 'rotatePartnerEntryContextSecret'.

### Example

```bash
client.sh createPublicCompositionEntry_0 compositionId=value table=value X-Widgetic-Write-Token:value X-Widgetic-Visitor-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **compositionId** | **string** |  | [default to null]
 **table** | **string** |  | [default to null]
 **publicCompositionEntryRequest** | [**PublicCompositionEntryRequest**](PublicCompositionEntryRequest.md) |  |
 **xWidgeticWriteToken** | **string** | Signed per-composition write token handed to the widget in 'widgetic:host' as 'entries.writeToken' (and returned by 'GET /embed/compositions/{compositionId}' as 'entryWriteToken'). Required when the request comes from the shared Widgetic artifact origin; verified whenever present. | [optional] [default to null]
 **xWidgeticVisitorId** | **string** | A random id the widget's browser makes once and keeps (16 to 64 characters of 'A-Za-z0-9_-'), sent so a table's per-visitor 'limit' (declared in the widget database file) can count this browser. Not an identity and not a secret. Without it, or with a malformed value, the limit counts only by network address. | [optional] [default to null]

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


## getPublicWorkflowFrame_0

Show a published Workflow in a page of its own

A page that runs a published workflow, for a place that can only be given an address or an iframe: a chat messenger, a link page, a site builder, a blog that follows oEmbed. No API key, no SDK to add. The page holds the Embed SDK and the same tag a website carries ('<widgetic workflow-id composition-id>'), so a visitor moves from one composition to the next in place, by the same rules, exactly as on a website. A paused workflow shows its first composition alone, as its embeds do.
**What the frame can count.** Only what happens inside it: entries, a widget's goals and actions, and waits. The page events a website can send to a workflow ('widgetic:workflow-event') are events of the page around the embed, and they do not cross an iframe, so a connection that waits for one never fires from a frame.
A workflow that is a draft, is archived, or does not exist, and one whose owner is not being served, answers 404 with a short page that gives no reason. If the owner of the workflow's first composition listed the websites it may appear on, the page is sent with 'Content-Security-Policy: frame-ancestors' naming those websites (and Widgetic's own), so a browser refuses to show it inside any other website. Opening the address directly still works. An owner who listed nothing is not restricted.
The page links its oEmbed card, so a site that follows oEmbed turns the address of the frame into an embed.
**Address.** 'https://api.widgetic.com/embed/workflows/{workflowId}/frame': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.

### Example

```bash
client.sh getPublicWorkflowFrame_0 workflowId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowId** | **string** |  | [default to null]

### Return type

**string**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: text/html, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPublicWorkflowVersion_0

Read one published version of a Workflow

Public read of one version of a workflow, for a visitor who started on it before a newer one was published: they finish on the version they started on (for up to 30 days; after that they get the latest). The graph of a version never changes once published; the languages its compositions can be shown in ('translations') are read each time, as for the live version. Like the read of the live version, it answers 'status: paused' with nothing else while the workflow is paused, and 404 when the workflow is a draft or archived, or has no such version.
**Address.** 'https://api.widgetic.com/embed/workflows/{workflowId}/versions/{versionId}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.

### Example

```bash
client.sh getPublicWorkflowVersion_0 workflowId=value versionId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowId** | **string** |  | [default to null]
 **versionId** | **string** |  | [default to null]

### Return type

[**GetPublicWorkflow200Response**](GetPublicWorkflow200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPublicWorkflow_0

Read the published Workflow of an embed

Public read of a workflow for the embed that carries 'workflow-id'. No API key. The answer is the live version (its graph, the composition a new visitor starts on, the time zone, the languages its compositions can be shown in, and the token that lets the browser report counts), or 'status: paused' with nothing else, in which case the embed shows only its first composition. A workflow that is a draft, archived or unknown answers 404, and the embed then behaves as a plain embed of its 'composition-id'. So does a workflow whose owner is not being served (a plan that lapsed, a partner whose agreement is not in force): the answer is the one the compositions of that owner give.
**Address.** 'https://api.widgetic.com/embed/workflows/{workflowId}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
The answer may be reused for a few seconds ('Cache-Control: public, max-age=15'), so a publish or a pause reaches visitors within moments. The graph is readable by anyone who has the workflow's id: its rules run in the visitor's browser, so a rule must never hold a secret.

### Example

```bash
client.sh getPublicWorkflow_0 workflowId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowId** | **string** |  | [default to null]

### Return type

[**GetPublicWorkflow200Response**](GetPublicWorkflow200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

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


## reportPublicWorkflowEvents_0

Report what visitors did in a Workflow, as counts

Public report of counts for a workflow, sent by the embed. No API key. Each event is one id and a number: a visitor reached a block ('n'), took a connection ('e'), or could not be moved on ('f'). Nothing else is kept: no visitor, no value a visitor typed, no address. A batch carries at most 100 events and 16 KB. The same report may carry 'heights': how tall a step settled at in the browser, which the embed code of the workflow uses to start its box at a real height (a composition, a whole number of pixels, nothing about the visitor).
A report is accepted only with the 'token' the workflow's own read handed out for that 'versionId', so a page that never read the workflow cannot raise its numbers. An expired token ('EVENT_TOKEN_EXPIRED') is refused with 401: read the workflow again for a new one. Counts for ids that are not in that version, or for a workflow that is not live, are not recorded and the answer says so ('recorded: false') with 200: the visitor's page has nothing to fix.
The body is JSON, sent as 'application/json' or as 'text/plain' (a \"simple\" cross-origin request, which is what lets a report leave a page that is being closed).
**Address.** 'https://api.widgetic.com/embed/workflows/{workflowId}/events': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.

### Example

```bash
client.sh reportPublicWorkflowEvents_0 workflowId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workflowId** | **string** |  | [default to null]
 **publicWorkflowEventsRequest** | [**PublicWorkflowEventsRequest**](PublicWorkflowEventsRequest.md) |  |

### Return type

[**ReportPublicWorkflowEvents200Response**](ReportPublicWorkflowEvents200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, text/plain
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## uploadPublicCompositionAdapterFile_0

Send the file a visitor chose through the upload adapter of a published widget

The second of the two calls the 'upload' adapter's module makes from the visitor's browser (the first, the 'begin-upload' operation of 'callPublicCompositionAdapter', answers with the ticket this route takes). The module sends the file itself, as the body, with its media type as the 'Content-Type'. It is not meant to be called by hand, and it takes no API key.
**Address.** 'https://api.widgetic.com/embed/compositions/{compositionId}/adapters/upload/files/{ticket}': the root of the API host, NOT under '/v1'. A client generated from this description for 'https://api.widgetic.com/v1' must be given the base address 'https://api.widgetic.com' for the calls of the 'Public Embed' tag.
**The ticket.** Single-use and valid for ten minutes, given for one file: its name, its media type and its exact size are what the visitor said when the ticket was asked for, after the widget's owner's settings (the kinds of file they take, the largest size) were applied. The 'Content-Type' and the 'Content-Length' of this request must be those, and the body must be exactly that many bytes (400 'UPLOAD_FILE_CHANGED' otherwise). The gateway never believes the type it was told: the first bytes of the file must be a file of that type and one the owner accepts (422 otherwise). A ticket whose file was stored and is sent again is answered with the same file, so a visitor whose connection dropped after the file landed does not store it twice; a ticket whose attempt failed is spent, and the module asks for a new one.
**The virus check.** Before anything is stored, the file is checked for viruses, wherever it would be kept (Widgetic's storage or a partner's own bucket). A file that fails the check is refused with 422 'UPLOAD_FILE_UNSAFE' and nothing is stored. When the check cannot be done, nothing is stored either, and the answer is the same neutral 503 'UPLOAD_UNAVAILABLE' as for any other cause the visitor is not told. The ticket of a refused file is spent.
**What it stores.** The file goes to the widget owner's storage: Widgetic's, or the partner's own bucket for a widget of a customer a partner manages. It counts against the owner's storage allowance and is filed in the folder the owner chose, as a file sent by a visitor, which the owner's own file list leaves out. A full allowance, a partner's storage that cannot be used and a stopped feature are all the same 503 'UPLOAD_UNAVAILABLE' to a visitor, and the owner is told through a notice.
**Who may call.** The same rule as the entry route: a permitted 'Origin' header, which is the artifact origin the widget runs from or any website when the owner has not restricted the allowed websites (when the owner has, one of the websites the owner listed, Widgetic's own sites, the visitor's own machine or the owner's own platform). A request without a permitted 'Origin' is 403 'ORIGIN_NOT_ALLOWED'. A composition that is not served (unpublished, or its owner's plan does not serve it) is 404, with the codes of the other public embed routes.
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

