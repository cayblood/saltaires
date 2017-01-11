---
layout: default
title: Donate
permalink: /donate/
---

### Make a donation

<div class="row">
  <div class="col-md-8">
    <p>Donations to the Saltaires help promote the arts and music education in our area,
    and are tax-deductible. To make a donation, please enter the amount you wish to
    donate and submit the form to the right.</p>
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

### Corporate Sponsorships

The Saltaires Chorus is a barbershop chorus of 30+ men from the Wasatch Front. They are one
of the best competing barbershop choruses in the world. The Saltaires have won the Rocky
Mountain District competition multiple times and have been ranked in the top ten choruses
internationally for five consecutive years. The Saltaires have been officially named "Cultural
Ambassadors of the State of Utah" by the Governor, and have received the prestigious
Governor's Mansion Artist Award.

In addition to our commitment to excellence in the performing arts, the Saltaires is a partner with
businesses in the local community to help promote music education and barbershop harmony at
local high schools and colleges. We also provide free quality entertainment for senior
communities up and down the Wasatch Front.

Become a corporate sponsor for the 2017 Season. Your company's sponsorship can assist us
in our community outreach and in putting on our 2017 Concert Series. Your sponsorship will at
the same time bring your company's products and services to the attention of hundreds of our
patrons.

* **Legacy Retirement Center Tour**: Beginning September 7, 2016 we will provide a free show for 6 different retirement communities this year from Ogden to Provo. We expect to entertain 1200 seniors and their family members.
* **Sweet Adeline Barbershop Show**: We will team up with our sister group, the Mt Jubilee Chorus for a night of barbershop singing. Together we will entertain over 700 patrons.
* **Valentine's Day**: We split into quartets and sing to loved ones all day long and into the night. We catch them at work, at school, at dinner, or anywhere we can impress them the most. Our biggest fund raiser will put you in front of 80 sweethearts plus their families and co-workers.
* **Annual Spring Show**: This usually features an international championship quartet which draws our biggest crowd of barbershop patrons. Hundreds of thankful patrons will know you as the sponsor of two or three quality shows.
* **Temple Square Concert Series**: Each year we fill the Assembly Hall on Temple Square for an evening of great barbershop singing. Hard to beat the acoustics in that building.

The following sponsorship packages are available:

<div class="row">
  <div class="col-md-10">
    <h4>$1000 Gold Package (1 available)</h4>
  </div>
  <div class="col-md-2">
    <form action="" method="POST" class="form-inline">
      <button type="submit" class="btn btn-default" id="donateButtonGold">Buy</button>
    </form>
  </div>
</div>
<script>
$('#donateButtonGold').on('click', function(e) {
  e.preventDefault();
  handler.open({ amount: 100000 });
});
</script>

* Company's logo appears on the front page of the program as the official sponsor of the show
* Company gets a full advertisement in the program covering two facing pages (program is in booklet format, 4.25" x 5.5")
* Company's logo appears on the intro to our youtube show highlights video as the official sponsor of the show
* Company’s advertisement appears on the outro to our youtube highlights video (an 'outro' is a segment that appears at the end of a video)
* Company gets a post on our [Facebook](https://www.facebook.com/TheSaltaires/) and [Twitter](https://twitter.com/thesaltaires) channels
* Company is mentioned as the Gold sponsor on our web site post about the show, with a banner image that links to the company's web site
* What we need from the company:
  * Payment, either online via donation button to the right, or in the form of a check for $1,000.00 made out to *Saltaires Chorus*
  * High-resolution logo image
  * High-resolution image for full-page ad, designed to be displayed on a landscape 8.5x11" page.
  * Ads may include coupons


<div class="row">
  <div class="col-md-10">
    <h4>$200 Bronze Package (unlimited number available)</h4>
  </div>
  <div class="col-md-2">
    <form action="" method="POST" class="form-inline">
      <button type="submit" class="btn btn-default" id="donateButtonBronze">Buy</button>
    </form>
  </div>
</div>
<script>
$('#donateButtonBronze').on('click', function(e) {
  e.preventDefault();
  handler.open({ amount: 20000 });
});
</script>

* Company's logo appears on the inner flap of the program along with all other bronze sponsors ("also brought to you by...")
* Company gets a half-page space for an ad in the program (four bronze sponsor ads will fit on two facing pages)
* What we need from the company:
  * Payment, either online via donation button to the right, or in the form of a check for $200.00 made out to *Saltaires Chorus*
  * High-resolution logo image
  * High-resolution ad image, designed to appear in a 5.5x4.25" space
  * Ads may include coupons
