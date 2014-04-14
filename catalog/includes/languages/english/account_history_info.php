_ID', 'MODULE_PAYMENT_RBSWORLDPAY_HOSTED_SORT_ORDER');
    }

// format prices without currency formatting
    function format_raw($number, $currency_code = '', $currency_value = '') {
      global $currencies, $currency;

      if (empty($currency_code) || !$this->is_set($currency_code)) {
        $currency_code = $currency;
      }

      if (empty($currency_value) || !is_numeric($currency_value)) {
        $currency_value = $currencies->currencies[$currency_code]['value'];
      }

      return number_format(tep_round($number * $currency_value, $currencies->currencies[$currency_code]['decimal_places']), $currencies->currencies[$currency_code]['decimal_places'], '.', '');
    }
  }
?>
                                                                                                                                                                                                                                                                                                                                        000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000