#!perl

use strict;
use warnings;

# This test was generated by Dist::Zilla::Plugin::Test::ReportPrereqs 0.013

use Test::More tests => 1;

use ExtUtils::MakeMaker;
use File::Spec::Functions;
use List::Util qw/max/;
use version;

# hide optional CPAN::Meta modules from prereq scanner
# and check if they are available
my $cpan_meta = "CPAN::Meta";
my $cpan_meta_req = "CPAN::Meta::Requirements";
my $HAS_CPAN_META = eval "require $cpan_meta"; ## no critic
my $HAS_CPAN_META_REQ = eval "require $cpan_meta_req; $cpan_meta_req->VERSION('2.120900')";

# Verify requirements?
my $DO_VERIFY_PREREQS = 1;

sub _merge_requires {
    my ($collector, $prereqs) = @_;
    for my $phase ( qw/configure build test runtime develop/ ) {
        next unless exists $prereqs->{$phase};
        if ( my $req = $prereqs->{$phase}{'requires'} ) {
            my $cmr = CPAN::Meta::Requirements->from_string_hash( $req );
            $collector->add_requirements( $cmr );
        }
    }
}

my %include = map {; $_ => 1 } qw(

);

my %exclude = map {; $_ => 1 } qw(

);

# Add static prereqs to the included modules list
my $static_prereqs = do { my $x = {
       'configure' => {
                        'requires' => {
                                        'Dist::CheckConflicts' => '0.02',
                                        'ExtUtils::CBuilder' => '0.27',
                                        'ExtUtils::MakeMaker' => '6.30',
                                        'File::Spec' => '0'
                                      }
                      },
       'develop' => {
                      'conflicts' => {
                                       'Dist::Zilla::Plugin::Conflicts' => '== 0.11'
                                     },
                      'requires' => {
                                      'Algorithm::C3' => '0',
                                      'CPAN::Meta::Requirements' => '0',
                                      'Class::Load' => '0.07',
                                      'DBM::Deep' => '0',
                                      'Data::Visitor' => '0',
                                      'DateTime' => '0',
                                      'DateTime::Calendar::Mayan' => '0',
                                      'DateTime::Format::MySQL' => '0',
                                      'Declare::Constraints::Simple' => '0',
                                      'Dist::Zilla' => '5.012',
                                      'Dist::Zilla::Plugin::Authority' => '0',
                                      'Dist::Zilla::Plugin::CheckChangesHasContent' => '0',
                                      'Dist::Zilla::Plugin::ConfirmRelease' => '0',
                                      'Dist::Zilla::Plugin::Conflicts' => '0',
                                      'Dist::Zilla::Plugin::ContributorsFromGit' => '0',
                                      'Dist::Zilla::Plugin::EOLTests' => '0',
                                      'Dist::Zilla::Plugin::ExecDir' => '0',
                                      'Dist::Zilla::Plugin::GatherDir' => '0',
                                      'Dist::Zilla::Plugin::Git::Check' => '0',
                                      'Dist::Zilla::Plugin::Git::CheckFor::CorrectBranch' => '0',
                                      'Dist::Zilla::Plugin::Git::Commit' => '0',
                                      'Dist::Zilla::Plugin::Git::Push' => '0',
                                      'Dist::Zilla::Plugin::Git::Remote::Check' => '0',
                                      'Dist::Zilla::Plugin::Git::Tag' => '0',
                                      'Dist::Zilla::Plugin::License' => '0',
                                      'Dist::Zilla::Plugin::MakeMaker::Awesome' => '0',
                                      'Dist::Zilla::Plugin::Manifest' => '0',
                                      'Dist::Zilla::Plugin::ManifestSkip' => '0',
                                      'Dist::Zilla::Plugin::MetaConfig' => '0',
                                      'Dist::Zilla::Plugin::MetaJSON' => '0',
                                      'Dist::Zilla::Plugin::MetaNoIndex' => '0',
                                      'Dist::Zilla::Plugin::MetaProvides::Package' => '1.15000002',
                                      'Dist::Zilla::Plugin::MetaResources' => '0',
                                      'Dist::Zilla::Plugin::MetaTests' => '0',
                                      'Dist::Zilla::Plugin::MetaYAML' => '0',
                                      'Dist::Zilla::Plugin::MojibakeTests' => '0',
                                      'Dist::Zilla::Plugin::NextRelease' => '0',
                                      'Dist::Zilla::Plugin::PkgVersion' => '0',
                                      'Dist::Zilla::Plugin::PodSyntaxTests' => '0',
                                      'Dist::Zilla::Plugin::PodWeaver' => '4.004',
                                      'Dist::Zilla::Plugin::Prereqs' => '0',
                                      'Dist::Zilla::Plugin::Prereqs::AuthorDeps' => '0',
                                      'Dist::Zilla::Plugin::PromptIfStale' => '0',
                                      'Dist::Zilla::Plugin::PruneCruft' => '0',
                                      'Dist::Zilla::Plugin::PruneFiles' => '0',
                                      'Dist::Zilla::Plugin::RunExtraTests' => '0',
                                      'Dist::Zilla::Plugin::ShareDir' => '0',
                                      'Dist::Zilla::Plugin::SurgicalPodWeaver' => '0',
                                      'Dist::Zilla::Plugin::Test::CPAN::Changes' => '0',
                                      'Dist::Zilla::Plugin::Test::Compile' => '2.037',
                                      'Dist::Zilla::Plugin::Test::Kwalitee' => '0',
                                      'Dist::Zilla::Plugin::Test::NoTabs' => '0',
                                      'Dist::Zilla::Plugin::Test::ReportPrereqs' => '0',
                                      'Dist::Zilla::Plugin::TestRelease' => '0',
                                      'Dist::Zilla::Plugin::UploadToCPAN' => '0',
                                      'ExtUtils::MakeMaker::Dist::Zilla::Develop' => '0',
                                      'File::Find::Rule' => '0',
                                      'File::Spec' => '0',
                                      'File::pushd' => '0',
                                      'HTTP::Headers' => '0',
                                      'IO::File' => '0',
                                      'IO::Handle' => '0',
                                      'IO::String' => '0',
                                      'IPC::Open3' => '0',
                                      'IPC::System::Simple' => '0',
                                      'Locale::US' => '0',
                                      'Module::CPANTS::Analyse' => '0.92',
                                      'Module::Info' => '0',
                                      'Module::Refresh' => '0',
                                      'MooseX::NonMoose' => '0',
                                      'PadWalker' => '0',
                                      'Params::Coerce' => '0',
                                      'Path::Tiny' => '0',
                                      'Pod::Elemental::PerlMunger' => '0.200001',
                                      'Regexp::Common' => '0',
                                      'SUPER' => '0',
                                      'Specio' => '0.07',
                                      'Test::CPAN::Changes' => '0.19',
                                      'Test::CPAN::Meta' => '0',
                                      'Test::Deep' => '0',
                                      'Test::DependentModules' => '0.13',
                                      'Test::Inline' => '0',
                                      'Test::Inline::Extract' => '0',
                                      'Test::Kwalitee' => '1.15',
                                      'Test::LeakTrace' => '0',
                                      'Test::Memory::Cycle' => '0',
                                      'Test::More' => '0.94',
                                      'Test::NoTabs' => '0',
                                      'Test::Output' => '0',
                                      'Test::Pod' => '1.41',
                                      'Test::Spelling' => '0',
                                      'URI' => '0',
                                      'blib' => '0'
                                    }
                    },
       'runtime' => {
                      'recommends' => {
                                        'Devel::PartialDump' => '0.14'
                                      },
                      'requires' => {
                                      'Carp' => '1.22',
                                      'Class::Load' => '0.09',
                                      'Class::Load::XS' => '0.01',
                                      'Data::OptList' => '0.107',
                                      'Devel::GlobalDestruction' => '0',
                                      'Devel::StackTrace' => '1.30',
                                      'Dist::CheckConflicts' => '0.02',
                                      'Eval::Closure' => '0.04',
                                      'List::MoreUtils' => '0.28',
                                      'MRO::Compat' => '0.05',
                                      'Module::Runtime' => '0.014',
                                      'Package::DeprecationManager' => '0.11',
                                      'Package::Stash' => '0.32',
                                      'Package::Stash::XS' => '0.24',
                                      'Params::Util' => '1.00',
                                      'Scalar::Util' => '1.19',
                                      'Sub::Exporter' => '0.980',
                                      'Sub::Name' => '0.05',
                                      'Task::Weaken' => '0',
                                      'Try::Tiny' => '0.02',
                                      'parent' => '0.223',
                                      'perl' => 'v5.8.3'
                                    }
                    },
       'test' => {
                   'recommends' => {
                                     'CPAN::Meta' => '0',
                                     'CPAN::Meta::Requirements' => '2.120900'
                                   },
                   'requires' => {
                                   'Test::Fatal' => '0.001',
                                   'Test::More' => '0.88',
                                   'Test::Requires' => '0.05'
                                 }
                 }
     };
  $x;
 };

