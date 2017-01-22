---
layout: default
title: Valentines
permalink: /valentines/
---

<div class="row">
  <div class="col-md-12 embed-responsive embed-responsive-16by9">
    <!-- copy and paste. Modify height and width if desired. -->
    <iframe class="tscplayer_inline embeddedObject video" name="tsc_player" scrolling="no" frameborder="0" type="text/html" style="overflow:hidden;" src="https://www.screencast.com/users/ScottFugate/folders/Camtasia Studio/media/082dddee-2a02-4ec4-bf36-4dd1b84d5f42/embed" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
  </div>
</div>


### Singing Valentines

<div class="row">
  <div class="col-md-7">
    <p>
    Knock your Valentine off their feet with this unforgettable gift! A top-notch barbershop quartet will arrive at your chosen time slot on Valentines Day, sing classic love songs in beautiful four part harmony for your valentine, and deliver a gift
    of your choice.
    </p>
    <div>
    <form id="orderForm" action="" method="POST">
      <div id="error_explanation"></div>
      <div class="form-group">
        <label for="name">Your name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Romeo Montague">
      </div>
      <div class="form-group">
        <label for="phone">Your phone number</label>
        <input type="text" class="form-control" id="phone" name="phone" placeholder="801-123-4567">
      </div>
      <div class="form-group">
        <label for="valentine">Name of your Valentine</label>
        <input type="text" class="form-control" id="valentine" name="valentine" placeholder="Sweet Adeline">
      </div>
      <div class="form-group">
        <label for="address">Delivery Address</label>
        <input type="text" class="form-control" id="address" name="address" placeholder="1234 Old Mill Stream Rd">
      </div>
      <div class="form-group">
        <label for="city">City</label>
        <input type="text" class="form-control" id="city" name="city" placeholder="Salt Lake City">
      </div>
      <div class="form-group">
        <label for="zip">ZIP</label>
        <input type="text" class="form-control" id="zip" name="zip" placeholder="84101">
      </div>
      <div class="form-group">
        <div class="radio">
          <label class="first">
            <input type="radio" name="optionsRadios" id="optionsRadios1" value="friendship" checked>
            <strong>Friendship</strong>: One passionate love song, a personalized card, one beautiful
            long-stemmed rose, and a picture with the quartet ($50)
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios2" value="truelove">
            <strong>True Love</strong>: Two passionate love songs, a personalized card, a half-dozen beautiful
            long-stemmed rose arrangement, and a pic/video with the quartet ($100)
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios3" value="sweetlove">
            <strong>Sweet Love</strong>: Two passionate love songs, a personalized card, one beautiful
            long-stemmed rose, hand-dipped chocolates, and a pic/video with the quartet ($100)
          </label>
        </div>
        <div class="radio">
          <label class="last">
            <input type="radio" name="optionsRadios" id="optionsRadios4" value="forever" checked="checked">
            <strong>Forever</strong>: Two passionate love songs, a personalized card, hand-dipped chocolates, a dozen beautiful long-stemmed rose arrangement, and a pic/video with the quartet ($150)
          </label>
        </div>
      </div>
      <div class="form-group">
        <label for="extra">Number of extra long-stemmed roses ($5 each)</label>
        <input class="form-control" id="extra" name="extra" type="text" value="0">
      </div>
      <div class="form-group">
        <label for="message">Message you would like on the card</label>
        <textarea id="message" name="message" class="form-control" rows="3"></textarea>
      </div>
      <div class="form-group">
        <label for="window">Time window</label>
        <select class="form-control" id="window" name="window">
          <option value="8-11am">8:00am - 11:00pm</option>
          <option value="9-12am">9:00am - 12:00pm</option>
          <option value="10am-1pm">10:00am - 1:00pm</option>
          <option value="11am-2pm">11:00am - 2:00pm</option>
          <option value="12-3pm">12:00am - 3:00pm</option>
          <option value="1-4pm">1:00pm - 4:00pm</option>
          <option value="2-5pm">2:00pm - 5:00pm</option>
          <option value="3-6pm">3:00pm - 6:00pm</option>
        </select>
      </div>
      <div class="form-group">
        <label for="referrer">Person who referred you to us (if applicable)</label>
        <input type="text" class="form-control" id="referrer" name="referrer" placeholder="John Doe">
      </div>
      <button type="submit" class="btn btn-default btn-valentines" id="orderButton">Order</button>
    </form>
    </div>
  </div>
  <div class="col-md-5">
    <img alt="A singing Valentines quartet" class="picture" src="/images/quartet.jpg" />
  </div>
</div>



<script src="https://checkout.stripe.com/checkout.js"></script>
<script>
function getAmount() {
  var selectedOption = $("input[name='optionsRadios']:checked").val();
  var amount = 5000;
  switch (selectedOption) {
    case "friendship": amount = 5000; break;
    case "truelove": amount = 10000; break;
    case "sweetlove": amount = 10000; break;
    case "forever": amount = 15000; break;
  }
  var extra = $('#extra').val();
  amount += extra * 500;
  return amount;
}

function collectFormInfo() {
  var info = '';
  info += "Name: " + $('#name').val();
  info += "\nPhone: " + $('#phone').val();
  info += "\nValentine name: " + $('#valentine').val();
  info += "\nAddress: " + $('#address').val();
  info += "\nCity: " + $('#city').val();
  info += "\nZIP: " + $('#zip').val();
  var selectedOption = $("input[name='optionsRadios']:checked").val();
  info += "\nProduct selected: " + selectedOption;
  var amount = getAmount();
  info += "\nAmount paid: $" + amount / 100.0 + '.00';
  info += "\nMessage:\n" + $('#message').val();
  info += "\nTime window: " + $('#window').val();
  info += "\nReferrer: " + $('#referrer').val();
  return info;
}

$(document).ready(function () {
  $('input:text:visible:first').focus();
  $('#orderButton').prop('disabled', true);
  $('#orderForm').on('keyup blur', function () {
    if ($('#orderForm').valid()) {
      $('#orderButton').prop('disabled', false);
    } else {
      $('#orderButton').prop('disabled', 'disabled');
    }
  });

  $('#orderForm').validate({
    debug: false,
    rules: {
      name: {
        required: true
      },
      phone: {
        required: true,
        phoneUS: true
      },
      valentine: {
        required: true
      },
      address: {
        required: true
      },
      city: {
        required: true
      },
      zip: {
        required: true,
        zipcodeUS: true
      },
      extra: {
        required: false,
        number: true
      }
    },
    submitHandler: function (form) {
      var info = collectFormInfo();
      var handler = StripeCheckout.configure({
        key: 'pk_live_OQBvwJEC1ALJMWBN59v0YWb3',
        locale: 'auto',
        name: 'Saltaires',
        description: info,
        token: function(token) {
          var payload = {
            receipt_email: token.email,
            amount: getAmount(),
            description: info,
            source: token.id
          };
          function success(data) {
            window.location.replace("/valentines-confirm");
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
      handler.open({ amount: getAmount() });
      return false;
    }
  });
});

$(window).on('popstate', function() {
  handler.close();
});
</script>
