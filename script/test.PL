#!/usr/bin/perl
use common::sense;
use LWP::UserAgent;
use URI::Escape;

my $lwp  = new LWP::UserAgent;

my $url = "http://localhost:3000/";
my $resp = $lwp->post( $url );
print $resp->as_string, "\n";
my $resp = $lwp->get( $url );
print $resp->as_string, "\n";

my %form = ( data => 'This is not a box.', );
$url = "http://localhost:3000/nlp/parse/en_pcfg.yml";
$resp = $lwp->post( $url, \%form );
print $resp->as_string, "\n";
my $get_params = "$url?data=" . uri_escape($form{data});
$resp = $lwp->get( $get_params );
print $resp->as_string, "\n";

$url = "http://localhost:3000/nlp/parse.yml";
$get_params = "$url?data=" . uri_escape($form{data});
$resp = $lwp->get( $get_params );
print $resp->as_string, "\n";
$resp = $lwp->post( $get_params );
#$resp = $lwp->post( $url, \%form );
print $resp->as_string, "\n";