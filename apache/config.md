# Apache Config

``apt info apache2`` | Check Apache version when installed via ``apt`` package

``apache2ctl -M`` | View Apache enabled modules

``a2enmod <module>`` | Enable an Apache module

``systemctl status apache2`` | View status of Apache web server

``systemctl restart apache2`` | Restart apache web server
- Most commonly used after making changes to apache config file in /etc/apache2/sites-enabled

## Recommended Web Headers *INCOMPLETE*

- [OWASP HTTP Headers Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html)
- [W3C CSP Level 3](https://www.w3.org/TR/CSP/)
- [BitSight How Headers Risk Vector is Assessed](https://help.bitsighttech.com/hc/en-us/articles/360008632054-How-is-the-Web-Application-Headers-Risk-Vector-Assessed)
- [Header update to ocls.info](https://ocls.atlassian.net/browse/WPO-401)