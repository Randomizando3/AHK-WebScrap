#SingleInstance Force

WebPage := "https://portaldobitcoin.uol.com.br/cotacao-bitcoin/" ; Defina a URL da página que deseja capturar
 
Page := GetWebPage(WebPage)
 
RegExMatch(Page,"<title>(.*?)</title>",urlcapturada) ; No lugar de <title> adicione a tag ou texto que inicia de captura e na </title> a final
ClipBoard := % urlcapturada1 ; Texto Final é salvo na Área de Transferência na variável urlcapturada1
 
Return
 
GetWebPage(WebPage)
{
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")   
    whr.Open("GET", WebPage, true)
    whr.Send()
    whr.WaitForResponse()
    RefSource := whr.ResponseText
    Return RefSource
}