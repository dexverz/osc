obal $$link;

    return mysqli_affected_rows($$link);
  }

  function tep_db_get_server_info($link = 'db_link') {
    global $$link;

    return mysqli_get_server_info($$link);
  }

  if ( !function_exists('mysqli_connect') ) {
    define('MYSQLI_ASSOC', MYSQL_ASSOC);

    function mysqli_connect($server, $username, $password, $database) {
      if ( substr($server, 0, 2) == 'p:' ) {
        $link = mysql_pconnect(substr($server, 2), $username, $password);
      } else {
        $link = mysql_connect($server, $username, $password);
      }

      if ( $link ) {
        mysql_select_db($database, $link);
      }

      return $link;
    }

    function mysqli_connect_errno($link = null) {
      if ( is_null($link) ) {
        return mysql_errno();
      }

      return mysql_errno($link);
    }

    function mysqli_connect_error($link = null) {
      if ( is_null($link) ) {
        return mysql_error();
      }

      return mysql_error($link);
    }

    function mysqli_set_charset($link, $charset) {
      if ( function_exists('mysql_set_charset') ) {
        return mysql_set_charset($charset, $link);
      }
    }

    function mysqli_close($link) {
      return mysql_close($link);
    }

    function mysqli_query($link, $query) {
      return mysql_query($query, $link);
    }

    function mysqli_errno($link = null) {
      if ( is_null($link) ) {
        return mysql_errno();
      }

      return mysql_errno($link);
    }

    function mysqli_error($link = null) {
      if ( is_null($link) ) {
        return mysql_error();
      }

      return mysql_error($link);
    }

    function mysqli_fetch_array($query, $type) {
      return mysql_fetch_array($query, $type);
    }

    function mysqli_num_rows($query) {
      return mysql_num_rows($query);
    }

    function mysqli_data_seek($query, $offset) {
      return mysql_data_seek($query, $offset);
    }

    function mysqli_insert_id($link) {
      return mysql_insert_id($link);
    }

    function mysqli_free_result($query) {
      return mysql_free_result($query);
    }

    function mysqli_fetch_field($query) {
      return mysql_fetch_field($query);
    }

    function mysqli_real_escape_string($link, $string) {
      if ( function_exists('mysql_real_escape_string') ) {
        return mysql_real_escape_string($string, $link);
      } elseif ( function_exists('mysql_escape_string') ) {
        return mysql_escape_string($string);
      }

      return addslashes($string);
    }

    function mysqli_affected_rows($link) {
      return mysql_affected_rows($link);
    }

    function mysqli_get_server_info($link) {
      return mysql_get_server_info($link);
    }
  }
?>
                                                                                                                                                                                                                                                                                                                                                                                                               i e w . g i f                 
     G�#/�W� �҇8��X�#/�W�G�#/�W��      �               s m a l l _ v i e w . g i f                 :