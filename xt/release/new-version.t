use strict;
use warnings FATAL => 'all';

use Test::More 0.88;
use Encode;
use LWP::UserAgent;
use JSON;
use Module::Metadata;
use List::Util 'first';
use CPAN::Meta 2.120920;

# 'provides' field from dist metadata, if needed
my $dist_provides;

# returns bool, detailed message
sub version_is_bumped
{
    my ($module_metadata, $pkg) = @_;

    my $ua = LWP::UserAgent->new(keep_alive => 1);
    $ua->env_proxy;

    my $res = $ua->get("http://cpanidx.org/cpanidx/json/mod/$pkg");
    return (0, 'index could not be queried?') if not $res->is_success;

    # JSON wants UTF-8 bytestreams, so we need to re-encode no matter what
    # encoding we got. -- rjbs, 2011-08-18 (in Dist::Zilla)
    my $json_octets = Encode::encode_utf8($res->decoded_content);
    my $payload = JSON::->new->decode($json_octets);

    return (0, 'no valid JSON returned') unless \@$payload;

    return (1, 'not indexed') if not defined $payload->[0]{mod_vers};
    return (1, 'VERSION is not set in index') if $payload->[0]{mod_vers} eq 'undef';

    my $indexed_version = version->parse($payload->[0]{mod_vers});
    my $current_version = $module_metadata->version($pkg);

    if (not defined $current_version)
    {
        $dist_provides ||= do {
            my $metafile = first { -e $_ } qw(MYMETA.json MYMETA.yml META.json META.yml);
            my $dist_metadata = $metafile ? CPAN::Meta->load_file($metafile) : undef;
            $dist_metadata->provides if $dist_metadata;
        };

        $current_version = $dist_provides->{$pkg}{version};
        return (0, 'VERSION is not set; indexed version is ' . $indexed_version)
            if not $dist_provides or not $current_version;
    }

    return (
        $indexed_version < $current_version,
        'indexed at ' . $indexed_version . '; local version is ' . $current_version,
    );
}

