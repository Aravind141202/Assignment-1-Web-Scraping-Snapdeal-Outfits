library(robotstxt)
library(rvest)
url <- "https://www.snapdeal.com/products/men-apparel-shirts?sort=plrty"
path = paths_allowed(url)
#html from website
web = read_html(url)
View(web)
name <- web %>% html_nodes(".product-title")%>% html_text()
View(name)
original_price <- web%>%html_nodes(".strike") %>% html_text()
View(original_price)
discount_price <- web %>%html_nodes(".product-price") %>% html_text()
View(price)
no_of_ratings <- web%>%html_nodes(".product-rating-count") %>% html_text()
length(no_of_ratings)<-length(price)
View(no_of_ratings)





#creating dataframe
snapdeal_shirts <- data.frame(names=name,org_prices=original_price,d_price=discount_price,ratings=no_of_ratings)
View(snapdeal_shirts)
#save
write.csv(snapdeal_shirts,"snapdeal.csv")
