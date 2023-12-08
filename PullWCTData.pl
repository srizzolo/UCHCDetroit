#!/usr/bin/perl
use strict;
use warnings;
use WWW::Mechanize;

#########################################
# 			      		#
#  Author: Skylar Rizzolo		#
#  Org: UCHC Detroit 			#
#  Last Modified: 12/4/2023		#
#  Description:	Script for parsing WCT 	#
#   data from PTA tax & parcel info	# 
#   site, given a parcel number and 	#
#   municipality code.			#
#					#
#########################################

# Add your login information (commented out for now)
# my $username = 'tphillips';
# my $password = 'your_password';

# Add the parcel ID and municipality code you want to search
my $parcel_id = 'your_parcel_id';
my $municipality_code = 'your_municipality_code';

# Create a new WWW::Mechanize object
my $mech = WWW::Mechanize->new();

# Uncomment the following lines once you have the correct login information
# $mech->get('https://onlinetaxinquiry.waynecounty.com/oti/pta000.aspx');
# $mech->submit_form(
#     form_number => 1,
#     fields      => {
#         username => $username,
#         password => $password,
#     },
# );

# Uncomment the following lines once logged in
# $mech->get('https://onlinetaxinquiry.waynecounty.com/oti/pta001.aspx');
# $mech->submit_form(
#     form_name => 'Form1',
#     fields    => {
#         'txtParcelId'      => $parcel_id,
#         'txtMunicipality'  => $municipality_code,
#         'btnSearch.x'      => 1,
#         'btnSearch.y'      => 1,
#     },
# );

# Extract and print the desired information
my $content = $mech->content();
if ($content =~ /Mailing: (.*?)SEV amt: (\d+) - (\d{4})\s+PRE %: (\d+\.\d+)/) {
    my $taxpayer = $1;
    my $sev_amt = $2;
    my $year = $3;
    my $pre_percent = $4;

    print "Taxpayer: $taxpayer\n";
    print "SEV Amt: $sev_amt\n";
    print "Year: $year\n";
    print "PRE %: $pre_percent\n";
} else {
    print "Information not found on the page.\n";
}