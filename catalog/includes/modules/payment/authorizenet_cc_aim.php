<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2008 osCommerce

  Released under the GNU General Public License
*/

  class authorizenet_cc_aim {
    var $code, $title, $description, $enabled;

// class constructor
    function authorizenet_cc_aim() {
      global $order;

      $this->signature = 'authorizenet|authorizenet_cc_aim|1.0|2.2';
      $this->api_version = '3.1';

      $this->code = 'authorizenet_cc_aim';
      $this->title = MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TEXT_TITLE;
      $this->public_title = MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TEXT_PUBLIC_TITLE;
      $this->description = MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_AUTHORIZENET_CC_AIM_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_AUTHORIZENET_CC_AIM_STATUS == 'True') ? true : false);

      if ((int)MODULE_PAYMENT_AUTHORIZENET_CC_AIM_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_AUTHORIZENET_CC_AIM_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();
    }

// class methods
    function update_status() {
      global $order;

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_AUTHORIZENET_CC_AIM_ZONE > 0) ) {
        $check_flag = false;
        $check_query = tep_db_query("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_AUTHORIZENET_CC_AIM_ZONE . "' and zone_country_id = '" . $order->billing['country']['id'] . "' order by zone_id");
        while ($check = tep_db_fetch_array($check_query)) {
          if ($check['zone_id'] < 1) {
            $check_flag = true;
            break;
          } elseif ($check['zone_id'] == $order->billing['zone_id']) {
            $check_flag = true;
            break;
          }
        }

        if ($check_flag == false) {
          $this->enabled = false;
        }
      }
    }

    function javascript_validation() {
      return false;
    }

    function selection() {
      return array('id' => $this->code,
                   'module' => $this->public_title);
    }

    function pre_confirmation_check() {
      return false;
    }

    function confirmation() {
      global $order;

      for ($i=1; $i<13; $i++) {
        $expires_month[] = array('id' => sprintf('%02d', $i), 'text' => strftime('%B',mktime(0,0,0,$i,1,2000)));
      }

      $today = getdate(); 
      for ($i=$today['year']; $i < $today['year']+10; $i++) {
        $expires_year[] = array('id' => strftime('%y',mktime(0,0,0,1,1,$i)), 'text' => strftime('%Y',mktime(0,0,0,1,1,$i)));
      }

      $confirmation = array('fields' => array(array('title' => MODULE_PAYMENT_AUTHORIZENET_CC_AIM_CREDIT_CARD_OWNER,
                                                    'field' => tep_draw_input_field('cc_owner', $order->billing['firstname'] . ' ' . $order->billing['lastname'])),
                                              array('title' => MODULE_PAYMENT_AUTHORIZENET_CC_AIM_CREDIT_CARD_NUMBER,
                                                    'field' => tep_draw_input_field('cc_number_nh-dns')),
                                              array('title' => MODULE_PAYMENT_AUTHORIZENET_CC_AIM_CREDIT_CARD_EXPIRES,
                                                    'field' => tep_draw_pull_down_menu('cc_expires_month', $expires_month) . '&nbsp;' . tep_draw_pull_down_menu('cc_expires_year', $expires_year)),
                                              array('title' => MODULE_PAYMENT_AUTHORIZENET_CC_AIM_CREDIT_CARD_CVC,
                                                    'field' => tep_draw_input_field('cc_cvc_nh-dns', '', 'size="5" maxlength="4"'))));

      return $confirmation;
    }

    function process_button() {
      return false;
    }

    function before_process() {
      global $HTTP_POST_VARS, $customer_id, $order, $sendto, $currency;

      $params = array('x_login' => substr(MODULE_PAYMENT_AUTHORIZENET_CC_AIM_LOGIN_ID, 0, 20),
                      'x_tran_key' => substr(MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TRANSACTION_KEY, 0, 16),
                      'x_version' => '3.1',
                      'x_delim_data' => 'TRUE',
                      'x_delim_char' => ',',
                      'x_encap_char' => '"',
                      'x_relay_response' => 'FALSE',
                      'x_first_name' => substr($order->billing['firstname'], 0, 50),
                      'x_last_name' => substr($order->billing['lastname'], 0, 50),
                      'x_company' => substr($order->billing['company'], 0, 50),
                      'x_address' => substr($order->billing['street_address'], 0, 60),
                      'x_city' => substr($order->billing['city'], 0, 40),
                      'x_state' => substr($order->billing['state'], 0, 40),
                      'x_zip' => substr($order->billing['postcode'], 0, 20),
                      'x_country' => substr($order->billing['country']['title'], 0, 60),
                      'x_phone' => substr($order->customer['telephone'], 0, 25),
                      'x_cust_id' => substr($customer_id, 0, 20),
                      'x_customer_ip' => tep_get_ip_address(),
                      'x_email' => substr($order->customer['email_address'], 0, 255),
                      'x_description' => substr(STORE_NAME, 0, 255),
                      'x_amount' => substr($this->format_raw($order->info['total']), 0, 15),
                      'x_currency_code' => substr($currency, 0, 3),
                      'x_method' => 'CC',
                      'x_type' => ((MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TRANSACTION_METHOD == 'Capture') ? 'AUTH_CAPTURE' : 'AUTH_ONLY'),
                      'x_card_num' => substr($HTTP_POST_VARS['cc_number_nh-dns'], 0, 22),
                      'x_exp_date' => $HTTP_POST_VARS['cc_expires_month'] . $HTTP_POST_VARS['cc_expires_year'],
                      'x_card_code' => substr($HTTP_POST_VARS['cc_cvc_nh-dns'], 0, 4));

      if (is_numeric($sendto) && ($sendto > 0)) {
        $params['x_ship_to_first_name'] = substr($order->delivery['firstname'], 0, 50);
        $params['x_ship_to_last_name'] = substr($order->delivery['lastname'], 0, 50);
        $params['x_ship_to_company'] = substr($order->delivery['company'], 0, 50);
        $params['x_ship_to_address'] = substr($order->delivery['street_address'], 0, 60);
        $params['x_ship_to_city'] = substr($order->delivery['city'], 0, 40);
        $params['x_ship_to_state'] = substr($order->delivery['state'], 0, 40);
        $params['x_ship_to_zip'] = substr($order->delivery['postcode'], 0, 20);
        $params['x_ship_to_country'] = substr($order->delivery['country']['title'], 0, 60);
      }

      if (MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TRANSACTION_MODE == 'Test') {
        $params['x_test_request'] = 'TRUE';
      }

      $tax_value = 0;

      foreach ($order->info['tax_groups'] as $key => $value) {
        if ($value > 0) {
          $tax_value += $this->format_raw($value);
        }
      }

      if ($tax_value > 0) {
        $params['x_tax'] = $this->format_raw($tax_value);
      }

      $params['x_freight'] = $this->format_raw($order->info['shipping_cost']);

      $post_string = '';

      foreach ($params as $key => $value) {
        $post_string .= $key . '=' . urlencode(trim($value)) . '&';
      }

      $post_string = substr($post_string, 0, -1);

      for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
        $post_string .= '&x_line_item=' . urlencode($i+1) . '<|>' . urlencode(substr($order->products[$i]['name'], 0, 31)) . '<|>' . urlencode(substr($order->products[$i]['name'], 0, 255)) . '<|>' . urlencode($order->products[$i]['qty']) . '<|>' . urlencode($this->format_raw($order->products[$i]['final_price'])) . '<|>' . urlencode($order->products[$i]['tax'] > 0 ? 'YES' : 'NO');
      }

      switch (MODULE_PAYMENT_AUTHORIZENET_CC_AIM_TRANSACTION_SERVER) {
        case 'Live':
          $gateway_url = 'https://secure.authorize.net/gateway/transact.dll';
          break;

        default:
          $gateway_url = 'https://test.authorize.net/gateway/transact.dll';
          break;
      }

      $transaction_response = $this->sen<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  switch ($HTTP_GET_VARS['action']) {
    case 'banner':
      $banner_query = tep_db_query("select banners_url from " . TABLE_BANNERS . " where banners_id = '" . (int)$HTTP_GET_VARS['goto'] . "'");
      if (tep_db_num_rows($banner_query)) {
        $banner = tep_db_fetch_array($banner_query);
        tep_update_banner_click_count($HTTP_GET_VARS['goto']);

        tep_redirect($banner['banners_url']);
      }
      break;

    case 'url':
      if (isset($HTTP_GET_VARS['goto']) && tep_not_null($HTTP_GET_VARS['goto'])) {
        $check_query = tep_db_query("select products_url from " . TABLE_PRODUCTS_DESCRIPTION . " where products_url = '" . tep_db_input($HTTP_GET_VARS['goto']) . "' limit 1");
        if (tep_db_num_rows($check_query)) {
          tep_redirect('http://' . $HTTP_GET_VARS['goto']);
        }
      }
      break;

    case 'manufacturer':
      if (isset($HTTP_GET_VARS['manufacturers_id']) && tep_not_null($HTTP_GET_VARS['manufacturers_id'])) {
        $manufacturer_query = tep_db_query("select manufacturers_url from " . TABLE_MANUFACTURERS_INFO . " where manufacturers_id = '" . (int)$HTTP_GET_VARS['manufacturers_id'] . "' and languages_id = '" . (int)$languages_id . "'");
        if (tep_db_num_rows($manufacturer_query)) {
// url exists in selected language
          $manufacturer = tep_db_fetch_array($manufacturer_query);

          if (tep_not_null($manufacturer['manufacturers_url'])) {
            tep_db_query("update " . TABLE_MANUFACTURERS_INFO . " set url_clicked = url_clicked+1, date_last_click = now() where manufacturers_id = '" . (int)$HTTP_GET_VARS['manufacturers_id'] . "' and languages_id = '" . (int)$languages_id . "'");

            tep_redirect($manufacturer['manufacturers_url']);
          }
        } else {
// no url exists for the selected language, lets use the default language then
          $manufacturer_query = tep_db_query("select mi.languages_id, mi.manufacturers_url from " . TABLE_MANUFACTURERS_INFO . " mi, " . TABLE_LANGUAGES . " l where mi.manufacturers_id = '" . (int)$HTTP_GET_VARS['manufacturers_id'] . "' and mi.languages_id = l.languages_id and l.code = '" . DEFAULT_LANGUAGE . "'");
          if (tep_db_num_rows($manufacturer_query)) {
            $manufacturer = tep_db_fetch_array($manufacturer_query);

            if (tep_not_null($manufacturer['manufacturers_url'])) {
              tep_db_query("update " . TABLE_MANUFACTURERS_INFO . " set url_clicked = url_clicked+1, date_last_click = now() where manufacturers_id = '" . (int)$HTTP_GET_VARS['manufacturers_id'] . "' and languages_id = '" . (int)$manufacturer['languages_id'] . "'");

              tep_redirect($manufacturer['manufacturers_url']);
            }
          }
        }
      }
      break;
  }

  tep_redirect(tep_href_link(FILENAME_DEFAULT));
