
# Objetos -----------------------------------------------------------------
age <- 30 # número
name <- "Johan" # Carácter
soltero <- FALSE
negro <- TRUE
fecha <- Sys.Date()

# Los vectores pueden crecer
age[2] <- 35
age

length(age)
length(name)

# Consultar el tipo de objeto
typeof(age)
typeof(30L)
typeof(30)
typeof(name)
typeof(negro)
typeof(fecha)

class(fecha)

set.seed(123)
notas <- factor(
  sample(letters[1:3], 50, replace = TRUE),
  levels = c( "a", "b", "c", "d"),
  labels = c("Meritorio", "Promedio", "Malo", "Idiota")
)

table(notas)
as.numeric(notas)
as.character(notas)

attributes(notas)
attributes(fecha)

# Acceder a los elementos de un objeto ------------------------------------

names <- c("Rommel", "Johan")
ages <- c(35, 31)

dim(letters) <- c(13, 2)
dim(letters)
class(letters)

letters2 <- letters[1:20]
dim(letters2) <- c(2, 2, 5)
dim(letters2)
class(letters2)

# objetos atómicos y recursivos -------------------------------------------
c(1, "Johan")
c(1, Sys.Date())
c("Johan", Sys.Date())

1 + Sys.Date() # mañana

# Error
1 + "2"
"Johan" + "Rommel"

as.logical(1)
as.logical(0)
as.numeric(TRUE)
vector(mode = "character", length = 0)
vector(mode = "character", length = 3)

my_list <- vector(mode = "list")

my_list[1] <- "Johan"
my_list[2] <- "rommel"

tigueres <- list(
  johan = list(
    name = "Johan",
    age  = 31
  ),
  rommel = list(
    name = "Rommel",
    age  = 35
  )
)

tigueres2 <- list(
  list(
    name = "Johan",
    age  = 31
  ),
  list(
    name = "Rommel",
    age  = 35
  )
)

tigueres2 <- setNames(tigueres2, names)
names(tigueres2)

names(tigueres2) <- c("Johan", "Rommel")
names(tigueres2)

ages |>
  setNames(c("Johan", "Rommel"))

df <- data.frame(
  age = ages,
  name = names
)

class(df)
typeof(df)

list(
  name = c("Johan", "Rommel"),
  age = c(2, 3, 4, 3)
) |>
  as.data.frame()

c(1, 2) + c(10, 20, 30, 3)

model <- lm(mpg ~ wt, data = mtcars)

class(model)
typeof(model)

model$model
model$residuals
model$assign

tigueres2$Johan

  
str(model)

summary(1:10)
summary(model)

summary(notas)
table(notas)


# Usando listas -----------------------------------------------------------

myiris <- iris |>
  dplyr::as_tibble() |>
  dplyr::relocate(Species)

iris_list <- split(myiris, myiris$Species)

writexl::write_xlsx(iris_list, "clase_1//all_iris.xlsx")

purrr::iwalk(
  iris_list,
  \(df, name) {
    writexl::write_xlsx(df, paste0("clase_1/", name, ".xlsx"))
  }
)

library(readxl)

sheets <- excel_sheets("clase_1/all_iris.xlsx")

lapply(
  sheets,
  \(sheet) read_xlsx("clase_1/all_iris.xlsx", sheet)
) |>
  setNames(sheets)

iris_list$setosa
iris_list[["setosa"]]


