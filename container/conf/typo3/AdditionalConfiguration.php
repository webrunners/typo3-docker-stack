<?php
####################
# dev environment
#

$GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = md5('typo3');
$GLOBALS['TYPO3_CONF_VARS']['BE']['lockSSL']=0;

$GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport'] = 'smtp';
$GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport_smtp_server'] = 'smtp:1025';

$GLOBALS['TYPO3_CONF_VARS']['SYS']['trustedHostsPattern'] = 'localhost:8888';

if (1===0)
{ //enable debug
    $GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = 1;

    $GLOBALS['TYPO3_CONF_VARS']['SYS']['devIPmask'] = '*';
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = 1;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['enable_errorDLOG'] = 1;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['enable_exceptionDLOG'] = 1;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['enableDeprecationLog'] = 1;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = 1;
}
