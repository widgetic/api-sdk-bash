# EntitlementsApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getManagedUserEntitlements_0**](EntitlementsApi.md#getManagedUserEntitlements_0) | **GET** /entitlements/managed-users/{managedUserId} | Get managed user entitlements
[**getPartnerEntitlements_0**](EntitlementsApi.md#getPartnerEntitlements_0) | **GET** /entitlements/partners/{partnerId} | Get partner entitlements



## getManagedUserEntitlements_0

Get managed user entitlements

Retrieves all entitlements for a managed user (admin or partner access).

### Example

```bash
client.sh getManagedUserEntitlements_0 managedUserId=value  includeExpired=value  feature=value  source=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **managedUserId** | **string** | Managed user ID | [default to null]
 **includeExpired** | **boolean** | Include expired entitlements in results | [optional] [default to null]
 **feature** | **string** | Filter by specific feature | [optional] [default to null]
 **source** | **string** | Filter by entitlement source | [optional] [default to null]

### Return type

[**GetManagedUserEntitlementsResponse**](GetManagedUserEntitlementsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerEntitlements_0

Get partner entitlements

Retrieves all entitlements for a partner (admin or partner access).

### Example

```bash
client.sh getPartnerEntitlements_0 partnerId=value  includeExpired=value  feature=value  source=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | Partner ID | [default to null]
 **includeExpired** | **boolean** | Include expired entitlements in results | [optional] [default to null]
 **feature** | **string** | Filter by specific feature | [optional] [default to null]
 **source** | **string** | Filter by entitlement source | [optional] [default to null]

### Return type

[**GetPartnerEntitlementsResponse**](GetPartnerEntitlementsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

