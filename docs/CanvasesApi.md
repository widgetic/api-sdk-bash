# CanvasesApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCanvas_0**](CanvasesApi.md#createCanvas_0) | **POST** /canvases | Create Canvas
[**deleteCanvas_0**](CanvasesApi.md#deleteCanvas_0) | **DELETE** /canvases/{id} | Delete Canvas
[**getAllCanvases_0**](CanvasesApi.md#getAllCanvases_0) | **GET** /canvases | Get All Canvases
[**getCanvas_0**](CanvasesApi.md#getCanvas_0) | **GET** /canvases/{id} | Get Canvas
[**updateCanvas_0**](CanvasesApi.md#updateCanvas_0) | **PUT** /canvases/{id} | Update Canvas



## createCanvas_0

Create Canvas

Creates a new canvas with the specified properties.

To make the canvas for one of your managed users, send 'managedUserId' or 'managedUserExternalId'. The canvas
stays in your account and is yours to edit; the tag lets you list one user's canvases with 'getAllCanvases'.
The managed user must be yours and active: one that is not yours, or does not exist, is answered with 404 and
'MANAGED_USER_NOT_FOUND', and one that is switched off with 409 and 'MANAGED_USER_INACTIVE'. The tag is set
here and does not change afterwards. Called with an editor session, the canvas is always made for the
session's managed user.

### Example

```bash
client.sh createCanvas_0
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCanvasRequest** | [**CreateCanvasRequest**](CreateCanvasRequest.md) |  |

### Return type

[**CanvasResponse**](CanvasResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteCanvas_0

Delete Canvas

Deletes a canvas together with every widget on it.

Called with an editor session, only a canvas whose widgets were all made for the session's managed user can
be deleted; one that also holds somebody else's widgets is refused with 409 and 'CANVAS_HAS_OTHER_WIDGETS',
and nothing is deleted. Delete such a canvas with your API key.

### Example

```bash
client.sh deleteCanvas_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the canvas | [default to null]

### Return type

[**CanvasResponse**](CanvasResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getAllCanvases_0

Get All Canvases

Retrieves all canvases with pagination support and filtering options.

Pass 'managedUserId' (Widgetic's id for one of your managed users) or 'managedUserExternalId' (your own
identifier for the user) to list only the canvases made for that managed user. The canvases of your other
managed users, and your own, are left out. A managed user that is not yours, or does not exist, is answered
with 404 and 'MANAGED_USER_NOT_FOUND'. Called with an editor session, the list is always the session's
managed user's.

### Example

```bash
client.sh getAllCanvases_0  page=value  size=value  sort=value  createdAfter=value  createdBefore=value  updatedAfter=value  updatedBefore=value  managedUserId=value  managedUserExternalId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer** | Page number for pagination | [optional] [default to 1]
 **size** | **integer** | Number of items per page | [optional] [default to 20]
 **sort** | **string** | Sort field and direction (e.g., \"created_at:desc\") | [optional] [default to created_at:desc]
 **createdAfter** | **string** | Filter canvases created after the specified date (ISO 8601 format) | [optional] [default to null]
 **createdBefore** | **string** | Filter canvases created before the specified date (ISO 8601 format) | [optional] [default to null]
 **updatedAfter** | **string** | Filter canvases updated after the specified date (ISO 8601 format) | [optional] [default to null]
 **updatedBefore** | **string** | Filter canvases updated before the specified date (ISO 8601 format) | [optional] [default to null]
 **managedUserId** | **string** | List only the canvases made for this managed user (Widgetic's id for the user). Send this or 'managedUserExternalId', not both. | [optional] [default to null]
 **managedUserExternalId** | **string** | List only the canvases made for the managed user you registered with this 'externalId' (your own identifier for the user). Send this or 'managedUserId', not both. | [optional] [default to null]

### Return type

[**GetAllCanvasesResponse**](GetAllCanvasesResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCanvas_0

Get Canvas

Retrieves a specific canvas by ID.

### Example

```bash
client.sh getCanvas_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the canvas | [default to null]

### Return type

[**CanvasResponse**](CanvasResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateCanvas_0

Update Canvas

Updates an existing canvas with the specified properties.

### Example

```bash
client.sh updateCanvas_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the canvas to update | [default to null]
 **updateCanvasRequest** | [**UpdateCanvasRequest**](UpdateCanvasRequest.md) |  |

### Return type

[**CanvasResponse**](CanvasResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

