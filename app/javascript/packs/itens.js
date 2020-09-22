
 $(document).ready(function () {
  $('.toggleItensModal').on('click', function (event) {
    var button = $(this)
    var character = button.data('character')
    var modal_merchant = $('#purchaseMerchantModal')

    modal_merchant.find('input[name="character_id"').each(function() {
      $( this ).val(character)
    });
  });
});
