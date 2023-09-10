#!/bin/bash
nbusers=`grep KotNet: ~mc303/txt/confid_kul.txt | wc -l`
echo -ne "Aantal gevonden gebruikers:\t"
echo $nbusers

nblogins=`grep KotNet: ~mc303/txt/confid_kul.txt | grep -v "???" | wc -l`
echo -ne "Aantal gevonden passwoorden:\t"
echo $nblogins

echo -ne "Procentueel gevonden aantal KotNet logins:\t"
echo -n $(($nblogins/$nbusers*100))
echo -n "."
echo $((100*$nblogins/$nbusers))
