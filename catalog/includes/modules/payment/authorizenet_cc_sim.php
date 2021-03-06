<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2008 osCommerce

  Released under the GNU General Public License
*/

  class authorizenet_cc_sim {
    var $code, $title, $description, $enabled;

// class constructor
    function authorizenet_cc_sim() {
      global $order;

      $this->signature = 'authorizenet|authorizenet_cc_sim|1.0|2.2';
      $this->api_version = '3.1';

      $this->code = 'authorizenet_cc_sim';
      $this->title = MODULE_PAYMENT_AUTHORIZENET_CC_SIM_TEXT_TITLE;
      $this->public_title = MODULE_PAYMENT_AUTHORIZENET_CC_SIM_TEXT_PUBLIC_TITLE;
      $this->description = MODULE_PAYMENT_AUTHORIZENET_CC_SIM_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_AUTHORIZENET_CC_SIM_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_AUTHORIZENET_CC_SIM_STATUS == 'True') ? true : false);

      if ((int)MODULE_PAYMENT_AUTHORIZENET_CC_SIM_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_AUTHORIZENET_CC_SIM_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();

      switch (MODULE_PAYMENT_AUTHORIZENET_CC_SIM_TRANSACTION_SERVER) {
        case 'Live':
          $this->form_action_url = 'https://secure.authorize.net/gateway/transact.dll';
          break;

        default:
          $this->form_action_url = 'https://test.authorize.net/gateway/transact.dll';
          break;
      }
    }

// class methods
    function update_status() {
      global $order;

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_AUTHORIZENET_CC_SIM_ZONE > 0) ) {
        $check_flag = false;
        $check_query = tep_db_query("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_AUTHORIZENET_CC_SIM_ZONE . "' and zone_country_id = '" . $order->billing['country']['id'] . "' order by zone_id");
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
      return false;
    }

    function process_button() {
      global $customer_id, $order, $sendto, $currency;

      $process_button_string = $this->_InsertFP(MODULE_PAYMENT_AUTHORIZENET_CC_SIM_LOGIN_ID, MODULE_PAYMENT_AUTHORIZENET_CC_SIM_TRANSACTION_KEY, $this->format_raw($order->info['total']), rand(1, 1000), $currency);

      $process_button_string .= tep_draw_hidden_field('x_login', substr(MODULE_PAYMENT_AUTHORIZENET_CC_SIM_LOGIN_ID, 0, 20)) .
                                tep_draw_hidden_field('x_version', '3.1') .
                                tep_draw_hidden_field('x_show_form', 'PAYMENT_FORM') .
                                tep_draw_hidden_field('x_relay_response', 'TRUE') .
                                tep_draw_hidden_field('x_relay_url', tep_href_link(FILENAME_CHECKOUT_PROCESS, '', 'SSL', false)) .
                                tep_draw_hidden_field('x_first_name', substr($order->billing['firstname'], 0, 50)) .
                                tep_draw_hidden_field('x_last_name', substr($order->billing['lastname'], 0, 50)) .
                                tep_draw_hidden_field('x_company', substr($order->billing['company'], 0, 50)) .
                                tep_draw_hidden_field('x_address', substr($order->billing['street_address'], 0, 60)) .
                                tep_draw_hidden_field('x_city', substr($order->billing['city'], 0, 40)) .
                                tep_draw_hidden_field('x_state', substr($order->billing['state'], 0, 40)) .
                                tname'] . ' ' . $products[$i][$option]['products_options_values_name'] . '</i></small>';
        }
      }

      $products_name .= '<br /><br />' . tep_draw_input_field('cart_quantity[]', $products[$i]['quantity'], 'size="4"') . tep_draw_hidden_field('products_id[]', $products[$i]['id']) . tep_draw_button(IMAGE_BUTTON_UPDATE, 'refresh') . '&nbsp;&nbsp;&nbsp;' . TEXT_OR . '<a href="' . tep_href_link(FILENAME_SHOPPING_CART, 'products_id=' . $products[$i]['id'] . '&action=remove_product') . '">' . TEXT_REMOVE . '</a>';

      $products_name .= '    </td>' .
                        '  </tr>' .
                        '</table>';

      echo '        <td valign="top">' . $products_name . '</td>' .
           '        <td align="right" valign="top"><strong>' . $currencies->display_price($products[$i]['final_price'], tep_get_tax_rate($products[$i]['tax_class_id']), $products[$i]['quantity']) . '</strong></td>' .
           '      </tr>';
    }
