resource "azurerm_resource_group" "rg" { #리소스그룹 만들기
  name     = var.name                    #리소스스룹 이름
  location = var.location                #지역(한국중부)
}