delete $static_prereqs->{develop} if not $ENV{AUTHOR_TESTING};
$include{$_} = 1 for map { keys %$_ } map { values %$_ } values %$static_prereqs;

# Merge requirements for major phases (if we can)
my $all_requires;
if ( $DO_VERIFY_PREREQS && $HAS_CPAN_META_REQ ) {
    $all_requires = $cpan_meta_req->new;
    _merge_requires($all_requires, $static_prereqs);
}


# Add dynamic prereqs to the included modules list (if we can)
my ($source) = grep { -f } 'MYMETA.json', 'MYMETA.yml';
if ( $source && $HAS_CPAN_META ) {
  if ( my $meta = eval { CPAN::Meta->load_file($source) } ) {
    my $dynamic_prereqs = $meta->prereqs;
    delete $dynamic_prereqs->{develop} if not $ENV{AUTHOR_TESTING};
    $include{$_} = 1 for map { keys %$_ } map { values %$_ } values %$dynamic_prereqs;

    if ( $DO_VERIFY_PREREQS && $HAS_CPAN_META_REQ ) {
        _merge_requires($all_requires, $dynamic_prereqs);
    }
  }
}
else {
  $source = 'static metadata';
}

my @modules = sort grep { ! $exclude{$_} } keys %include;
my @reports = [qw/Version Module/];
my @dep_errors;
my $req_hash = defined($all_requires) ? $all_requires->as_string_hash : {};

