$(document).ready(function(){
    $("#image").change(function(){
        $("#divImage").show(50);
        $("#divVideo").hide(50);
        $('#inputVideo').val('');
        $("#video").prop("checked", false);                   
    });

    $("#video").change(function(){
        $("#divImage").hide(50);
        $("#divVideo").show(50);
        $('#inputImage').val('');
        $("#image").prop("checked", false);                   
    });

    $("#image_1").change(function(){
        $("#divImage_1").show(50);
        $("#divVideo_1").hide(50);
        $('#inputVideo_1').val('');
        $("#video_1").prop("checked", false);                   
    });

    $("#video_1").change(function(){
        $("#divImage_1").hide(50);
        $("#divVideo_1").show(50);
        $('#inputImage_1').val('');
        $("#image_1").prop("checked", false);                   
    });
});