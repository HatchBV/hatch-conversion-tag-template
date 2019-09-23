# Hatch Conversion Tag

This tag is created and owned by Hatch in order to track sales conversions on a retailer’s website. Please note that this includes quantity, sales value and product information, but does not include personal data or information. In order to use this, a retailer ID is needed which can be provided by Hatch. Please reach out to Hatch about questions regarding implementation of the tag.

We are using dataLayer variable to store purchase data.
Format of dataLayer variable for Hatch Conversion Tag:

```
[
  ...,
  {
    'hatch': {
      'merchantId': <merchantId>,
      'transactionProducts': [
        {
          'sku': <productSku>,
          'name': <productName>,
          'brand': <brandName>,
          'regularPrice': <price>,
          'quantity': <quantity>
        },
        ...<others items in purchase>
      ]
    }
  }
]
```
