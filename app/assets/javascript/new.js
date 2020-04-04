let invitedArr = [];
   const inviteButton = document.getElementById('inviteButton');
   const publishbtn = document.getElementById('publishbtn');
   const invited = document.getElementById('invited');
   
   function checkExistance() {
      nameValue = invited.value
      $.ajax({
         type: "POST",
         beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
         url: "/orders/checkInvitedExistance",
         dataType: "json",
         data: {'keyword': nameValue},
         success: function(result){
            if (result.length == 0 ) {
               invited.value = "does not match friend or group name";
            } else {
               inviteFriends();
            }
         }
      })
   }
   function inviteFriends() {
      const invitedValue = invited.value;
         invitedArr.push(invitedValue);
         invited.value = "";
         addInvitedToList(invitedValue);
   }
   
   function addInvitedToList(invitedValue){
      $('#invitedList').append(`
         <div class="card mb-3" style="max-width: 540px;">
            <div class="row no-gutters">
               <div class="col-md-2">
                  <img src="/assets/user.png" alt="user-photo" class="friendImage">
               </div>
               <div class="col-md-8">
                  <div class="card-body">
                     <h5 class="friend-name"> ${invitedValue} </h5>
                     <a href="#" class="btn btn-danger">Remove</a>
                  </div>
               </div>
            </div>
         </div>
      `)
   }
   
   function setInvitedValue(invitedArr) {
      invited.value = invitedArr;
   }
   
   inviteButton.addEventListener('click', checkExistance);
   publishbtn.addEventListener('click', () => {
      // inviteFriends();
      setInvitedValue(invitedArr);
   });
   
   invited.addEventListener('focusin', ()=>{
      invited.value="";
   })