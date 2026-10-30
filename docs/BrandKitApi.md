# BrandKitApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteBrandKitAsset_0**](BrandKitApi.md#deleteBrandKitAsset_0) | **DELETE** /brand-kit/assets/{assetId} | Remove a font or icon from the Brand Kit
[**deleteBrandKit_0**](BrandKitApi.md#deleteBrandKit_0) | **DELETE** /brand-kit | Reset the Brand Kit to the default
[**getBrandKit_0**](BrandKitApi.md#getBrandKit_0) | **GET** /brand-kit | The Brand Kit of the current workspace
[**patchBrandKitAsset_0**](BrandKitApi.md#patchBrandKitAsset_0) | **PATCH** /brand-kit/assets/{assetId} | Rename an icon or relabel a font variant
[**patchBrandKit_0**](BrandKitApi.md#patchBrandKit_0) | **PATCH** /brand-kit | Change part of the Brand Kit
[**postBrandKitFont_0**](BrandKitApi.md#postBrandKitFont_0) | **POST** /brand-kit/fonts | Upload a font file to the Brand Kit
[**postBrandKitIcon_0**](BrandKitApi.md#postBrandKitIcon_0) | **POST** /brand-kit/icons | Add a named SVG icon to the Brand Kit
[**putBrandKit_0**](BrandKitApi.md#putBrandKit_0) | **PUT** /brand-kit | Save Brand Kit tokens



## deleteBrandKitAsset_0

Remove a font or icon from the Brand Kit

### Example

```bash
client.sh deleteBrandKitAsset_0 assetId=value  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **assetId** | **string** |  | [default to null]
 **organizationId** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteBrandKit_0

Reset the Brand Kit to the default

### Example

```bash
client.sh deleteBrandKit_0  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getBrandKit_0

The Brand Kit of the current workspace

The colors, fonts, icons, corner radius and style notes every widget made by this account is generated with. An account that never saved a kit gets Widgetic's default one ('isDefault' is true). A partner account's kit is the default for everything its keys create, and a key reads and changes the kit of the account it belongs to; there is no kit per managed user.

### Example

```bash
client.sh getBrandKit_0  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizationId** | **string** | An organisation's kit; omit for the caller's current workspace. | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patchBrandKitAsset_0

Rename an icon or relabel a font variant

### Example

```bash
client.sh patchBrandKitAsset_0 assetId=value  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **assetId** | **string** |  | [default to null]
 **patchBrandKitAssetRequest** | [**PatchBrandKitAssetRequest**](PatchBrandKitAssetRequest.md) |  |
 **organizationId** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patchBrandKit_0

Change part of the Brand Kit

Changes only what is sent: the colors, a font role, a spacing step, one corner radius (0 for square corners) or the style notes, and keeps the rest of the saved kit. An account that never saved a kit starts from Widgetic's default one. The response lists what is worth fixing in 'warnings'.

### Example

```bash
client.sh patchBrandKit_0  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patchBrandKitRequest** | [**PatchBrandKitRequest**](PatchBrandKitRequest.md) |  |
 **organizationId** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## postBrandKitFont_0

Upload a font file to the Brand Kit

### Example

```bash
client.sh postBrandKitFont_0  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **binary** |  | [default to null]
 **family** | **string** |  | [default to null]
 **weight** | **integer** |  | [default to null]
 **organizationId** | **string** |  | [optional] [default to null]
 **style** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## postBrandKitIcon_0

Add a named SVG icon to the Brand Kit

### Example

```bash
client.sh postBrandKitIcon_0  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postBrandKitIconRequest** | [**PostBrandKitIconRequest**](PostBrandKitIconRequest.md) |  |
 **organizationId** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## putBrandKit_0

Save Brand Kit tokens

Replaces the colors, fonts, spacing and notes of the kit with the ones sent. To change one thing, use PATCH.

### Example

```bash
client.sh putBrandKit_0  organizationId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **putBrandKitRequest** | [**PutBrandKitRequest**](PutBrandKitRequest.md) |  |
 **organizationId** | **string** |  | [optional] [default to null]

### Return type

[**BrandKitViewResponse**](BrandKitViewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