?>
                                                 ÚL   Set Order Status"MODULE_PAYMENT_COD_ORDER_STATUS_ID 0DSet the status of orders made with this payment module to this value   ‡<NQ  tep_get_order_status_name!tep_cfg_pull_down_order_statuses(   ¢ˆM   Enable Flat ShippingMODULE_SHIPPING_FLAT_STATUS True(Do you want to offer flat rate shipping?   ‡<NQ   .tep_cfg_select_option(array('True', 'False'),    ˛N   Shipping CostMODULE_SHIPPING_FLAT_COST 5.00<The shipping cost for all orders using this shipping method.   ‡<NQ      ¶ÚO   	Tax ClassMODULE_SHIPPING_FLAT_TAX_CLASS 00Use the following tax class on the shipping fee.   ‡<NQ  tep_get_tax_class_titletep_cfg_pull_down_tax_classes(   ΩÚP   Shipping ZoneMODULE_SHIPPING_FLAT_ZONE 0FIf a zone is selected, only enable this shipping method for that zone.   ‡<NQ  tep_get_zone_class_titletep_cfg_pull_down_zone_classes( Y˛Q   
Sort OrderMODULE_SHIPPING_FLAT_SORT_ORDER 0Sort order of display.   ‡<NQ     L ˛R   Default CurrencyDEFAULT_CURRENCY USDDefault Curren<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_REVIEWS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_REVIEWS));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1><?php echo HEADING_TITLE; ?></h1>

