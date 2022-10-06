## ----eval=FALSE---------------------------------------------------------------
#  install.packages("remotes")
#  remotes::install_github("massimoaria/openalexR")

## ----eval=FALSE---------------------------------------------------------------
#  install.packages("openalexR")

## ----warning=FALSE, message=FALSE---------------------------------------------
library(openalexR)
library(dplyr)

## -----------------------------------------------------------------------------
paper_id <- oa_fetch(
  identifier = "W2755950973",
  entity = "works",
  verbose = TRUE
)
dplyr::glimpse(paper_id)

## -----------------------------------------------------------------------------
paper_id %>% 
  show_works() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
oa_fetch(
  # identifier = "https://doi.org/10.1016/j.joi.2017.08.007", # would also work (PIDs)
  identifier = "doi:10.1016/j.joi.2017.08.007",
  entity = "works"
) %>% 
  show_works() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
oa_fetch(
  identifier = c("W2741809807", "W2755950973"),
  # identifier = c("https://doi.org/10.1016/j.joi.2017.08.007", "https://doi.org/10.1016/j.joi.2017.08.007"), # TODO
  entity = "works",
  verbose = TRUE
) %>% 
  show_works() %>%
  knitr::kable()


## -----------------------------------------------------------------------------
oa_fetch(
  # identifier = c("W2741809807", "W2755950973"),
  doi = c("10.1016/j.joi.2017.08.007", "https://doi.org/10.1093/bioinformatics/btab727"),
  entity = "works",
  verbose = TRUE
) %>% 
  show_works() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
oa_fetch(
  identifier = NULL,
  entity = "works",
  title.search = c("bibliometric analysis", "science mapping"),
  cited_by_count = ">50", 
  from_publication_date = "2020-01-01",
  to_publication_date = "2021-12-31",
  search = NULL,
  sort = "cited_by_count:desc",
  endpoint = "https://api.openalex.org/",
  count_only = TRUE,
  verbose = TRUE
)

## -----------------------------------------------------------------------------
oa_fetch(
  entity = "works",
  title.search = c("bibliometric analysis", "science mapping"),
  cited_by_count = ">50", 
  from_publication_date = "2020-01-01",
  to_publication_date = "2021-12-31",
  sort = "cited_by_count:desc",
  count_only = FALSE
) %>%
  show_works() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
oa_fetch(
  identifier = c("A923435168", "A2208157607"),
  verbose = TRUE
) %>%
  show_authors() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
my_arguments <- list(
  entity = "authors",
  last_known_institution.id = "I71267560",
  works_count = ">499"
  )

do.call(oa_fetch, c(my_arguments, list(count_only = TRUE)))
do.call(oa_fetch, my_arguments) %>% 
  show_authors() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
oa_fetch(
  entity = "authors",
  display_name = "Massimo Aria",
  has_orcid = "true"
) %>%
  show_authors() %>%
  knitr::kable()

oa_fetch(
  entity = "authors",
  orcid = "0000-0002-8517-9411"
) %>%
  show_authors() %>%
  knitr::kable()

## -----------------------------------------------------------------------------
italian_insts <- list(
  entity = "institutions",
  country_code = "it",
  type = "education",
  verbose = TRUE
)

do.call(oa_fetch, c(italian_insts, list(count_only = TRUE)))
dplyr::glimpse(do.call(oa_fetch, italian_insts))

## -----------------------------------------------------------------------------
big_journals <- list(
  entity = "venues",
  works_count = ">100000",
  verbose = TRUE
)

do.call(oa_fetch, c(big_journals, list(count_only = TRUE)))
dplyr::glimpse(do.call(oa_fetch, big_journals))

## -----------------------------------------------------------------------------
popular_concepts <- list(
  entity = "concepts",
  works_count = ">1000000",
  verbose = TRUE
)

do.call(oa_fetch, c(popular_concepts, list(count_only = TRUE)))
dplyr::glimpse(do.call(oa_fetch, popular_concepts))

## -----------------------------------------------------------------------------
aria_count <- oa_fetch(
  entity = "works",
  cites = "W2755950973",
  count_only = TRUE,
  verbose = TRUE
) 
aria_count

## -----------------------------------------------------------------------------
oa_fetch(
  entity = "works",
  cites = "W2755950973",
  count_only = TRUE,
  verbose = TRUE
) %>% 
  dplyr::glimpse()

## -----------------------------------------------------------------------------
bib_ls <- list(
  identifier = NULL,
  entity = "works",
  cites = "W2755950973",
  from_publication_date = "2022-01-01",
  to_publication_date = "2022-03-31"
)

do.call(oa_fetch, c(bib_ls, list(count_only = TRUE)))
do.call(oa_fetch, bib_ls) %>% 
  oa2bibliometrix() %>% 
  dplyr::glimpse()

