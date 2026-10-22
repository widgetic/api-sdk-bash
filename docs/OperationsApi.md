# OperationsApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**operationsIdGet_0**](OperationsApi.md#operationsIdGet_0) | **GET** /operations/{id} | Get operation status



## operationsIdGet_0

Get operation status

Follows work that carries on after the response that started it. Duplicating a composition,
for one, answers 202 with an 'operationId': ask for that operation until its 'status' is
'completed' (or 'failed', with the reason in 'error'). A finished duplication names the new
composition in 'metadata.newCompositionId'.

An operation belongs to the user who started it. Asking for somebody else's operation answers
404, exactly as for one that does not exist. Administrators may read any operation.

### Example

```bash
client.sh operationsIdGet_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Operation identifier returned when the job was created. | [default to null]

### Return type

[**OperationsIdGetResponse**](OperationsIdGetResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

