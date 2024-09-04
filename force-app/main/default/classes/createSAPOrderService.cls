global class createSAPOrderService {
    
    
    @InvocableMethod
    public static List<String> createOrder(List<List<String>> params) {
        
        List<String> result = new List<String>();
        
        List<String> param = params[0];
        
        result.add(sendRequest(param[0], param[1], param[2]));
        
        return result;
        
    }
    
    
    public static String sendRequest(String customerCode, String totAmount, String numItems ){
        
         System.debug('Param 1: '+ customerCode);
        System.debug('Param 2: '+ totAmount);
        System.debug('Param 3: '+ numItems);
        
        
        String result;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://vdupre-sap-cdo-demo.my.site.com/consumer/services/apexrest/OrderService');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody('{"customerCode":"'+customerCode+'", "totalAmount":"'+totAmount+'", "numberItems":"'+numItems+'"  }');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() != 200 ) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getBody() );
        } else {
            System.debug(response.getBody());
            result = response.getBody();
        }
        
        
        return result;
    }
    
}