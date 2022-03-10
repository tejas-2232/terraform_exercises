## functions


**Example of using formatdate function**

```tf
> formatdate("EEE, DD MMM YYYY hh:mm:ss Z", "2018-01-02T23:12:01-08:00")
"Tue, 02 Jan 2018 23:12:01 -08:00"
> formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ", "2018-01-02T23:12:01-08:00")
"Tue, 02 Jan 2018 23:12:01 -0800"
> formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZZ", "2018-01-02T23:12:01-08:00")
"Tue, 02 Jan 2018 23:12:01 -0800"
> formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZZZ", "2018-01-02T23:12:01-08:00")
"Tue, 02 Jan 2018 23:12:01 -08:00"
> formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZZZ", "2018-01-02T23:12:01-08:00Z")

```
