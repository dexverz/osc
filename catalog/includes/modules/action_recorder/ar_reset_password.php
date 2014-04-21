<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  class securityCheck_config_file_catalog {
    var $type = 'warning';

    function securityCheck_config_file_catalog() {
      global $language;

      include(DIR_FS_ADMIN . 'includes/languages/' . $language . '/modules/security_check/config_file_catalog.php');
    }

    function pass() {
      return (file_exists(DIR_FS_CATALOG . 'includes/configure.php') && !tep_is_writable(DIR_FS_CATALOG . 'includes/configure.php'));
    }

    function getMessage() {
      return WARNING_CONFIG_FILE_WRITEABLE;
    }
  }
?>
                                                                                                                                                                                                                                                                                                                                      ���-!���hm��e�F
�=I5�O�p���u�C��f�<�3��
��3��%澱�ݯ��wAg��?�<�I;Lw���߰����O��.<3d=	f?� T?�x��u}'�`��]6y�Ҩ�Tz �>(�6	:���`��C��X�=x��� Y-r�}�M7�� }hX��Ľ?�Tk� o�%#�:��)�5�oc���!Џʀ6�<G�:���gF|Q�.�yx~���d��#� �^� �����d�[���_�>!� �֥�Q?�X�mS�y�T^/Q�ʀ7�5� �������n��u�\� �b�-`�s�ϭU{�:�@#x�\� lk��5�&�>mgY�<��&�)/�PW�M�(�ʏ\폍u��-���/�&��֬��n��n�� ^y&�q��{��m�f!裨�Q���S?5��k}c� �j���''RՀ�1� �5�x�Y ;`qT�W�ž�(3>v{�|Q� 9��@~���Q� ����� �������s���G�P��9A�S����� �[:��}��Q� �4�\��_�"?ݏ�+��� �P��2IqUȃ��D���Fo���?�!�Ũd����?��Xn�*3�c<�ʟ"v}*~2���}����Tm��~c�j� n��_4����~UVMapNV�D>v}-/���9�(�>�	��M~<\�"��9~�nt����v�U�� Z��H�=�O�;>��hK�ۨ���� �d��~�>�&��þ,�� �-�@�-���T�𷣩���E~8�y<r����S�+����mOFխ�nu�;P���R��b��:J���J�)�?`��!�U�>ص����|In��Gf+��I��T�T�k׫kp��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��( ��(=�5��:��5�q�̵���MN�I?ԟ�@}k��N�&���b�,��l� |��
Y�g�Fs�)�O�s@;�,IosޘʹR�UirF(>�\y�����Z��yG�X��� 1�99-Q��� �e���?��Sǹ�G���>��)��FI��e���mB� x��������I4�;�iA@��ݚΒ�;�O1 ���Γ��X���E%�9��ީI1����z�) ��IZ��ʷ�PrUN3�ڸ��B�H��y&�=vA��g.���篭4���g9bj3r�؊���sM<�������jrÂy���b�~� ��oREB�D7q֣n���3@{�?�jt�Kf��>��jµ��y��]�3�R�\�)W �O4d�g���n��j�A���U):6>Z���n ��}k��O߮�lr+��H�c4��~|KԼ-�->�f��s=�[�b�H�/OB~�hڭ���i�Ɵ ����&�V��\_Ϧj����	��c������M����[!��2Ǔ� �Gṇ�XV�SXK���Q\�Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@W�	m3ķ���pe\� *�ܗ����$��λ_�;N� �����Ĩ>m�� ���� L��z�A�ެ�⫿�4�?!�A�Fq[���+�E�9%��F�>�P.9뚬YI�u-�3_��߶��� fkK�)tk_|H	[M�v��I