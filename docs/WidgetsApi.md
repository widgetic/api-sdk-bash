# WidgetsApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCompositionFromWidget_0**](WidgetsApi.md#createCompositionFromWidget_0) | **POST** /widgets/{id}/composition | Create a composition for a widget in one call
[**createWidget_0**](WidgetsApi.md#createWidget_0) | **POST** /widgets | Create Widget
[**getWidgetsBatch_0**](WidgetsApi.md#getWidgetsBatch_0) | **POST** /widgets/batch | Get Widgets Batch
[**getWidgets_0**](WidgetsApi.md#getWidgets_0) | **GET** /widgets | List Widgets



## createCompositionFromWidget_0

Create a composition for a widget in one call

After a managed user publishes a widget from the creator, call this with the widget id, the customer's
managed user (when the widget is not already filed under one), and optional content, design, embed settings
and locale. Every input is validated before a single insert; a failure never leaves a half-made composition.

When the widget is already tagged with a managed user, you may omit 'managedUserId'. When you send it, it
must match that tag.

A widget that keeps what visitors send (a form, a vote, a rating) declares its tables in its own source
('src/lib/meta/database.json'); they are made for the composition here, in a schema of its own, as the widget
was when it was last published. A widget that keeps nothing leaves the composition without tables. If the
tables cannot be made just now, or the widget's file cannot be used, the composition is still created ('201')
and 'meta.warnings' says why; the tables are made the next time the widget is generated.

The widget must be published. The 'Idempotency-Key' header is required.

### Example

```bash
client.sh createCompositionFromWidget_0 id=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The widget id | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **createCompositionFromWidgetRequest** | [**CreateCompositionFromWidgetRequest**](CreateCompositionFromWidgetRequest.md) |  |

### Return type

[**CreateCompositionFromWidget201Response**](CreateCompositionFromWidget201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createWidget_0

Create Widget

Creates a widget for your account: a named record with a type and some starting content, on a canvas of
its own (or one of yours that you name). It costs no credits and has no code yet; the code is generated for
it afterwards. The new widget is yours, and you can list it with 'getWidgets'. A widget is a draft until
you say otherwise ('isDraft: false').

If a step after the widget was saved does not go through, the widget is still created, and
'data.warnings' says what did not. Read it before relying on the widget.

A widget can be placed on one of your canvases ('canvasId'), in a project you can edit ('projectId') or in an
organization where you may create widgets ('organizationId'). Naming anything you cannot use is refused
with 403, and the answer is the same whether it exists or not.

To make the widget for one of your managed users, send 'managedUserId' or 'managedUserExternalId'. The widget
stays in your account and is yours to edit; the tag lets you list one user's widgets with 'getWidgets'. The
managed user must be yours and active: one that is not yours, or does not exist, is answered with 404 and
'MANAGED_USER_NOT_FOUND', and one that is switched off with 409 and 'MANAGED_USER_INACTIVE'. The tag is set
here and does not change afterwards.

This call has a limit of its own: 120 per minute for each account (ask Widgetic if you need more). Past
that the call is answered with 429 and a 'Retry-After'. A widget has no database of its own: what the
visitors of a composition leave is kept in the tables of that composition, made when the composition is.
The 'Idempotency-Key' header is required; send the same key when you retry, so one widget is created, not
two.

### Example

```bash
client.sh createWidget_0 Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **string** | A unique value (a UUID is fine) that makes a retry of this request safe. | [default to null]
 **newWidget** | [**NewWidget**](NewWidget.md) |  |

### Return type

[**CreateWidget201Response**](CreateWidget201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getWidgetsBatch_0

Get Widgets Batch

Retrieves multiple widgets by their IDs in a single request. An id that is not found, or that is not yours, is reported in 'errors' exactly like one that does not exist. Called with an editor session, only the widgets made for the session's managed user are returned.

### Example

```bash
client.sh getWidgetsBatch_0
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getWidgetsBatchRequest** | [**GetWidgetsBatchRequest**](GetWidgetsBatchRequest.md) |  |

### Return type

[**GetWidgetsBatchResponse**](GetWidgetsBatchResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getWidgets_0

List Widgets

Lists the widgets your account owns, newest first. A widget is the reusable piece a composition is made
from; this is your own library, not a catalogue of Widgetic's widgets.

Pass 'page' (counting from 1) and 'size' (1 to 100, 20 when left out) to read the list one page at a time.
'meta' then carries 'total', 'hasNextPage' and 'hasPreviousPage', so a client can walk the list to its end.
A page past the end is an empty list. Without 'page' and 'size' the call returns the whole list in one
response, which only suits an account with a few widgets.

Pass 'canvasId' to list only the widgets on one of your canvases. That list is always returned whole,
whatever 'page' and 'size' say.

Pass 'managedUserId' (Widgetic's id for one of your managed users) or 'managedUserExternalId' (your own
identifier for the user) to list only the widgets made for that managed user. The widgets of your other
managed users, and your own, are left out. It combines with 'page', 'size' and 'canvasId'. A managed user
that is not yours, or does not exist, is answered with 404 and 'MANAGED_USER_NOT_FOUND'.

### Example

```bash
client.sh getWidgets_0  page=value  size=value  canvasId=value  managedUserId=value  managedUserExternalId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer** | Page to return, counting from 1. Giving 'page' or 'size' turns paging on. | [optional] [default to null]
 **size** | **integer** | How many widgets a page holds (20 when 'page' is given without it). Giving 'page' or 'size' turns paging on. | [optional] [default to null]
 **canvasId** | **string** | List only the widgets on this canvas. The list is returned whole. | [optional] [default to null]
 **managedUserId** | **string** | List only the widgets made for this managed user (Widgetic's id for the user). Send this or 'managedUserExternalId', not both. | [optional] [default to null]
 **managedUserExternalId** | **string** | List only the widgets made for the managed user you registered with this 'externalId' (your own identifier for the user). Send this or 'managedUserId', not both. | [optional] [default to null]

### Return type

[**GetWidgets200Response**](GetWidgets200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

