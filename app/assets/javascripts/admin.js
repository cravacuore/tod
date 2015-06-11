function changeRevisorRole(uid, url){
    jQuery.ajax({
        url: url,
        data:'uid='+uid,
        success:  function(){
            console.log('success!');
        }
    });
}

function giveRevisorRole(uid){
    changeRevisorRole(uid, '/admin/asign_role')
}

function removeRevisorRole(uid){
    changeRevisorRole(uid, '/admin/remove_role')
}

function onRoleClick(){
    jQuery(".roles-table input").click( function(){
        var id = parseInt($(this).val(), 10);
        if(jQuery(this).is(":checked")) {
            giveRevisorRole(jQuery(this).val())
        } else {
            removeRevisorRole(jQuery(this).val())
        }
    });
}

jQuery(document).ready(function() {
    onRoleClick();
});
