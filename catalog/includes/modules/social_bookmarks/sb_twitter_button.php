IONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa
                                     left join " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . " pad
                                     on pa.products_attributes_id=pad.products_attributes_id
                                     where pa.products_id = '" . $order->products[$i]['id'] . "'
                                     and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "'
                                     and pa.options_id = popt.products_options_id
                                     and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "'
                                     and pa.options_values_id = poval.products_options_values_id
                                     and popt.language_id = '" . $languages_id . "'
                                     and poval.language_id = '" . $languages_id . "'";
                $attributes = tep_db_query($attributes_query);
              } else {
                $attributes = tep_db_query("select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa where pa.products_id = '" . $order->products[$i]['id'] . "' and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "' and pa.options_id = popt.products_options_id and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "' and pa.options_values_id = poval.products_options_values_id and popt.language_id = '" . $languages_id . "' and poval.language_id = '" . $languages_id . "'");
              }
              $attributes_values = tep_db_fetch_array($attributes);

              $sql_data_array = array('orders_id' => $insert_id,
                                      'orders_products_id' => $order_products_id,
                                      'products_options' => $attributes_values['products_options_name'],
                                      'products_options_values' => $attributes_values['products_options_values_name'],
                                      'options_values_price' => $attributes_values['options_values_price'],
                                      'price_prefix' => $attributes_values['price_prefix']);

              tep_db_perform(TABLE_ORDERS_PRODUCTS_ATTRIBUTES, $sql_data_array);

              if ((DOWNLOAD_ENABLED == 'true') && isset($attributes_values['products_attributes_filename']) && tep_not_null($attributes_values['products_attributes_filename'])) {
                $sql_data_array = array('orders_id' => $insert_id,
                                        'orders_products_id' => $order_products_id,
                                        'orders_products_filename' => $attributes_values['products_attributes_filename'],
                                        'download_maxdays' => $attributes_values['products_attributes_maxdays'],
                                        'download_count' => $attributes_values['products_attributes_maxcount']);

                tep_db_perform(TABLE_ORDERS_PRODUCTS_DOWNLOAD, $sql_data_array);
              }
            }
          }
        }

        $GLOBALS[$this->_mbcartID] = $cartID . '-' . $insert_id;
        tep_session_register($this->_mbcartID);
      }
    }

    function confirmation() {
      global $customer_id, $order, $currency;

      if (tep_session_is_registered('cartID')) {
        $this->_prepareOrder();

        $parameters = array('pay_to_email' => MODULE_PAYMENT_MONEYBOOKERS_PAY_TO,
                            'recipient_description' => STORE_NAME,
                            'transaction_id' => substr($GLOBALS[$this->_mbcartID], strpos($GLOBALS[$this->_mbcartID], '-')+1),
                            'return_url' => tep_href_link(FILENAME_CHECKOUT_PROCESS, 'osig=' . md5(MODULE_PAYMENT_MONEYBOOKERS_SECRET_WORD . $GLOBALS[$this->_mbcartID]), 'SSL'),
                            'return_url_text' => MODULE_PAYMENT_MONEYBOOKERS_RETURN_TEXT,
                            'return_url_target' => 1,
                            'cancel_url' => tep_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL'),
                            'cancel_url_target' => 1,
                            'status_url' => tep_href_link('ext/modules/payment/moneybookers/callback.php', '', 'SSL', false, false),
                            'language' => MODULE_PAYMENT_MONEYBOOKERS_LANGUAGE_CODE,
                            'prepare_only' => '1',
                            'pay_from_email' => $order->customer['email_address'],
                            'first_name' => $order->billing['firstname'],
                            'last_name' => $order->billing['lastname'],
                            'address' => $order->billing['street_address'],
                            'phone_number' => $order->customer['telephone'],
                            'postal_code' => $order->billing['postcode'],
                            'city' => $order->billing['city'],
                            'state' => $order->billing['state'],
                            'country' => $order->billing['country']['iso_code_3'],
                            'amount' => $this->format_raw($order->info['total']),
                            'currency' => $currency,
    