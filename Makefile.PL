use strict;
use warnings;

use ExtUtils::MakeMaker;

my %args = (
  NAME           => 'Template::Plugin::IPAddr',
  AUTHOR         => 'Per Carlson <pelle@cpan.org>',
  VERSION_FROM   => 'IPAddr.pm',
  ABSTRACT_FROM  => 'IPAddr.pm',
  LICENSE        => 'perl',
  BUILD_REQUIRES => {},
  TEST_REQUIRES  => {
    'Test::More'          => 0,
    'Test::Pod::Coverage' => 0,
  },
  PREREQ_PM => {
    'NetAddr::IP' => '4.062',
    'Template'    => 0,
  },
  META_MERGE => {
    resources => {
      repository => 'https://github.com/hemmop/template-plugin-ipaddr',
      bugtracker => 'https://github.com/hemmop/template-plugin-ipaddr/issues',
    },
  },
);

unless (eval { ExtUtils::MakeMaker->VERSION(6.63_03) }) {
  my $tr = delete $args{TEST_REQUIRES};
  my $br = $args{BUILD_REQUIRES};
  for my $mod (keys %$tr) {
    if (exists $br->{$mod}) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless (eval { ExtUtils::MakeMaker->VERSION(6.56) }) {
  my $br = delete $args{BUILD_REQUIRES};
  my $pp = $args{PREREQ_PM};
  for my $mod (keys %$br) {
    if (exists $pp->{$mod}) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

unless (eval { ExtUtils::MakeMaker->VERSION(6.45_01) }) {
  delete $args{META_MERGE};
}

WriteMakefile(%args);

