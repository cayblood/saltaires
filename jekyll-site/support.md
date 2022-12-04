---
layout: default
title: Support
permalink: /support/
---

### Volunteer with the Saltaires

To make an organization like the Saltaires run efficiently, we rely on every member, as well as friends of the chorus, to participate and make the work easier.  If you would like to support the Saltaires during rehearsals, events, or behind the scenes in any way, thank you! Please <a href="mailto:contact@saltaires.org">contact us</a> to tell us more about your availability and interest.

### Advertise with us

The Saltaires puts on an annual show for hundreds of residents of Salt Lake County.  We accept ads of all sizes for these programs. Additionally, we invite companies and individuals who are willing to sponsor us at larger dollar values for prime advertising space with the chorus. Please <a href="mailto:contact@saltaires.org">contact us</a> for more information.

### Make a donation

<div class="row">
  <div class="col-md-8">
    <p>Donations to the Saltaires help promote the arts and music education in our area,
    and are tax-deductible. To make a donation, please enter the amount you wish to
    donate and submit the form to the right. A charitable-contribution receipt will be generated for you after making the donation.</p>
  </div>
  <div class="col-md-4">
    <form action="" method="POST" class="form-inline">
      <div id="error_explanation"></div>
      <div class="form-group">
        <label class="sr-only" for="amount">Amount</label>
        <input type="text" class="form-control" id="amount" placeholder="Amount">
      </div>
      <button type="submit" class="btn btn-default" id="donateButton">Donate</button>
    </form>
  </div>
</div>
<a href="http://slco.org/zap/">![SLC Zoo, Arts & Parks program](/images/zap.png){: width="200" }</a>

<a href="http://www.nowplayingutah.com/">![Now Playing Utah](/images/now-playing-utah.png){: width="200" }</a>

<a href="https://artsandmuseums.utah.gov/">![Utah Division of Arts and Museums](/images/Arts-and-Museums-logo.png){: width="200" }</a>

<a href="https://www.lhmauto.com/charities/index.htm/">![Larry H. Miller Charities](/images/LHMCharities.png){: width="200" }</a>

<script src="https://checkout.stripe.com/checkout.js"></script>
<script>
function validateAmount(amount) {
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
  }
  return amount;
}

var handler = StripeCheckout.configure({
  key: 'pk_live_OQBvwJEC1ALJMWBN59v0YWb3',
  locale: 'auto',
  name: 'Saltaires',
  description: 'One-time donation',
  token: function(token) {
    var payload = {
      receipt_email: token.email,
      amount: validateAmount($('input#amount').val()),
      description: 'Saltaires Donation',
      source: token.id
    };
    function success(data) {
      window.location.replace("/thanks");
    }
    $('body').prepend('<div class="loading">Loading&#8230;</div>');
    $.ajax({
      contentType: 'application/json',
      data:        JSON.stringify(payload),
      dataType:    'json',
      success:     success,
      processData: false,
      type:        'POST',
      url:         'https://5wahuhtsif.execute-api.us-west-2.amazonaws.com/prod'
    });
  }
});

$('#donateButton').on('click', function(e) {
  e.preventDefault();
  $('#error_explanation').html('');
  var amount = validateAmount($('input#amount').val());
  if (amount >= 500) {
    handler.open({ amount: Math.round(amount) });
  }
});

$(window).on('popstate', function() {
  handler.close();
});
</script>
