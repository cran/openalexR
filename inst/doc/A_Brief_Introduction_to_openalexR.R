## -----------------------------------------------------------------------------
   library(openalexR)

## -----------------------------------------------------------------------------
query_work <- oaQueryBuild(
  identifier = "W2755950973",
  entity = "works"
  )

cat(query_work)

## -----------------------------------------------------------------------------
 res <- oaApiRequest(
    query_url = query_work
    )

## -----------------------------------------------------------------------------
df <- oa2df(res, entity = "works")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query_work <- oaQueryBuild(
  identifier = "doi:10.1016/j.joi.2017.08.007",
  entity = "works"
  )

cat(query_work)

## -----------------------------------------------------------------------------
 res <- oaApiRequest(
    query_url = query_work
    )

## -----------------------------------------------------------------------------
df <- oa2df(res, entity = "works")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query_work <- oaQueryBuild(
  identifier = "doi:https://doi.org/10.1016/j.joi.2017.08.007",
  entity = "works"
  )

cat(query_work)

## -----------------------------------------------------------------------------
 res <- oaApiRequest(
    query_url = query_work
    )

## -----------------------------------------------------------------------------
df <- oa2df(res, entity = "works")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
ids <- c("W2755950973","W3005144120")

res <- lapply(ids, function(x){
  oaApiRequest(
    query_url = oaQueryBuild(
      identifier = x,
      entity = "works"
    )
  )
})

## -----------------------------------------------------------------------------
df <- oa2df(res, entity = "works")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------

query_author <- oaQueryBuild(
  identifier = "A923435168",
  entity = "authors")

cat(query_author)

## -----------------------------------------------------------------------------
 res_author <- oaApiRequest(
    query_url = query_author,
    total.count = FALSE,
    verbose = FALSE
 )

## -----------------------------------------------------------------------------
df <- oa2df(res_author, entity = "authors")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query <- oaQueryBuild(
    identifier=NULL,
    entity = "works",
    filter = 'title.search:"bibliometric analysis"|"science mapping",cited_by_count:>100',
    date_from = "2000-01-01",
    date_to = "2021-12-31",
    search=NULL,
    sort="cited_by_count:desc",
    endpoint = "https://api.openalex.org/")

## -----------------------------------------------------------------------------
 res <- oaApiRequest(
    query_url = query,
    total.count = TRUE,
    verbose = FALSE
    )

res$count

## -----------------------------------------------------------------------------
 res <- oaApiRequest(
    query_url = query,
    total.count = FALSE,
    verbose = FALSE
    )

## -----------------------------------------------------------------------------
df <- oa2df(res, entity = "works")

## -----------------------------------------------------------------------------
dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query1 <- oaQueryBuild(
 identifier=NULL,
 entity = "works",
 filter = "cites:W2755950973",
 date_from = "2022-01-01",
 date_to = "2022-03-31",
 sort=NULL)

res1 <- oaApiRequest(
    query_url = query1,
    total.count = TRUE,
    verbose = FALSE
    )

## -----------------------------------------------------------------------------
cat(res1$count, "publications")

## -----------------------------------------------------------------------------
res1 <- oaApiRequest(
    query_url = query1,
    total.count = FALSE,
    verbose = FALSE
    )

## -----------------------------------------------------------------------------
df <- oa2df(res1, entity = "works")

## -----------------------------------------------------------------------------
dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query_author <- oaQueryBuild(
  identifier = NULL,
  entity = "authors",
  filter = "last_known_institution.id:I71267560,works_count:>499")


## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_author,
                    total.count = TRUE,
                    verbose=FALSE)
res$count

## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_author,
                    total.count = FALSE,
                    verbose=FALSE)
df <- oa2df(res, entity = "authors")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query_inst <- oaQueryBuild(
  entity = "institutions",
  filter = "country_code:it,type:education")


## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_inst,
                    total.count = TRUE,
                    verbose=TRUE)
res$count

## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_inst,
                    total.count = FALSE,
                    verbose=TRUE)
df <- oa2df(res, entity = "institutions")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query_venue <- oaQueryBuild(
  entity = "venues",
  filter = "works_count:>100000")


## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_venue,
                    total.count = TRUE,
                    verbose=TRUE)
res$count

## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_venue,
                    total.count = FALSE,
                    verbose=TRUE)

df <- oa2df(res, entity="venues")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query_concept <- oaQueryBuild(
  entity = "concepts",
  filter = "works_count:>1000000")

## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_concept,
                    total.count = TRUE,
                    verbose=TRUE)
res$count

## -----------------------------------------------------------------------------
res <- oaApiRequest(query_url = query_concept,
                    total.count = FALSE,
                    verbose=TRUE)

df <- oa2df(res, entity="concepts")

dplyr::glimpse(df)

## -----------------------------------------------------------------------------
query1 <- oaQueryBuild(
 identifier=NULL,
 entity = "works",
 filter = "cites:W2755950973",
 date_from = "2022-01-01",
 date_to = "2022-03-31",
 sort=NULL)

res1 <- oaApiRequest(
    query_url = query1,
    total.count = TRUE,
    verbose = FALSE
    )

## -----------------------------------------------------------------------------
cat(res1$count, "publications")

## -----------------------------------------------------------------------------
res1 <- oaApiRequest(
    query_url = query1,
    total.count = FALSE,
    verbose = FALSE
    )

## -----------------------------------------------------------------------------
df <- oa2df(res1, entity = "works")

## -----------------------------------------------------------------------------
M <- oa2bibliometrix(df)

dplyr::glimpse(M)

