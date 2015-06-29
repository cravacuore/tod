
function toastError(){
    toastr.error('Acción no completada', 'Error')
}

function changeRevisorRole(uid, url, successCallback){
    jQuery.ajax({
        url: url,
        data:'uid='+uid,
        success:  successCallback(),
        error: toastError
    });
}

function giveRevisorRole(uid){
    changeRevisorRole(uid, '/admin/asign_role', function(){
        toastr.success('El usuario es ahora revisor', 'Rol Modificado')
    });
}

function removeRevisorRole(uid){
    changeRevisorRole(uid, '/admin/remove_role', function(){
        toastr.success('El el revisor es ahora un usuario regular', 'Rol Modificado')
    });
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

function onSendRevisionsMail(proposalId){
    var proposalButton = jQuery('#proposal-send-email-'+proposalId);
    proposalButton.prop('disabled', true);
    jQuery.ajax({
        type: 'GET',
        url: '/proposal/revision_email',
        data:'proposal_id='+proposalId,
        success:  function(){
            //proposalButton.hide(); //in case we want to send only one email
            toastr.success('Mail enviado correctamente', 'Resultado Enviado')
        },
        error: [toastError, function(){
            proposalButton.prop('disabled', false);
        }]
    });
}

jQuery(document).ready(function() {
    onRoleClick();
});
