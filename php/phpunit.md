# PHPUnit

## PHPUnit Assertions
---
anything  
arrayHasKey  
assertArrayHasKey  
assertArrayNotHasKey  
assertAttributeContains  
assertAttributeContainsOnly  
assertAttributeEmpty  
assertAttributeEquals  
assertAttributeGreaterThan  
assertAttributeGreaterThanOrEqual  
assertAttributeInstanceOf  
assertAttributeInternalType  
assertAttributeLessThan  
assertAttributeLessThanOrEqual  
assertAttributeNotContains  
assertAttributeNotContainsOnly  
assertAttributeNotEmpty  
assertAttributeNotEquals  
assertAttributeNotInstanceOf  
assertAttributeNotInternalType  
assertAttributeNotSame  
assertAttributeNotType  
assertAttributeSame  
assertAttributeType  
assertClassHasAttribute  
assertClassHasStaticAttribute  
assertClassNotHasAttribute  
assertClassNotHasStaticAttribute  
assertContains  
assertContainsOnly  
assertEmpty  
assertEquals  
assertEqualXMLStructure  
assertFalse  
assertFileEquals  
assertFileExists  
assertFileNotEquals  
assertFileNotExists  
assertGreaterThan  
assertGreaterThanOrEqual  
assertInstanceOf  
assertInternalType  
assertLessThan  
assertLessThanOrEqual  
assertNotContains  
assertNotContainsOnly  
assertNotEmpty  
assertNotEquals  
assertNotInstanceOf  
assertNotInternalType  
assertNotNull  
assertNotRegExp  
assertNotSame  
assertNotTag  
assertNotType  
assertNull  
assertObjectHasAttribute  
assertObjectNotHasAttribute  
assertRegExp  
assertSame  
assertSelectCount  
assertSelectEquals  
assertSelectRegExp  
assertStringEndsNotWith  
assertStringEndsWith  
assertStringEqualsFile  
assertStringMatchesFormat  
assertStringMatchesFormatFile  
assertStringNotEqualsFile  
assertStringNotMatchesFormat  
assertStringNotMatchesFormatFile  
assertStringStartsNotWith  
assertStringStartsWith  
assertStringContainsString  
assertTag  
assertThat  
assertTrue  
assertType  
assertXmlFileEqualsXmlFile  
assertXmlFileNotEqualsXmlFile  
assertXmlStringEqualsXmlFile  
assertXmlStringEqualsXmlString  
assertXmlStringNotEqualsXmlFile  
assertXmlStringNotEqualsXmlString  
attribute  
attributeEqualTo  
classHasAttribute  
classHasStaticAttribute  
contains  
containsOnly  
equalTo  
fileExists  
greaterThan  
greaterThanOrEqual  
identicalTo  
isEmpty  
isFalse  
isInstanceOf  
isNull  
isTrue  
isType  
lessThan  
lessThanOrEqual  
logicalAnd  
logicalNot  
logicalOr  
logicalXor  
matches  
matchesRegularExpression  
objectHasAttribute  
stringContains  
stringEndsWith  
stringStartsWith  
stringContainsString  
stringNotContainsString  
assertEqualsCanonicalizing  

## Symfony/Panther Extensions (extend PantherTestCase, unless stated otherwise) (https://symfony.com/doc/current/testing.html)
---
### Response Assertions (Not compatible with PantherTestCase.  Extend the WebTestCase class instead.)

assertResponseIsSuccessful  
assertResponseStatusCodeSame  
assertResponseRedirects  
assertResponseHasHeader  
assertResponseHeaderSame  
assertResponseHasCookie  
assertResponseCookieValueSame  
assertResponseFormatSame  
assertResponseIsUnprocessable

## Request Assertions
---
assertRequestAttributeValueSame  
assertRouteSame  

## Browser Assertions
---
assertBrowserHasCookie  
assertBrowserCookieValueSame  
assertThatForClient  // for using your own custom asserts

## Crawler Assertions
---
assertSelectorExists  
assertSelectorNotExists  
assertSelectorCount  
assertSelectorTextContains  
assertSelectorTextNotContains  
assertSelectorTextSame  
assertPageTitleSame  
assertPageTitleContains  
assertInputValueSame  
assertInputValueNotSame  
assertCheckboxChecked  
assertFormValue  

## Panther Assertions
---
assertSelectorIsEnabled  
assertSelectorIsDisabled  
assertSelectorIsVisible  
assertSelectorIsNotVisible  
assertSelectorAttributeContains  
assertSelectorAttributeNotContains  

// and when javascript is used to update things...  
 assertSelectorWillExist  
 assertSelectorWillNotExist  
 assertSelectorWillBeVisible  
 assertSelectorWillNotBeVisible  
 assertSelectorWillContain  
 assertSelectorWillNotContain  
 assertSelectorWillBeEnabled  
 assertSelectorWillBeDisabled  
 assertSelectorAttributeWillContain  
 assertSelectorAttributeWillNotContain  

// Use waitForX methods to wait until some asynchronous process finish  
 waitFor('.popin'); // wait for element to be attached to the DOM  
 waitForStaleness('.popin'); // wait for element to be removed from the DOM  
 waitForVisibility('.loader'); // wait for element of the DOM to become visible  
 waitForInvisibility('.loader'); // wait for element of the DOM to become hidden  
 waitForElementToContain('.total', '25 €'); // wait for text to be inserted in the element content  
 waitForElementToNotContain('.promotion', '5%'); // wait for text to be removed from the element content  
 waitForEnabled('[type="submit"]'); // wait for the button to become enabled  
 waitForDisabled('[type="submit"]'); // wait for  the button to become disabled  
 waitForAttributeToContain('.price', 'data-old-price', '25 €'); // wait for the attribute to contain content  
 waitForAttributeToNotContain('.price', 'data-old-price', '25 €'); // wait for the attribute to not contain content

// look at `$crawler = $client->refreshCrawler();` to deal with "stale" errors  
//  and also `$crawler = $client->getCrawler();`
//
// WebDriver specific docs & examples:  
// https://github.com/php-webdriver/php-webdriver/wiki/  
// https://github.com/php-webdriver/php-webdriver/wiki/Example-command-reference