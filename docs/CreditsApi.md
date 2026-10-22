# CreditsApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserCreditBalance_0**](CreditsApi.md#getUserCreditBalance_0) | **GET** /credits/user/{userId}/balance | Get an account&#39;s credit balance
[**getUserCreditTransactions_0**](CreditsApi.md#getUserCreditTransactions_0) | **GET** /credits/user/{userId}/transactions | List an account&#39;s credit ledger



## getUserCreditBalance_0

Get an account's credit balance

Returns the credits an account holds: the balance, and how much of it is reserved by operations that
are still running.

An account reads its own balance; with a partner's API key, that is the account of the person who
administers the partner. Widgetic administrators can read any account's. An account that has never held
credits reads a balance of 0. 'getPartnerCreditBalance' reads this same balance by partner id.

### Example

```bash
client.sh getUserCreditBalance_0 userId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** | The account whose balance to read | [default to null]

### Return type

[**AccountCreditBalanceResponse**](AccountCreditBalanceResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUserCreditTransactions_0

List an account's credit ledger

Lists the entries of an account's credit ledger, newest first. This is also how an account's usage is
read: every operation that spends credits is a 'debit' entry, so summing the 'debit' entries over a
period gives the credits consumed in it, and the other types give what was added.

An account reads its own ledger; with a partner's API key, that is the account of the person who
administers the partner. Widgetic administrators can read any account's. 'getPartnerCreditTransactions'
reads this same ledger by partner id.

The page is always bounded: 'limit' defaults to 100 and is capped at 500, 'offset' defaults to 0.

### Example

```bash
client.sh getUserCreditTransactions_0 userId=value  transactionType=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** | The account whose ledger to read | [default to null]
 **transactionType** | **string** | Only entries of this type, for instance 'debit' for the credits spent. The types are listed on 'AccountCreditTransaction'. | [optional] [default to null]
 **limit** | **integer** | Maximum number of entries to return | [optional] [default to 100]
 **offset** | **integer** | Number of entries to skip | [optional] [default to 0]

### Return type

[**GetPartnerCreditTransactions200Response**](GetPartnerCreditTransactions200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

