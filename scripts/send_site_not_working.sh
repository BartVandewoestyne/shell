#!/bin/sh
#
# Bad website report script by Bart Vandewoestyne
#
# TODO:
#   * input checking
#   * Fix this one-character indent on the left in the mail
#   * English version
#   * Write a good text
#   * Code this clean!
#
# Please send your comments and patches to:
#
# 	MyFirstName.MyLastName@telenet.be


construct_dutch_mail() {

  body="Geachte mevrouw,\n\
        Geachte heer,\n\
	\n\
	Onlangs surfte ik naar\n\n\
	${site_url} \n\n\
	en jammergenoeg stelde ik vast dat deze website niet volledig\n\
	ondersteund wordt door de volgende browsers:\n\n\
	`for i in ${browsers}; \
	 do
	   echo "   ${browser_name[i]} (${browser_url[i]})\n"
	 done`
	\n\
	Het zou fijn zijn mocht u er als webmaster in slagen om de site\n\
	ook voor deze browsers te laten werken.  U stemt er niet alleen\n\
	mij tevreden mee, maar ook die hele groep mensen die net als ik\n\
	bovengenoemde browsers verkiezen!\n\
	\n\
	Indien u verder nog bijkomende feedback wenst omtrent de\n\
	incompatibiliteiten die ik (en waarschijnlijk ook anderen) op uw\n\
	site ondervind, dan kan u me gerust terugmailen.\n\
	\n\
	Vriendelijke groeten,\n\
	${my_name}\n"
}


construct_english_mail() {
  body="Hello ${webmaster_mail}"
}


ask_things_dutch() {

  echo "Met welke naam wilt u de mail onderschrijven?"
  read my_name

  echo "Naar welk emailadres moet de mail verstuurd worden?"
  read webmaster_mail

  echo "Wat is de URL van de site?"
  read site_url

  subject="Browser incompatibiliteiten voor ${site_url}"

  echo "Welke browsers hebt u geprobeerd?"
  for index in `seq 1 ${nbbrowsers}`;
  do
    echo "$index. ${browser_name[$index]} (${browser_url[$index]})"
    let "index = $index + 1"
  done
  read browsers
}


ask_things_english() {

  echo "What is the name you would like to sign the mail with?"
  read my_name

  echo "To what email should the mail be sent?"
  read webmaster_mail

  echo "What's the URL of the site?"
  read site_url

  subject="Browser incompatibilities for ${site_url}"

  echo "What browsers have you tried?"
  for index in `seq 1 ${nbbrowsers}`;
  do
    echo "$index. ${browser_name[$index]} (${browser_url[$index]})"
    let "index = $index + 1"
  done
  read browsers
}


# Main part

browser_name[1]="Internet Explorer"
browser_url[1]="http://www.microsoft.com/windows/ie/"

browser_name[2]="Mozilla"
browser_url[2]="http://www.mozilla.org"

browser_name[5]="Firefox"
browser_url[5]="http://texturizer.net/firefox/"

browser_name[3]="Beonex Communicator"
browser_url[3]="http://www.beonex.com/"

browser_name[4]="K-Meleon"
browser_url[4]="http://kmeleon.sourceforge.net/"

nbbrowsers=${#browser_name[@]}

echo "Please enter the language in which the mail should be sent (eng/ned):"
read lang

case "$lang" in
   eng ) ask_things_english
         construct_english_mail
	 ;;
   ned ) ask_things_dutch
         construct_dutch_mail;;
   *   ) echo "Sorry, this language is not available."
         exit 1
	 ;;
esac

echo -e $body | mailx -s "$subject" $webmaster_mail