?>

    </table>

    <p align="right"><strong><?php echo SUB_TITLE_SUB_TOTAL; ?> <?php echo $currencies->format($cart->show_total()); ?></strong></p>

<?php
    if ($any_out_of_stock == 1) {
      if (STOCK_ALLOW_CHECKOUT == 'true') {
?>

    <p class="stockWarning" align="center"><?php echo OUT_OF_STOCK_CAN_CHECKOUT; ?></p>

<?php
      } else {
?>

    <p class="stockWarning" align="center"><?php echo OUT_OF_STOCK_CANT_CHECKOUT; ?></p>

<?php
      }
    }
?>

  </div>

  <div class="buttonSet">
    <span class="buttonAction"><?php echo tep_draw_button(IMAGE_BUTTON_CHECKOUT, 'triangle-1-e', tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'), 'primary'); ?></span>
  </div>

<?php
    $initialize_checkout_methods = $payment_modules->checkout_initialization_method();

    if (!empty($initialize_checkout_methods)) {
?>

  <p align="right" style="clear: both; padding: 15px 50px 0 0;"><?php echo TEXT_ALTERNATIVE_CHECKOUT_METHODS; ?></p>

<?php
      reset($initialize_checkout_methods);
      while (list(, $value) = each($initialize_checkout_methods)) {
?>

  <p align="right"><?php echo $value; ?></p>

<?php
      }
    }
?>

</div>

</form>

<?php
  } else {
?>

<div class="contentContainer">
  <div class="contentText">
    <?php echo TEXT_CART_EMPTY; ?>

    <p align="right"><?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'triangle-1-e', tep_href_link(FILENAME_DEFAULT)); ?></p>
  </div>
</div>

