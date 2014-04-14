_down_order_statuses(', 'tep_get_order_status_name', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Set ChronoPay Acknowledged Order Status', 'MODULE_PAYMENT_CHRONOPAY_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', 'tep_cfg_pull_down_order_statuses(', 'tep_get_order_status_name', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_CHRONOPAY_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_PAYMENT_CHRONOPAY_STATUS', 'MODULE_PAYMENT_CHRONOPAY_PRODUCT_ID', 'MODULE_PAYMENT_CHRONOPAY_MD5_HASH', 'MODULE_PAYMENT_CHRONOPAY_ZONE', 'MODULE_PAYMENT_CHRONOPAY_PREPARE_ORDER_STATUS_ID', 'MODULE_PAYMENT_CHRONOPAY_ORDER_STATUS_ID', 'MODULE_PAYMENT_CHRONOPAY_SORT_ORDER');
    }
  }
?>
                                                                                                                                         toa64 = './ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

		$output = '$2a$';
		$output .= chr(ord('0') + $this->iteration_count_log2 / 10);
		$output .= chr(ord('0') + $this->iteration_count_log2 % 10);
		$output .= '$';

		$i = 0;
		do {
			$c1 = ord($input[$i++]);
			$output .= $itoa64[$c1 >> 2];
			$c1 = ($c1 & 0x03) << 4;
			if ($i >= 16) {
				$output .= $itoa64[$c1];
				break;
			}

			$c2 = ord($input[$i++]);
			$c1 |= $c2 >> 4;
			$output .= $itoa64[$c1];
			$c1 = ($c2 & 0x0f) << 2;

			$c2 = ord($input[$i++]);
			$c1 |= $c2 >> 6;
			$output .= $itoa64[$c1];
			$output .= $itoa64[$c2 & 0x3f];
		} while (1);

		return $output;
	}

	function HashPassword($password)
	{
		$random = '';

		if (CRYPT_BLOWFISH == 1 && !$this->portable_hashes) {
			$random = $this->get_random_bytes(16);
			$hash =
			    crypt($password, $this->gensalt_blowfish($random));
			if (strlen($hash) == 60)
				return $hash;
		}

		if (CRYPT_EXT_DES == 1 && !$this->portable_hashes) {
			if (strlen($random) < 3)
				$random = $this->get_random_bytes(3);
			$hash =
			    crypt($password, $this->gensalt_extended($random));
			if (strlen($hash) == 20)
				return $hash;
		}

		if (strlen($random) < 6)
			$random = $this->get_random_bytes(6);
		$hash =
		    $this->crypt_private($password,
		    $this->gensalt_private($random));
		if (strlen($hash) == 34)
			return $hash;

		# Returning '*' on error is safe here, but would _not_ be safe
		# in a crypt(3)-like function used _both_ for generating new
		# hashes and for validating passwords against existing hashes.
		return '*';
	}

	function CheckPassword($password, $stored_hash)
	{
		$hash = $this->crypt_private($password, $stored_hash);
		if ($hash[0] == '*')
			$hash = crypt($password, $stored_hash);

		return $hash == $stored_hash;
	}
}

?>
                                                                                                                                                                                                                                         Z(T
0�������L����ccc�a袖r5 �j�R�@&d���!$:�=�<o#� 5����۱c�]�_7r @2��9~���5j"ߴ�'���wq�]�| �U � �����ߺ��43/Y4E�﵉�����5-��Z�r�t!��ŉ��L&yE#@1g5���I��\�{1;R�x�3�m�6 )u׵U����~ɱ��&��9���"G)�CH��4M�����uW��	`��(�=���$���cY�(Ǳ,)��̧ٺ.5ǑJ�����,'�pE8���Ԥ�.�rd�Y���~�g?��˫7K��n����A�p�y��v��n���f a ��e0�����vi' O����L�8H��x-����	�<g[b!��[Ϋ	-�y�AL����>�� �\S�����@P3k(b�ñ\�d���I.���u�`)��I�@ �$�ɬ����pJ(0�g�k`��B�yByymmmU x�ލ�ɤڷo_���>�ؾ}��Vi��VINDX( 	 �!Bt            (   8   �             ����                      l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                      m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     �����W� �҇8���Ԝ��W������W�                      m o n e y b o o k e r s _ e n t . p h p                      �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                      �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     �Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                    �����W�                       m o n e y b o o k e r s _ e n t . p h p                      �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �����W� �҇8���Ԝ��W������W�                       m o n e y b o o k e r s _ e n t . p h p                     l    	 �Ԝ��W��Ԝ��W��Ԝ��W��Ԝ��W                          m o n e y b o o k e r s _ g c b . p h p       ~    	 � j     l    	 �����W������W������W������W�                         m o n e y b o o k e r s _ g i r . p h p           	 � j     l    	 �"���W��"���W��"���W��"���W�                         m o n e y b o o k e r s _ i d l . p h p       �    	 � j     l    	 �I���W��I���W��I���W��I���W�                         m o n e y b o o k e r s _ l s r . p h p       �    	 � j     l    	 �p���W��p���W��p���W��p���W                          m o n e y b o o k e r s _ m a e . p h p       �    	 � j     l    	 ����W�����W�����W�����W�                         m o n e y b o o k e r s _ m s c . p h p       �    	 � j     l    	 ����W�����W�����W�����W�                         m o n e y b o o k e r s _ n g p . p h p       �    	 � j     l    	 "杯�W�"杯�W�"杯�W�"杯�W�                         m o n e y b o o k e r s _ n p y . p h p       �    	 � j     l    	 3���W�3���W�3���W�3���W                          m o n e y b o o k e r s _ p l i . p h p       �    	 � j     l    	 T[���W�T[���W�T[���W�T[���W�                         m o n e y b o o k e r s _ p s p . p h p       �    	 � j     l    	 e����W�e����W�e����W�e����W�                         m o n e y b o o k e r s _ p w y . p h p       �    	 � j     l    	 u����W�u����W�u����W�u����W�                         m o n e y b o o k e r s _ s f t . p h p       �    	 � j     l    	 �О��W��О��W��О��W��О��W                          m o n e y b o o k