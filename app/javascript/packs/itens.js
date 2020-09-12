
 $(document).ready(function () {
  $('.toggleItensModal').on('click', function (event) {
    var button = $(this)
    var character = button.data('character')
    var modal_merchant = $('#purchaseMerchantModal')
    var modal_smith = $('#purchaseSmithModal')

    modal_merchant.find('input[name="character_id"').each(function() {
      $( this ).val(character)
    });
    modal_smith.find('input[name="character_id"').each(function() {
      $( this ).val(character)
    });
  });
});
