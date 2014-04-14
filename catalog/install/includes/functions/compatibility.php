p_db_query("insert into " . TABLE_ZONES_TO_GEO_ZONES . " values (null, '" . (int)$country['countries_id'] . "', 0, '" . (int)$zone_id . "', null, now())");
        }
      }

      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Moneybookers Dankort', 'MODULE_PAYMENT_MONEYBOOKERS_DNK_STATUS', 'False', 'Do you want to accept Moneybookers Dankort payments?', '6', '3', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('S