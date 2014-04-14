<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  if (!class_exists('moneybookers')) {
    include(DIR_FS_CATALOG . 'includes/modules/payment/moneybookers.php');
  }

  class moneybookers_psp extends moneybookers {
    var $code, $title, $description, $enabled;

    var $_sid; // Moneybookers transaction session ID
    var $_mbcartID = 'cart_MoneybookersPSP_ID';
    var $_payment_method = 'PSP';
    var $_payment_method_image = 'postepay.gif';

// class constructor
    function moneybookers_psp() {
      global $order;

      $this->signature = 'moneybookers|moneybookers_psp|1.0|2.3';

      $this->code = 'moneybookers_psp';
      $this->title = MODULE_PAYMENT_MONEYBOOKERS_PSP_TEXT_TITLE;
      $this->public_title = MODULE_PAYMENT_MONEYBOOKERS_PSP_TEXT_PUBLIC_TITLE;
      $this->description = MODULE_PAYMENT_MONEYBOOKERS_PSP_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_MONEYBOOKERS_PSP_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_MONEYBOOKERS_PSP_STATUS == 'True') ? true : false);

      if ((int)MODULE_PAYMENT_MONEYBOOKERS_PSP_PREPARE_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_MONEYBOOKERS_PSP_PREPARE_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();

      if (defined('MODULE_PAYMENT_MONEYBOOKERS_IFRAME') && (MODULE_PAYMENT_MONEYBOOKERS_IFRAME == 'True')) {
        $this->form_action_url = tep_href_link('ext/modules/payment/moneybookers/checkout.php', '', 'SSL');
      } else {
        $this->form_action_url = 'https://www.moneybookers.com/app/payment.pl';
      }
    }

// class methods
    function update_status() {
      global $order;

      if (!defined('MODULE_PAYMENT_MONEYBOOKERS_STATUS')) {
        $this->enabled = false;
      } elseif ( ($this->enabled == true) && ((int)MODULE_PAYMENT_MONEYBOOKERS_PSP_ZONE > 0) ) {
        $check_flag = false;
        $check_query = tep_db_query("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_MONEYBOOKERS_PSP_ZONE . "' and zone_country_id = '" . $order->billing['country']['id'] . "' order by zone_id");
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

    function confirmation() {
      global $language;

      include(DIR_FS_CATALOG . 'includes/languages/' . $language . '/modules/payment/moneybookers.php');

      parent::confirmation();
    }

    function check() {
      if (!isset($this->_check)) {
        $check_query = tep_db_query("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_MONEYBOOKERS_PSP_STATUS'");
        $this->_check = tep_db_num_rows($check_query);
      }
      return $this->_check;
    }

    function install() {
      if (!defined('MODULE_PAYMENT_MONEYBOOKERS_STATUS')) {
        tep_redirect(tep_href_link('ext/modules/payment/moneybookers/activation.php', 'action=coreRequired'));
      }

      $zone_id = 0;

      $zone_query = tep_db_query("select geo_zone_id from " . TABLE_GEO_ZONES . " where geo_zone_name = 'Moneybookers Postepay'");
      if (tep_db_num_rows($zone_query)) {
        $zone = tep_db_fetch_array($zone_query);

        $zone_id = $zone['geo_zone_id'];
      } else {
        tep_db_query("insert into " . TABLE_GEO_ZONES . " values (null, 'Moneybookers Postepay', 'The zone for the Moneybookers Postepay payment module', null, now())");
        $zone_id = tep_db_insert_id();

        $country_query = tep_db_query("select countries_id from " . TABLE_COUNTRIES . " where countries_iso_code_2 = 'IT'");
        if (tep_db_num_rows($country_query)) {
          $country = tep_db_fetch_array($country_query);

          tep_db_query("insert into " . TABLE_ZONES_TO_GEO_ZONES . " values (null, '" . (int)$country['countries_id'] . "', 0, '" . (int)$zone_id . "', null, now())");
        }
      }

      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Moneybookers Postepay', 'MODULE_PAYMENT_MONEYBOOKERS_PSP_STATUS', 'False', 'Do you want to accept Moneybookers Postepay payments?', '6', '3', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFI