___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Hatch Conversion Tag",
  "description": "This tag is created and owned by Hatch in order to track sales conversions on a retailer’s website. Check documentation: https://github.com/HatchBV/hatch-conversion-tag-template/blob/master/README.md",
  "categories": ["ANALYTICS", "CONVERSION_TRACKING"],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAC+UlEQVRoge2azW5bRRSAv5kz146apKnjuAoRIgg2FRKbdsmjsOApeAckngMJ8QjsYccKgVAXQKlqERzHpMRJc+/MGRa3NW0UgWuPUzGeb3V/7Jn7zZz5ucc293/5IbJG2Df9ADdNEc6dIpw7RTh3inDuFOHcKcK541IUMrDCFwfvsWEtIf7z8tUxlo9++2nucr555x511Nm5GMMzVT4e/sxIQ4pHTSPsDPRdtXQ5G9aycSXoNq3gzNJFz0gW0i/3bEpSl7t2Y7gI504Rzp0inDtrJ5xkp/VvfPfuB6uu4rVYux4uwrlThHNn5bP0g19/nPuzNzGjJ+thk/AlfZWkC+n/yc/qSUJ6HJTPj4ccVB3uOsddqdgWoS/Lp31Sk0S4JvLV9PSVaz1rOUyQ55LEY2Vh4U+2e3SNYehrRsEzCYGnqpyoUhOZqDKpL1+rzC//HHHHCXu2Ytc5bovDRPAJh4tZ9E8t3x7eo2vaKeBMA+camKpypoEjX3MSAuPgGYWG333D0HvGGriMkXkSrgMrDEToGMP39eVc35mHhXu41khX2uMtK2xZmd37kM3ZcQQ0Rs5VOdGGsfcch4ZJCEy850loG+cvDZxo4FiVJkZGGpLlol9m5euwoR2H2yJsi3B4ZVhH4FwDz1Q5i4HTENoG8Q1H3vNH8Bz5hvHzBniqel01c7OwcKq5xNAm2zet0KeCaxrkRYScqudhfcGno+HC9S0svKrE+1WuRshAKuANCH92/IT3qw12nbAvFT2p2JJ2LG9aS8esZpteL9nQCwt/fTGFi+nsvDKGfSv0RNixwh0rvO069J2wK46eVPTFsSsVHWOSr6/zkmzSamLkcfA8Dv7a+wLctpaBFfbEse8qBuIYOEffOvquYkcct0wbIV17fYTYJdtp5bP0CwK0mxFVHvoGLi9euX/LGAbPI2NLLHviOJAOOyL0nWNPHG9VXaZhuaXqxoT/i/MYeRQ8j4KHZnX1rF0CoAjnThHOnSKcO0U4d4pw7hTh3PkbWJsKU8P7GUgAAAAASUVORK5CYII=",
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "Please specify your Merchant Hatch ID",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "NUMBER"
      }
    ],
    "displayName": "Merchant Hatch ID",
    "simpleValueType": true,
    "name": "merchantID",
    "valueUnit": "integer",
    "type": "TEXT"
  },
  {
    "help": "Please use 3-letters format of currency, e.g. \"EUR\"",
    "valueValidators": [
      {
        "args": [
          3,
          3
        ],
        "type": "STRING_LENGTH"
      }
    ],
    "displayName": "Merchant Currency",
    "defaultValue": "EUR",
    "simpleValueType": true,
    "name": "currency",
    "type": "TEXT"
  },
  {
    "displayName": "Please use dataLayer format like in description",
    "name": "dataLayer",
    "type": "LABEL"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "hatch.*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_hidden_iframe",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://gethatch.com/iceleads_rest/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const encodeUri = require('encodeUri');
const copyFromDataLayer = require('copyFromDataLayer');
const injectHiddenIframe = require('injectHiddenIframe');

let dataLayer = copyFromDataLayer('hatch') || [];

const merchantId = data.merchantID;
const cur = data.currency;
let concat = "";
for(let i in dataLayer.transactionProducts){
  concat += "&mpn=" + dataLayer.transactionProducts[i].sku + "&cur=" + cur + "&pr=" + dataLayer.transactionProducts[i].regularPrice + "&qty=" + dataLayer.transactionProducts[i].quantity + "&vendor_name=" + dataLayer.transactionProducts[i].brand + "&prod_name=" + dataLayer.transactionProducts[i].name;
}
injectHiddenIframe("https://gethatch.com/iceleads_rest/merch/" + encodeUri(merchantId) + "/track?" + encodeUri(concat), data.gtmOnSuccess);


___NOTES___

DataLayer format:
     {
       'hatch': {
          'merchantId': 999111,
          'transactionProducts': [
            {'sku', 'name', 'brand', 'regularPrice', 'quantity'}
          ]
     }
}
