---
layout: default
title: Valentines
permalink: /valentines/
---

### Singing Valentines

<div class="row">
  <div class="col-md-7">
    <p>
    Knock your Valentine off their feet with this unforgettable gift! A top-notch
    barbershop quartet will arrive at your chosen time slot on Valentines Day,
    sing the classic polecat love songs for your valentine and deliver a gift
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
            <input type="radio" name="optionsRadios" id="optionsRadios1" value="basic" checked>
            Basic package: card, rose and a couple of songs ($50)
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios2" value="chocolates">
            Basic package plus a box of chocolates ($100)
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios3" value="roses">
            Basic package plus a dozen roses ($100)
          </label>
        </div>
        <div class="radio">
          <label class="last">
            <input type="radio" name="optionsRadios" id="optionsRadios4" value="theworks" checked="checked">
            Basic package plus a box of chocolates plus a dozen roses ($150)
          </label>
        </div>
      </div>
      <div class="form-group">
        <label for="message">Message you would like on the card</label>
        <textarea id="message" name="message" class="form-control" rows="3"></textarea>
      </div>
      <div class="form-group">
        <label for="window">Time window</label>
        <select class="form-control" id="window" name="window">
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
    <img alt="A singing Valentines quartet" class="portrait" src="/images/quartet.jpg" />
  </div>
</div>



<script src="https://checkout.stripe.com/checkout.js"></script>
<script>
function getAmount() {
  var selectedOption = $("input[name='optionsRadios']:checked").val();
  var amount = 5000;
  switch (selectedOption) {
    case "basic": amount = 5000; break;
    case "chocolates": amount = 10000; break;
    case "roses": amount = 10000; break;
    case "theworks": amount = 15000; break;
  }
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
    debug: true,
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
