---
layout: default
title: Donate
permalink: /donate/
---

Donations to the Saltaires help promote the arts and music education in our area,
and are tax-deductible.

<form action="https://s0rjigcjk0.execute-api.us-west-2.amazonaws.com/prod" method="POST" class="form-inline">
  <input type="hidden" id="source" name="source" />
  <div id="error_explanation"></div>
  <div class="form-group">
    <label class="sr-only" for="amount">Amount</label>
    <input type="text" class="form-control" id="amount" placeholder="Amount">
  </div>
  <button type="submit" class="btn btn-default" id="donateButton">Donate</button>
</form>
<script src="https://checkout.stripe.com/checkout.js"></script>
<script>
var handler = StripeCheckout.configure({
  key: 'pk_test_USFjw6a3Je1ESi59yfGnpmkj',
  locale: 'auto',
  name: 'Saltaires',
  description: 'One-time donation',
  token: function(token) {
    $('input#source').val(token.id);
    $('form').submit();
  }
});

$('#donateButton').on('click', function(e) {
  e.preventDefault();

  $('#error_explanation').html('');

  var amount = $('input#amount').val();
  amount = amount.replace(/\$/g, '').replace(/\,/g, '')

  amount = parseFloat(amount);

  if (isNaN(amount)) {
    $('#error_explanation').html('<p>Please enter a valid amount in USD ($).</p>');
  }
  else if (amount < 5.00) {
    $('#error_explanation').html('<p>Donation amount must be at least $5.</p>');
  }
  else {
    amount = amount * 100; // Needs to be an integer!
    $('input#amount').val(amount);
    handler.open({
      amount: Math.round(amount)
    })
  }
});
$(window).on('popstate', function() {
  handler.close();
});
</script>