<div class="contentContainer">

<?php
  $reviews_query_raw = "select r.reviews_id, left(rd.reviews_text, 100) as reviews_text, r.reviews_rating, r.date_added, p.products_id, pd.products_name, p.products_image, r.customers_name from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd, " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = r.products_id and r.reviews_id = rd.reviews_id and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' and rd.languages_id = '" . (int)$languages_id . "' and reviews_status = 1 order by r.reviews_id DESC";
  $reviews_split = new splitPageResults($reviews_query_raw, MAX_DISPLAY_NEW_REVIEWS);

  if ($reviews_split->number_of_rows > 0) {
    if ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3')) {
?>

  <div class="contentText">
    <p style="float: right;"><?php echo TEXT_RESULT_PAGE . ' ' . $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info'))); ?></p>

    <p><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></p>
  </div>

  <br />

<?php
    }

    $reviews_query = tep_db_query($reviews_split->sql_query);
    while ($reviews = tep_db_fetch_array($reviews_query)) {
?>

  <div>
    <span style="float: right;"><?php echo sprintf(TEXT_REVIEW_DATE_ADDED, tep_date_long($reviews['date_added'])); ?></span>
    <h2><?php echo '<a href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $reviews['products_id'] . '&reviews_id=' . $reviews['reviews_id']) . '">' . $reviews['products_name'] . '</a> <span class="smallText">' . sprintf(TEXT_REVIEW_BY, tep_output_string_protected($reviews['customers_name'])) . '</span>'; ?></h2>
  </div>

  <div class="contentText">
    <table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td width="<?php echo SMALL_IMAGE_WIDTH + 10; ?>" align="center" valign="top" class="main"><?php echo '<a href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $reviews['products_id'] . '&reviews_id=' . $reviews['reviews_id']) . '">' . tep_image(DIR_WS_IMAGES . $reviews['products_image'], $reviews['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>'; ?></td>
        <td valign="top"><?php echo tep_break_string(tep_output_string_protected($reviews['reviews_text']), 60, '-<br />') . ((strlen($reviews['reviews_text']) >= 100) ? '..' : '') . '<br /><br /><i>' . sprintf(TEXT_REVIEW_RATING, tep_image(DIR_WS_IMAGES . 'stars_' . $reviews['reviews_rating'] . '.gif', sprintf(TEXT_OF_5_STARS, $reviews['reviews_rating'])), sprintf(TEXT_OF_5_STARS, $reviews['reviews_rating'])) . '</i>'; ?></td>
      </tr>
    </table>
  </div>

<?php
    }
  } else {
?>

  <div class="contentText">
    <?php echo TEXT_NO_REVIEWS; ?>
  </div>

<?php
  }

  if (($reviews_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>

  <br />

  <div class="contentText">
    <p style="float: right;"><?php echo TEXT_RESULT_PAGE . ' ' . $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info'))); ?></p>

    <p><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></p>
  </div>

<?php
  }
?>

</div>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
                                                                                                                                                                                                              <?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SHIPPING);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SHIPPING));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1><?php echo HEADING_TITLE; ?></h1>