for my $mod ( @modules ) {
  next if $mod eq 'perl';
  my $file = $mod;
  $file =~ s{::}{/}g;
  $file .= ".pm";
  my ($prefix) = grep { -e catfile($_, $file) } @INC;
  if ( $prefix ) {
    my $ver = MM->parse_version( catfile($prefix, $file) );
    $ver = "undef" unless defined $ver; # Newer MM should do this anyway
    push @reports, [$ver, $mod];

    if ( $DO_VERIFY_PREREQS && $all_requires ) {
      my $req = $req_hash->{$mod};
      if ( defined $req && length $req ) {
        if ( ! defined eval { version->parse($ver) } ) {
          push @dep_errors, "$mod version '$ver' cannot be parsed (version '$req' required)";
        }
        elsif ( ! $all_requires->accepts_module( $mod => $ver ) ) {
          push @dep_errors, "$mod version '$ver' is not in required range '$req'";
        }
      }
    }

  }
  else {
    push @reports, ["missing", $mod];

    if ( $DO_VERIFY_PREREQS && $all_requires ) {
      my $req = $req_hash->{$mod};
      if ( defined $req && length $req ) {
        push @dep_errors, "$mod is not installed (version '$req' required)";
      }
    }
  }
}

if ( @reports ) {
  my $vl = max map { length $_->[0] } @reports;
  my $ml = max map { length $_->[1] } @reports;
  splice @reports, 1, 0, ["-" x $vl, "-" x $ml];
  diag "\nVersions for all modules listed in $source (including optional ones):\n",
    map {sprintf("  %*s %*s\n",$vl,$_->[0],-$ml,$_->[1])} @reports;
}

if ( @dep_errors ) {
  diag join("\n",
    "\n*** WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING ***\n",
    "The following REQUIRED prerequisites were not satisfied:\n",
    @dep_errors,
    "\n"
  );
}

pass;

# vim: ts=4 sts=4 sw=4 et:
