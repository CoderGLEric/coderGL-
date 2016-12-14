/**
 * 
 * @authors coderGL
 * @date    2016-12-09 16:26:27
 * @version $Id$
 */

function HttpTool(jsonObj,urlStr,successBlock,failedBlock){
            this.dataObj=jsonObj,
            this.url=urlStr,
            this.type="POST",
            this.postData = function (){
                var jqXHR = $.ajax({
                        type:this.type,
                        url:this.url,
                        dataType:"json",
                        data:{  
                            data: JSON.stringify(this.dataObj)
                        },
                        success:function(data){
                            if (data.status=="100000"){
                                console.log(JSON.stringify("成功回调"+data));
                                successBlock(data);
                            }else {
                                console.log(JSON.stringify("失败"+data));
                                failedBlock(JSON.stringify("response"+data));
                            }
                        },
                        error:function(errorText){
                            failedBlock(errorText);
                        }
                    })
                return jqXHR;
            }
}