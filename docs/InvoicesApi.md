# InvoicesApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInvoicesByPartnerId_0**](InvoicesApi.md#getInvoicesByPartnerId_0) | **GET** /invoices/partner/{partnerId} | List a partner&#39;s invoices



## getInvoicesByPartnerId_0

List a partner's invoices

Lists the invoices issued to a partner, newest first. Each carries the price ('subtotal'), the tax on
it ('taxAmount') and what is paid ('total'), its status as the payment provider reports it, why the
last payment failed ('failureReason'), and the page where it is paid ('hostedInvoiceUrl').

A partner reads its own: the caller must be the person who administers the partner (an API key of
that account works), and anyone else is refused with 403 whether or not the partner exists.
Widgetic administrators can read any partner's and see exactly what the partner sees; the full
records, with the internal fields, are 'getAllInvoices' filtered by partner.

The page is always bounded: 'limit' defaults to 50 and is capped at 100, 'offset' defaults to 0.

### Example

```bash
client.sh getInvoicesByPartnerId_0 partnerId=value  status=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose invoices to list | [default to null]
 **status** | **string** | Only invoices with this status | [optional] [default to null]
 **limit** | **integer** | Maximum number of invoices to return | [optional] [default to 50]
 **offset** | **integer** | Number of invoices to skip | [optional] [default to 0]

### Return type

[**GetInvoicesByPartnerId200Response**](GetInvoicesByPartnerId200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

