#### contains and Length

```tf
$ terraform console
> contains(tolist(["a","b","c"]),"a" )
true
> contains(tolist(["a","b","c"]),"z" )
false
> contains(tolist(["a","b","c","z"]),"z" )
true
> contains(tolist(["a","b","c","z"]),"d" )
false
> length("....")
4
> length("abcdcdh")
7
```

#### element

```tf
>length(tomap({"key"="value"}))
1

> element(["as","dsa"],0 )
"as"
> element(["adasd","dsa"],0 )
"adasd
```

#### Lookup

```tf
> lookup({region1="eastus", region2="westus"}, "region3", "region not found")
"region not found"
> lookup({region1="eastus", region2="westus"}, "region2", "region not found")
"westus"
>
```

#### merge

```tf
> merge(tomap({"region"="eastus"}),tomap({"env"="prod"}) )
tomap({
"env" = "prod"
"region" = "eastus"
})
> merge(tomap({"region"="eastus"}),tomap({"stage"="prod"}) )
tomap({
"region" = "eastus"
"stage" = "prod"
})
```


