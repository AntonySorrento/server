<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress_user' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('AUTH_KEY',         'xuee2=iU-07)v5M^+U,B{y.^@nv(Ifqc-bO:6 f3PS-P+?.+Kr)6<q{|-=@<_#b#');
define('SECURE_AUTH_KEY',  '0j=Iz`O0o|DsNapg57}H]F!;b8yrU`re&)6@mjPBXd(Bn8on&x^,Vfn0_Q6/; oT');

define('LOGGED_IN_KEY',    'O@j2ZA{6Uhh)d)V =Xx8vw1R!m2MZ1Y(_1u8FD=oz{uI^nfM^+~rkO+k<^:]~UIY');
define('NONCE_KEY',        'd=}/f0}]OKS|K-rSK<Yp<pxKhn`ktCsqZd<mhctEyB{<cniOow#kQ(yr$xv:0pl[');
define('AUTH_SALT',        'w{xJd@gK@(cWr:H }Q!%kFnkm,D1@P-X[=Ri|szIipq_0w|2FRM<[`d0Iw+V9gw?');
define('SECURE_AUTH_SALT', 'S&!D4c@U&{;~WgkevjP9sk]&8{|)e;4>{TQO|UQC4)WXO!|U%8-#E0jLyqVk)u_E');
define('LOGGED_IN_SALT',   '[7o~JO!QKj|3:n9b$xKcS-fh0Wf=[TmTx%`tq2(;`%qVYZJga7ECB/q,xdMuwmZI');
define('NONCE_SALT',       '|-KXN21|ELd^AR<~J*CA}kv+Y$L7P`dId!.tIyEN-8g!3KhVqonVH3q)3rjhd2Ee');
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