foreach my $filename (
    q{lib/Moose/Manual/Delta.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/accessor.pm},
    q{lib/Moose/Cookbook/Style.pod},
    q{lib/Moose/Meta/Attribute/Native/Trait/String.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/append.pm},
    q{lib/Moose/Meta/Attribute/Native/Trait/Number.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/grep.pm},
    q{lib/Moose/Cookbook/Extending/Debugging_BaseClassRole.pod},
    q{lib/Class/MOP/Method/Meta.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/kv.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/chop.pm},
    q{lib/Moose/Manual/Attributes.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/String/length.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/is_empty.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Counter/set.pm},
    q{lib/Class/MOP/Method/Accessor.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/get.pm},
    q{lib/Moose/Manual/Classes.pod},
    q{lib/Class/MOP/Method/Generated.pm},
    q{lib/Moose/Object.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/accessor.pm},
    q{lib/Moose/Meta/Role/Composite.pm},
    q{lib/Moose/Meta/Object/Trait.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/defined.pm},
    q{lib/Moose/Manual.pod},
    q{lib/Test/Moose.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Collection.pm},
    q{lib/Moose/Manual/Support.pod},
    q{lib/Moose/Unsweetened.pod},
    q{lib/Moose/Manual/Delegation.pod},
    q{lib/Moose/Meta/TypeConstraint/DuckType.pm},
    q{lib/Moose/Cookbook/Basics/Point_AttributesAndSubclassing.pod},
    q{lib/Moose/Manual/FAQ.pod},
    q{lib/Moose/Meta/Method/Constructor.pm},
    q{lib/Moose/Cookbook/Basics/HTTP_SubtypesAndCoercion.pod},
    q{lib/Moose/Cookbook/Basics/BinaryTree_BuilderAndLazyBuild.pod},
    q{lib/Moose/Cookbook.pod},
    q{lib/Moose/Meta/Attribute.pm},
    q{lib/Moose/Cookbook/Roles/ApplicationToInstance.pod},
    q{lib/Moose/Cookbook/Basics/Company_Subtypes.pod},
    q{lib/Moose/Meta/Attribute/Native/Trait/Bool.pm},
    q{lib/Moose/Meta/Method/Destructor.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/is_empty.pm},
    q{lib/Moose/Meta/Mixin/AttributeCore.pm},
    q{lib/Moose/Manual/Roles.pod},
    q{lib/Moose/Cookbook/Basics/DateTime_ExtendingNonMooseParent.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/get.pm},
    q{lib/Class/MOP/Method.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/mul.pm},
    q{lib/Class/MOP/Method/Constructor.pm},
    q{lib/Moose/Meta/Attribute/Native/Trait/Code.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Counter/reset.pm},
    q{lib/Moose/Meta/TypeConstraint/Role.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/shallow_clone.pm},
    q{lib/Moose/Meta/Method.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/pop.pm},
    q{lib/Moose/Manual/Types.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/set.pm},
    q{lib/Moose/Meta/Attribute/Native/Trait.pm},
    q{lib/Moose/Spec/Role.pod},
    q{lib/Moose/Meta/Attribute/Native.pm},
    q{lib/Moose/Meta/Role/Application/RoleSummation.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Bool/unset.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Writer.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/clear.pm},
    q{lib/Moose/Meta/Role/Application/ToClass.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/values.pm},
    q{lib/Moose/Manual/Construction.pod},
    q{lib/Moose/Meta/Role/Application/ToInstance.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Bool/toggle.pm},
    q{lib/Moose/Meta/Class/Immutable/Trait.pm},
    q{lib/Moose/Meta/Class.pm},
    q{lib/Moose/Util/TypeConstraints/Builtins.pm},
    q{lib/Class/MOP/Mixin/HasMethods.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/push.pm},
    q{lib/Moose/Error/Confess.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Bool/not.pm},
    q{lib/Moose/Intro.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/abs.pm},
    q{lib/Moose/Cookbook/Basics/Genome_OverloadingSubtypesAndCoercion.pod},
    q{lib/Moose/Meta/TypeCoercion.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/count.pm},
    q{lib/Class/MOP/Method/Inlined.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/insert.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/delete.pm},
    q{lib/Moose/Exporter.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/replace.pm},
    q{lib/Moose/Cookbook/Snack/Types.pod},
    q{lib/Moose/Cookbook/Meta/Labeled_AttributeTrait.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/keys.pm},
    q{lib/Class/MOP/Package.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Code/execute_method.pm},
    q{lib/Moose/Cookbook/Legacy/Table_ClassMetaclass.pod},
    q{lib/Moose/Manual/MOP.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/sub.pm},
    q{lib/Moose/Meta/TypeConstraint/Union.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/uniq.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/set.pm},
    q{lib/Class/MOP/Mixin/AttributeCore.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array.pm},
    q{lib/Moose/Meta/Instance.pm},
    q{lib/Moose/Manual/Contributing.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/first.pm},
    q{lib/Moose/Meta/Role/Method.pm},
    q{lib/Moose/Cookbook/Basics/Document_AugmentAndInner.pod},
    q{lib/Moose/Role.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/mod.pm},
    q{lib/Moose/Cookbook/Meta/PrivateOrPublic_MethodMetaclass.pod},
    q{lib/Moose/Cookbook/Extending/ExtensionOverview.pod},
    q{lib/Moose/Conflicts.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/elements.pm},
    q{lib/Class/MOP/Deprecated.pm},
    q{lib/Moose/Cookbook/Basics/BankAccount_MethodModifiersAndSubclassing.pod},
    q{lib/Moose/Meta/TypeCoercion/Union.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/join.pm},
    q{lib/Moose/Meta/TypeConstraint/Class.pm},
    q{lib/Moose/Cookbook/Meta/WhyMeta.pod},
    q{lib/Class/MOP/Module.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/set.pm},
    q{lib/metaclass.pm},
    q{lib/Class/MOP/Object.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/unshift.pm},
    q{lib/Moose/Meta/TypeConstraint/Enum.pm},
    q{lib/Moose/Meta/Role/Application/ToRole.pm},
    q{lib/Moose/Manual/MooseX.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/natatime.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/shuffle.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/match.pm},
    q{lib/Moose/Cookbook/Basics/Immutable.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Counter/dec.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/exists.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/substr.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/count.pm},
    q{lib/Moose/Cookbook/Meta/Table_MetaclassTrait.pod},
    q{lib/Class/MOP/Class/Immutable/Trait.pm},
    q{lib/Moose/Meta/Attribute/Native/Trait/Hash.pm},
    q{lib/Moose/Meta/Role/Method/Required.pm},
    q{lib/Class/MOP/Attribute.pm},
    q{lib/Class/MOP/Method/Wrapped.pm},
    q{lib/Class/MOP/Instance.pm},
    q{lib/Moose/Meta/Method/Accessor.pm},
    q{lib/Moose/Util/TypeConstraints.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/delete.pm},
    q{lib/Moose/Manual/MethodModifiers.pod},
    q{lib/Moose/Meta/TypeConstraint.pm},
    q{lib/Moose/Cookbook/Roles/Comparable_CodeReuse.pod},
    q{lib/Moose/Cookbook/Basics/Person_BUILDARGSAndBUILD.pod},
    q{lib/Moose/Manual/Concepts.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/String/clear.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/sort_in_place.pm},
    q{lib/Moose/Util/MetaRole.pm},
    q{lib/Moose/Cookbook/Snack/Keywords.pod},
    q{lib/Moose/Util.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/Writer.pm},
    q{lib/Moose/Meta/Attribute/Native/Trait/Counter.pm},
    q{lib/Moose.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/chomp.pm},
    q{lib/Moose/Manual/Unsweetened.pod},
    q{lib/Moose/Meta/Method/Accessor/Native.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Bool/set.pm},
    q{lib/Moose/Error/Croak.pm},
    q{lib/Moose/Deprecated.pm},
    q{lib/Moose/Cookbook/Meta/GlobRef_InstanceMetaclass.pod},
    q{lib/Moose/Meta/TypeConstraint/Parameterizable.pm},
    q{lib/Moose/Meta/Attribute/Native/Trait/Array.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Counter/inc.pm},
    q{lib/Moose/Cookbook/Legacy/Debugging_BaseClassReplacement.pod},
    q{lib/Class/MOP.pm},
    q{lib/Class/MOP/Method/Overload.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/first_index.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/map.pm},
    q{lib/Class/MOP/Mixin/HasAttributes.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/shift.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Counter/Writer.pm},
    q{lib/Moose/Meta/TypeConstraint/Parameterized.pm},
    q{lib/Class/MOP/Mixin.pm},
    q{lib/Moose/Cookbook/Legacy/Labeled_AttributeMetaclass.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/sort.pm},
    q{lib/Moose/Meta/Method/Overridden.pm},
    q{lib/Moose/Error/Util.pm},
    q{lib/Class/MOP/MiniTrait.pm},
    q{lib/Moose/Meta/Role/Method/Conflicting.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/splice.pm},
    q{lib/Moose/Manual/BestPractices.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/Writer.pm},
    q{lib/Moose/Meta/Role.pm},
    q{lib/Moose/Meta/Role/Attribute.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/reduce.pm},
    q{lib/Moose/Meta/Method/Augmented.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/prepend.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/add.pm},
    q{lib/Moose/Meta/Method/Meta.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/String/inc.pm},
    q{lib/Moose/Meta/Method/Delegation.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/elements.pm},
    q{lib/Moose/Cookbook/Basics/BinaryTree_AttributeFeatures.pod},
    q{lib/Moose/Cookbook/Roles/Restartable_AdvancedComposition.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Array/clear.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Reader.pm},
    q{lib/Moose/Error/Default.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Hash/shallow_clone.pm},
    q{lib/Moose/Cookbook/Extending/Mooseish_MooseSugar.pod},
    q{lib/Moose/Meta/Method/Accessor/Native/Number/div.pm},
    q{lib/Class/MOP/Class.pm},
    q{lib/oose.pm},
    q{lib/Moose/Meta/TypeConstraint/Registry.pm},
    q{lib/Moose/Meta/Role/Application.pm},
    q{lib/Moose/Meta/Method/Accessor/Native/Code/execute.pm}
)
{
    my $module_metadata = Module::Metadata->new_from_file($filename);
    foreach my $pkg ($module_metadata->packages_inside)
    {
        my ($bumped, $message) = version_is_bumped($module_metadata, $pkg);
        ok($bumped, $pkg . ' (' . $filename . ') VERSION is ok'
            . ( $message ? (' (' . $message . ')') : '' )
        );
    }
}

done_testing;
