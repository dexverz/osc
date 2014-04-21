<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2009 osCommerce

  Released under the GNU General Public License
*/

  class sage_pay_direct {
    var $code, $title, $description, $enabled;

// class constructor
    function sage_pay_direct() {
      global $order;

      $this->signature = 'sage_pay|sage_pay_direct|1.0|2.3';

      $this->code = 'sage_pay_direct';
      $this->title = MODULE_PAYMENT_SAGE_PAY_DIRECT_TEXT_TITLE;
      $this->public_title = MODULE_PAYMENT_SAGE_PAY_DIRECT_TEXT_PUBLIC_TITLE;
      $this->description = MODULE_PAYMENT_SAGE_PAY_DIRECT_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_SAGE_PAY_DIRECT_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_SAGE_PAY_DIRECT_STATUS == 'True') ? true : false);

      if ((int)MODULE_PAYMENT_SAGE_PAY_DIRECT_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_SAGE_PAY_DIRECT_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();
    }

// class methods
    function update_status() {
      global $order;

      if ( ($this->enabled == true) && ($this->hasCards() == false) ) {
        $this->enabled = false;
      }

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_SAGE_PAY_DIRECT_ZONE > 0) ) {
        $check_flag = false;
        $check_query = tep_db_query("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_SAGE_PAY_DIRECT_ZONE . "' and zone_country_id = '" . $order->billing['country']['id'] . "' order by zone_id");
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

      $card_types = array();
      foreach ($this->getCardTypes() as $key => $value) {
        $card_types[] = array('id' => $key,
                              'text' => $value);
      }

      $today = getdate(); 

      $months_array = array();
      for ($i=1; $i<13; $i++) {
        $months_array[] = array('id' => sprintf('%02d', $i), 'text' => strftime('%B', mktime(0, 0, 0, $i, 1, 2000)));
      }

      $year_valid_to_array = array();
      for ($i=$today['year']; $i < $today['year']+10; $i++) {
        $year_valid_to_array[] = array('id' => strftime('%y', mktime(0, 0, 0, 1, 1, $i)), 'text' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)));
      }

      $year_valid_from_array = array();
      for ($i=$today['year']-4; $i < $today['year']+1; $i++) {
        $year_valid_from_array[] = array('id' => strftime('%y', mktime(0, 0, 0, 1, 1, $i)), 'text' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)));
      }

      $confirmation = array('fields' => array(array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_TYPE,
                                                    'field' => tep_draw_pull_down_menu('cc_type', $card_types)),
                                              array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_OWNER,
                                                    'field' => tep_draw_input_field('cc_owner', $order->billing['firstname'] . ' ' . $order->billing['lastname'], 'maxlength="50"')),
                                              array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_NUMBER,
                                                    'field' => tep_draw_input_field('cc_number_nh-dns', '', 'maxlength="20"'))));

      if ( (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_MAESTRO == 'True') || (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_SOLO == 'True') || (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_AMEX == 'True') ) {
        $confirmation['fields'][] = array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_STARTS,
                                          'field' => tep_draw_pull_down_menu('cc_starts_month', $months_array) . '&nbsp;' . tep_draw_pull_down_menu('cc_starts_year', $year_valid_from_array) . '&nbsp;' . MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_STARTS_INFO);
      }

      $confirmation['fields'][] = array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_EXPIRES,
                                        'field' => tep_draw_pull_down_menu('cc_expires_month', $months_array) . '&nbsp;' . tep_draw_pull_down_menu('cc_expires_year', $year_valid_to_array));

      if ( (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_MAESTRO == 'True') || (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_SOLO == 'True') ) {
        $confirmation['fields'][] = array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_ISSUE_NUMBER,
                                          'field' => tep_draw_input_field('cc_issue_nh-dns', '', 'size="3" maxlength="2"') . '&nbsp;' . MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_ISSUE_NUMBER_INFO);
      }

      if (MODULE_PAYMENT_SAGE_PAY_DIRECT_VERIFY_WITH_CVC == 'True') {
        $confirmation['fields'][] = array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_CREDIT_CARD_CVC,
                                          'field' => tep_draw_input_field('cc_cvc_nh-dns', '', 'size="5" maxlength="4"'));
      }

      return $confirmation;
    }

    function process_button() {
      return false;
    }

    function before_process() {
      global $HTTP_GET_VARS, $HTTP_POST_VARS, $customer_id, $order, $currency, $order_totals, $cartID;

      $error = null;

      if (isset($HTTP_GET_VARS['check']) && ($HTTP_GET_VARS['check'] == '3D') && isset($HTTP_POST_VARS['MD']) && tep_not_null($HTTP_POST_VARS['MD']) && isset($HTTP_POST_VARS['PaRes']) && tep_not_null($HTTP_POST_VARS['PaRes'])) {
        switch (MODULE_PAYMENT_SAGE_PAY_DIRECT_TRANSACTION_SERVER) {
          case 'Live':
            $gateway_url = 'https://live.sagepay.com/gateway/service/direct3dcallback.vsp';
            break;

          case 'Test':
            $gateway_url = 'https://test.sagepay.com/gateway/service/direct3dcallback.vsp';
            break;

          default:
            $gateway_url = 'https://test.sagepay.com/Simulator/VSPDirectCallback.asp';
            break;
        }

        $post_string = 'MD=' . $HTTP_POST_VARS['MD'] . '&PARes=' . $HTTP_POST_VARS['PaRes'];

        $transaction_response = $this->sendTransactionToGateway($gateway_url, $post_string);
      } else {
        $cc_type = substr($HTTP_POST_VARS['cc_type'], 0, 15);
        $cc_owner = substr($HTTP_POST_VARS['cc_owner'], 0, 50);
        $cc_number = substr(preg_replace('/[^0-9]/', '', $HTTP_POST_VARS['cc_number_nh-dns']), 0, 20);
        $cc_start = null;
        $cc_expires = null;
        $cc_issue = null;
        $cc_cvc = null;

        $today = getdate(); 

        $months_array = array();
        for ($i=1; $i<13; $i++) {
          $months_array[] = sprintf('%02d', $i);
        }

        $year_valid_to_array = array();
        for ($i=$today['year']; $i < $today['year']+10; $i++) {
          $year_valid_to_array[] = strftime('%y',mktime(0,0,0,1,1,$i));
        }

        $year_valid_from_array = array();
        for ($i=$today['year']-4; $i < $today['year']+1; $i++) {
          $year_valid_from_array[] = strftime('%Y',mktime(0,0,0,1,1,$i));
        }

        if ( (isset($HTTP_POST_VARS['cc_type']) == false) || ($this->isCard($cc_type) == false) ) {
          tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardtype', 'SSL'));
        }

        if ( (isset($HTTP_POST_VARS['cc_owner']) == false) || empty($cc_owner) ) {
          tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardowner', 'SSL'));
        }

        if ( (isset($HTTP_POST_VARS['cc_number_nh-dns']) == false) || (is_numeric($cc_number) == false) ) {
          tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardnumber', 'SSL'));
        }

        if ( (($cc_type == 'MAESTRO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_MAESTRO == 'True')) || (($cc_type == 'SOLO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_SOLO == 'True')) || (($cc_type == 'AMEX') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_AMEX == 'True')) ) {
          if ( in_array($HTTP_POST_VARS['cc_starts_month'], $months_array) == false ) {
            tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardstart', 'SSL'));
          }

          if ( in_array($HTTP_POST_VARS['cc_starts_year'], $year_valid_from_array) == false ) {
            tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardstart', 'SSL'));
          }

          $cc_start = substr($HTTP_POST_VARS['cc_starts_month'] . $HTTP_POST_VARS['cc_starts_year'], 0, 4);
        }

        if ( in_array($HTTP_POST_VARS['cc_expires_month'], $months_array) == false ) {
          tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardexpires', 'SSL'));
        }

        if ( in_array($HTTP_POST_VARS['cc_expires_year'], $year_valid_to_array) == false ) {
          tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardexpires', 'SSL'));
        }

        if ( ($HTTP_POST_VARS['cc_expires_year'] == date('y')) && ($HTTP_POST_VARS['cc_expires_month'] < date('m')) ) {
          tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardexpires', 'SSL'));
        }

        $cc_expires = substr($HTTP_POST_VARS['cc_expires_month'] . $HTTP_POST_VARS['cc_expires_year'], 0, 4);

        if ( (($cc_type == 'MAESTRO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_MAESTRO == 'True')) || (($cc_type == 'SOLO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_SOLO == 'True')) ) {
          $cc_issue = substr($HTTP_POST_VARS['cc_issue_nh-dns'], 0, 2);

          if ( (isset($HTTP_POST_VARS['cc_issue_nh-dns']) == false) || empty($cc_issue) ) {
            tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardissue', 'SSL'));
          }
        }

        if (MODULE_PAYMENT_SAGE_PAY_DIRECT_VERIFY_WITH_CVC == 'True') {
          $cc_cvc = substr($HTTP_POST_VARS['cc_cvc_nh-dns'], 0, 4);

          if ( (isset($HTTP_POST_VARS['cc_cvc_nh-dns']) == false) || empty($cc_cvc) ) {
            tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . '&error=cardcvc', 'SSL'));
          }
        }

        $params = array('VPSProtocol' => '2.23',
                        'ReferrerID' => 'C74D7B82-E9EB-4FBD-93DB-76F0F551C802',
                        'Vendor' => substr(MODULE_PAYMENT_SAGE_PAY_DIRECT_VENDOR_LOGIN_NAME, 0, 15),
                        'VendorTxCode' => substr(date('YmdHis') . '-' . $customer_id . '-' . $cartID, 0, 40),
                        'Amount' => $this->format_raw($order->info['total']),
                        'Currency' => $currency,
                        'Description' => substr(STORE_NAME, 0, 100),
                        'CardHolder' => $cc_owner,
                        'CardNumber' => $cc_number,
                        'ExpiryDate' => $cc_expires,
                        'CardType' => $cc_type,
                        'BillingSurname' => substr($order->billing['lastname'], 0, 20),
                        'BillingFirstnames' => substr($order->billing['firstname'], 0, 20),
                        'BillingAddress1' => substr($order->billing['street_address'], 0, 100),
                        'BillingCity' => substr($order->billing['city'], 0, 40),
                        'BillingPostCode' => substr($order->billing['postcode'], 0, 10),
                        'BillingCountry' => $order->billing['country']['iso_code_2'],
                        'BillingPhone' => substr($order->customer['telephone'], 0, 20),
                        'DeliverySurname' => substr($order->delivery['lastname'], 0, 20),
                        'DeliveryFirstnames' => substr($order->delivery['firstname'], 0, 20),
                        'DeliveryAddress1' => substr($order->delivery['street_address'], 0, 100),
                        'DeliveryCity' => substr($order->delivery['city'], 0, 40),
                        'DeliveryPostCode' => substr($order->delivery['postcode'], 0, 10),
                        'DeliveryCountry' => $order->delivery['country']['iso_code_2'],
                        'CustomerName' => substr($order->billing['firstname'] . ' ' . $order->billing['lastname'], 0, 100),
                        'DeliveryPhone' => substr($order->customer['telephone'], 0, 20),
                        'CustomerEMail' => substr($order->customer['email_address'], 0, 255),
                        'Apply3DSecure' => '0');

        $ip_address = tep_get_ip_address();

        if ( (ip2long($ip_address) != -1) && (ip2long($ip_address) != false) ) {
          $params['ClientIPAddress']= $ip_address;
        }

        if ( MODULE_PAYMENT_SAGE_PAY_DIRECT_TRANSACTION_METHOD == 'Payment' ) {
          $params['TxType'] = 'PAYMENT';
        } elseif ( MODULE_PAYMENT_SAGE_PAY_DIRECT_TRANSACTION_METHOD == 'Deferred' ) {
          $params['TxType'] = 'DEFERRED';
        } else {
          $params['TxType'] = 'AUTHENTICATE';
        }

        if ( (($cc_type == 'MAESTRO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_MAESTRO == 'True')) || (($cc_type == 'SOLO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_SOLO == 'True')) || (($cc_type == 'AMEX') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_AMEX == 'True')) ) {
          $params['StartDate'] = $cc_start;
        }

        if ( (($cc_type == 'MAESTRO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_MAESTRO == 'True')) || (($cc_type == 'SOLO') && (MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_SOLO == 'True')) ) {
          $params['IssueNumber'] = $cc_issue;
        }

        if (MODULE_PAYMENT_SAGE_PAY_DIRECT_VERIFY_WITH_CVC == 'True') {
          $params['CV2'] = $cc_cvc;
        }

        if ($params['BillingCountry'] == 'US') {
          $params['BillingState'] = tep_get_zone_code($order->billing['country']['id'], $order->billing['zone_id'], '');
        }

        if ($params['DeliveryCountry'] == 'US') {
          $params['DeliveryState'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], '');
        }

        $contents = array();

        foreach ($order->products as $product) {
          $product_name = $product['name'];

          if (isset($product['attributes'])) {
            foreach ($product['attributes'] as $att) {
              $product_name .= '; ' . $att['option'] . '=' . $att['value'];
            }
          }

          $contents[] = str_replace(array(':', "\n", "\r", '&'), '', $product_name) . ':' . $product['qty'] . ':' . $this->format_raw($product['final_price']) . ':' . $this->format_raw(($product['tax'] / 100) * $product['final_price']) . ':' . $this->format_raw((($product['tax'] / 100) * $product['final_price']) + $product['final_price']) . ':' . $this->format_raw(((($product['tax'] / 100) * $product['final_price']) + $product['final_price']) * $product['qty']);
        }

        foreach ($order_totals as $ot) {
          $contents[] = str_replace(array(':', "\n", "\r", '&'), '', strip_tags($ot['title'])) . ':---:---:---:---:' . $this->format_raw($ot['value']);
        }

        $params['Basket'] = substr(sizeof($contents) . ':' . implode(':', $contents), 0, 7500);

        $post_string = '';

        foreach ($params as $key => $value) {
          $post_string .= $key . '=' . urlencode(trim($value)) . '&';
        }

        switch (MODULE_PAYMENT_SAGE_PAY_DIRECT_TRANSACTION_SERVER) {
          case 'Live':
            $gateway_url = 'https://live.sagepay.com/gateway/service/vspdirect-register.vsp';
            break;

          case 'Test':
            $gateway_url = 'https://test.sagepay.com/gateway/service/vspdirect-register.vsp';
            break;

          default:
            $gateway_url = 'https://test.sagepay.com/Simulator/VSPDirectGateway.asp';
            break;
        }

        $transaction_response = $this->sendTransactionToGateway($gateway_url, $post_string);
      }

      $string_array = explode(chr(10), $transaction_response);
      $return = array();

      foreach ($string_array as $string) {
        if (strpos($string, '=') != false) {
          $parts = explode('=', $string, 2);
          $return[trim($parts[0])] = trim($parts[1]);
        }
      }

      if ($return['Status'] == '3DAUTH') {
        global $sage_pay_direct_acsurl, $sage_pay_direct_pareq, $sage_pay_direct_md;

        tep_session_register('sage_pay_direct_acsurl');
        $sage_pay_direct_acsurl = $return['ACSURL'];

        tep_session_register('sage_pay_direct_pareq');
        $sage_pay_direct_pareq = $return['PAReq'];

        tep_session_register('sage_pay_direct_md');
        $sage_pay_direct_md = $return['MD'];

        tep_redirect(tep_href_link('ext/modules/payment/sage_pay/checkout.php', '', 'SSL'));
      }

      if ( ($return['Status'] != 'OK') && ($return['Status'] != 'AUTHENTICATED') && ($return['Status'] != 'REGISTERED') ) {
        $error = $this->getErrorMessageNumber($return['StatusDetail']);

        tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'payment_error=' . $this->code . (tep_not_null($error) ? '&error=' . $error : ''), 'SSL'));
      }

      if ( isset($return['VPSTxId']) ) {
        $order->info['comments'] = 'Sage Pay Reference ID: ' . $return['VPSTxId'] . (tep_not_null($order->info['comments']) ? "\n\n" . $order->info['comments'] : '');
      }
    }

    function after_process() {
      if (tep_session_is_registered('sage_pay_direct_acsurl')) {
        tep_session_unregister('sage_pay_direct_acsurl');
        tep_session_unregister('sage_pay_direct_pareq');
        tep_session_unregister('sage_pay_direct_md');
      }
    }

    function get_error() {
      global $HTTP_GET_VARS;

      $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_GENERAL;

      if ( isset($HTTP_GET_VARS['error']) && tep_not_null($HTTP_GET_VARS['error']) ) {
        if ( is_numeric($HTTP_GET_VARS['error']) && $this->errorMessageNumberExists($HTTP_GET_VARS['error']) ) {
          $message = $this->getErrorMessage($HTTP_GET_VARS['error']) . ' ' . MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_GENERAL;
        } else {
          switch ($HTTP_GET_VARS['error']) {
            case 'cardtype':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDTYPE;
              break;

            case 'cardowner':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDOWNER;
              break;

            case 'cardnumber':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDNUMBER;
              break;

            case 'cardstart':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDSTART;
              break;

            case 'cardexpires':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDEXPIRES;
              break;

            case 'cardissue':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDISSUE;
              break;

            case 'cardcvc':
              $message = MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_CARDCVC;
              break;
          }
        }
      }

      $error = array('title' => MODULE_PAYMENT_SAGE_PAY_DIRECT_ERROR_TITLE,
                     'error' => $message);

      return $error;
    }

    function check() {
      if (!isset($this->_check)) {
        $check_query = tep_db_query("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_SAGE_PAY_DIRECT_STATUS'");
        $this->_check = tep_db_num_rows($check_query);
      }
      return $this->_check;
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Sage Pay Direct Module', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_STATUS', 'False', 'Do you want to accept Sage Pay Direct payments?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Vendor Login Name', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_VENDOR_LOGIN_NAME', '', 'The vendor login name to connect to the gateway with.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Verify With CVC', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_VERIFY_WITH_CVC', 'True', 'Verify the credit card with the billing address with the Credit Card Verification Checknumber (CVC)?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Method', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_TRANSACTION_METHOD', 'Authenticate', 'The processing method to use for each transaction.', '6', '0', 'tep_cfg_select_option(array(\'Authenticate\', \'Deferred\', \'Payment\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Server', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_TRANSACTION_SERVER', 'Simulator', 'Perform transactions on the production server or on the testing server.', '6', '0', 'tep_cfg_select_option(array(\'Live\', \'Test\', \'Simulator\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Payment Zone', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Set Order Status', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', 'tep_cfg_pull_down_order_statuses(', 'tep_get_order_status_name', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('cURL Program Location', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_CURL', '/usr/bin/curl', 'The location to the cURL program application.', '6', '0' , now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Accept Visa', 'MODULE_PAYMENT_SAGE_PAY_DIRECT_ALLOW_VISA', 'True', 'Do you want to accept Visa payments?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Accept Mast<?php
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

      $transaction_response = $this->sendTransactionToGateway($gateway_url, $post_string);

      if (!empty($transaction_response)) {
        $regs = preg_split("/,(?=(?:[^\"]*\"[^\"]*\")*(?![^\"]*\"))/", $transaction_response);

        foreach ($regs as $key => $value) {
          $regs[$key] = substr($value, 1, -1); // remove double quotes
        }
      } else {
        $regs = array('-1', '-1', '-1');
      }

      $error = false;

      if ($regs[0] == '1') {
        if (tep_not_null(MODULE_PAYMENT_AUTHORIZENET_CC_AIM_MD5_HASH)) {
          if (strtoupper($regs[37]) != strtoupper(md5(MODULE_PAYMENT_AUTHORIZENET_CC_AIM_MD5_HASH . MODULE_PAYMENT_AUTHORIZENET_CC_AIM_LOGIN_ID . $regs[6] . $this->format_raw($order->info['total'])))) {
            $error = 'general';
          }
        }
      } els