<div class="contentContainer">
  <div class="contentText">
    <?php echo TEXT_INFORMATION; ?>
  </div>

  <div class="buttonSet">
    <span class="buttonAction"><?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'triangle-1-e', tep_href_link(FILENAME_DEFAULT)); ?></span>
  </div>
</div>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
                                                                                                                                                                        ton?      ‡<NQ   .tep_cfg_select_option(array('True', 'False'),  ƒ ˆs   Layout Position7MODULE_SOCIAL_BOOKMARKS_PINTEREST_BUTTON_COUNT_POSITION NoneHorizontal or Vertical or None      ‡<NQ   ?tep_cfg_select_option(array('Horizontal', 'Vertical', 'None'),  Ç˛t   
Sort Order,MODULE_SOCIAL_BOOKMARKS_PINTEREST_SORT_ORDER 501Sort order of display. Lowest is displayed first.   ‡<NQ       ∂Úu   Country of OriginSHIPPING_ORIGIN_COUNTRY 223;Select the country of origin to be used in shipping quotes.      ‡<NQ  tep_get_country_nametep_cfg_pull_down_country_list(   Ü˛v   Postal CodeSHIPPING_ORIGIN_ZIP NONEGEnter the Postal Code (ZIP) of the Store to be used in shipping quotes.      ‡<NQ       ¥ ˛w   .Enter the Maximum Package Weight you will shipSHIPPING_MAX_WEIGHT 50TCarriers have a max weight limit for a single package. This is a common one for all.      ‡<NQ     â˛x   Package Tare weight.SHIPPING_BOX_WEIGHT 3DWhat is the weight of typical packaging of small to medium packages?      ‡<NQ     i˛y   &Larger packages - percentage increase.SHIPPING_BOX_PADDING 10For 10% enter 10      ‡<NQ     n˛z   Display Product ImagePRODUCT_LIST_IMAGE 1)Do you want to display the Product Image?      ‡<NQ       ç˛{   !Display Product Manufacturer NamePRODUCT_LIST_MANUFACTURER 05Do you want to display the Product Manufacturer Name?      ‡<NQ     n˛|   Display Product ModelPRODUCT_LIST_MODEL 0)Do you want to display the Product Model?      ‡<NQ       k˛}   Display Product NamePRODUCT_LIST_NAME 2(Do you want to display the Product Name?      ‡<NQ      m˛~   Display Product P