<?php
  }

  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
                                                                     this payment method for that zone.      �<NQ  tep_get_zone_class_titletep_cfg_pull_down_zone_classes( ���   Sort order of display.(MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER 01Sort order of display. Lowest is displayed first.   �<NQ     ��   Set Order Status-MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID 0DSet the status of orders made with this payment module to this value   �<NQ  tep_get_order_status_name!tep_cfg_pull_down_order_statuses( ��   &PayPal Transactions Order Status Level:MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID 4AInclude PayPal transaction information in this order status level   �<NQ  tep_get_order_status_name!tep_cfg_pull_down_order_statuses( ���   cURL Program Location"MODULE_PAYMENT_PAYPAL_EXPRESS_CURL /usr/bin/curl-The location to the cURL program application.   �<NQ      ��   Installed ModulesMODULE_HEADER_TAGS_INSTALLEDj ht_canonical.php;ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_robot_noindex.phpnList of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.   �<NQ       ���   Enable Category Title Module(MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS TrueCDo you want to allow category titles to be added to the page title?      �<NQ   .tep_cfg_select_option(array('True', 'False'),    ���   
Sort Order,MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER 2001Sort order of display. Lowest is displayed first.   �<NQ      ���    Enable Manufacturer T<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SPECIALS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SPECIALS));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1><?php echo HEADING_TITLE; ?></h1>

<div class="contentContainer">
  <div class="contentText">

<?php
  $specials_query_raw = "select p.products_id, pd.products_name, p.products_price, p.products_tax_class_id, p.products_image, s.specials_new_products_price from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, " . TABLE_SPECIALS . " s where p.products_status = '1' and s.products_id = p.products_id and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' and s.status = '1' order by s.specials_date_added DESC";
  $specials_split = new splitPageResults($specials_query_raw, MAX_DISPLAY_SPECIAL_PRODUCTS);

  if (($specials_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>

    <div>
      <span style="float: right;"><?php echo TEXT_RESULT_PAGE . ' ' . $specials_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></span>

      <span><?php echo $specials_split->display_count(TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></span>
    </div>

    <br />

<?php
  }
?>

    <table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
<?php
    $row = 0;
    $specials_query = tep_db_query($specials_split->sql_query);
    while ($specials = tep_db_fetch_array($specials_query)) {
      $row++;

      echo '        <td align="center" width="33%"><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $specials['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $specials['products_image'], $specials['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a><br /><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $specials['products_id']) . '">' . $specials['products_name'] . '</a><br /><del>' . $currencies->display_price($specials['products_price'], tep_get_tax_rate($specials['products_tax_class_id'])) . '</del><br /><span class="productSpecialPrice">' . $currencies->display_price($specials['specials_new_products_price'], tep_get_tax_rate($specials['products_tax_class_id'])) . '</span></td>' . "\n";

      if ((($row / 3) == floor($row / 3))) {
?>
      </tr>
      <tr>
<?php
      }
    }
?>
      </tr>
    </table>

<?php
  if (($specials_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>

    <br />

    <div>
      <span style="float: right;"><?php echo TEXT_RESULT_PAGE . ' ' . $specials_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></span>

      <span><?php echo $specials_split->display_count(TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></span>
    </div>

<?php
  }
?>

  </div>
</div>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
                                                                                                                                                                                                                                                                                                                                                    LE_ADMIN_DASHBOARD_LATEST_NEWS_STATUS True@Do you want to show the latest osCommerce News on the dashboard?      �<NQ   .tep_cfg_select_option(array('True', 'False'),  � ��   
Sort Order-MODULE_ADMIN_DASHBOARD_LATEST_NEWS_SORT_ORDER 7001Sort order of display. Lowest is displayed first.   �<NQ     ���   Enable Orders Module$MODULE_ADMIN_DASHBOARD_ORDERS_STATUS True7Do you want to show the latest orders on the dashboard?      �<NQ   .tep_cfg_select_option(array('True', 'False'),    �� <?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SSL_CHECK);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SSL_CHECK));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1><?php echo HEADING_TITLE; ?></h1>

<div class="contentContainer">
  <div class="contentText">
    <div class="ui-widget infoBoxContainer" style=" width: 40%; float: right; padding: 0 0 10px 10px;">
      <div class="ui-widget-header infoBoxHeading"><?php echo BOX_INFORMATION_HEADING; ?></div>

      <div class="ui-widget-content infoBoxContents">
        <?php echo BOX_INFORMATION; ?>
      </div>
    </div>

    <?php echo TEXT_INFORMATION; ?>
  </div>

  <div class="buttonSet">
    <span class="buttonAction"><?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'triangle-1-e', tep_href_link(FILENAME_LOGIN)); ?></span>
  </div>
</div>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
                                                                                                                                                                                                                                                                                                                                                                         rst.   �<NQ       � ��   Enable Latest Reviews Module%MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS True8Do you want to show the latest reviews on the dashboard?      �<NQ   .tep_cfg_select_option(array('True', 'False'),  ���   
Sort Order)MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER 10001Sort order of display. Lowest is displayed first.   �<NQ     ���   Enable Partner News Module*MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_STATUS TrueHDo you want to show the latest osCommerce Partner News on the dashboard?      �<NQ   .tep_cfg_select_option(array('True', 'False'),   ���   
Sort Order.MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_SORT_ORDER 8201Sort order of display. Lowest is displayed first.   �<NQ    ��      �p��   Installed ModulesMODULE_BOXES_INSTALLED,bm_featured.php;bm_categories.php;bm_manufacturers.php;bm_search.php;bm_whats_new.php;bm_information.php;bm_shopping_cart.php;bm_manufacturer_info.php;bm_order_history.php;bm_best_sellers.php;bm_product_notifications.php;bm_product_social_bookmarks.php;bm_specials.php;bm_reviews.php;bm_languages.phpgList of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.   � � ��   Enable Best Sellers Module MODULE_BOXES_BEST_SELLERS_STATUS True+Do you want to add the module to your shop?      �<NQ   .tep_cfg_select_option(array('True', 'False'),  ���   Content Placement+MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT Right Column8Should the module be loaded in the left or right column?      �<NQ   <tep_cfg_select_option(array('Left Column', 'Right Column'),  | ��   
Sort Order$MODULE_BOXES_BEST_SELLERS_SORT_ORDER 50301Sort order of display. Lowest is displayed first.   �<NQ     � ��   Enable Categories ModuleMODULE_BOXES_CATEGORIES_STATUS True+Do you want to add the module to your shop?      �<NQ   .tep_cfg_select_option(array('True', 'False'),  ���   Content Placement)MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT Left Column8Should the module be loaded in the left or right column?      �<NQ   <tep_cfg_select_option(array('Left Column', 'Right Column'),    z��   
Sort Order"MODULE_BOXES_CATEGORIES_SORT_ORDER 10001Sort order of display. Lowest is displayed first.   �<NQ       � ��   Enable Currencies ModuleMODULE_BOXES_CURRENCIES_STATUS True+Do you want to add the module to your shop?      �<NQ   .tep_cfg_select_o