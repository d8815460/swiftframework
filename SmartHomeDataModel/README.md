# Demo of SmartHome 2.0 data model

## Data classes

* DMBase - base class (super class) of the following classes
* DMIPHub
* DMZone
* DMRoom
* DMGroup
* DMAccessory

## Relationship (may not a good one)

DMBase

   +------------+-----------+------------+-------------+

   |            |           |            |             |

   +            +           +            +             +

DMIPHub +--< DMZone +--< DMRoom +--< DMGroup +--< DMAccessory

                               L+--< DMAccessory

## Common method

+(instancetype)parseWithDictionary: (NSDictionary *)dict

