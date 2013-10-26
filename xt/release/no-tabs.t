use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.05

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'bin/moose-outdated',
    'lib/Class/MOP.pm',
    'lib/Class/MOP/Attribute.pm',
    'lib/Class/MOP/Class.pm',
    'lib/Class/MOP/Class/Immutable/Trait.pm',
    'lib/Class/MOP/Deprecated.pm',
    'lib/Class/MOP/Instance.pm',
    'lib/Class/MOP/Method.pm',
    'lib/Class/MOP/Method/Accessor.pm',
    'lib/Class/MOP/Method/Constructor.pm',
    'lib/Class/MOP/Method/Generated.pm',
    'lib/Class/MOP/Method/Inlined.pm',
    'lib/Class/MOP/Method/Meta.pm',
    'lib/Class/MOP/Method/Overload.pm',
    'lib/Class/MOP/Method/Wrapped.pm',
    'lib/Class/MOP/MiniTrait.pm',
    'lib/Class/MOP/Mixin.pm',
    'lib/Class/MOP/Mixin/AttributeCore.pm',
    'lib/Class/MOP/Mixin/HasAttributes.pm',
    'lib/Class/MOP/Mixin/HasMethods.pm',
    'lib/Class/MOP/Module.pm',
    'lib/Class/MOP/Object.pm',
    'lib/Class/MOP/Package.pm',
    'lib/Moose.pm',
    'lib/Moose/Conflicts.pm',
    'lib/Moose/Cookbook.pod',
    'lib/Moose/Cookbook/Basics/BankAccount_MethodModifiersAndSubclassing.pod',
    'lib/Moose/Cookbook/Basics/BinaryTree_AttributeFeatures.pod',
    'lib/Moose/Cookbook/Basics/BinaryTree_BuilderAndLazyBuild.pod',
    'lib/Moose/Cookbook/Basics/Company_Subtypes.pod',
    'lib/Moose/Cookbook/Basics/DateTime_ExtendingNonMooseParent.pod',
    'lib/Moose/Cookbook/Basics/Document_AugmentAndInner.pod',
    'lib/Moose/Cookbook/Basics/Genome_OverloadingSubtypesAndCoercion.pod',
    'lib/Moose/Cookbook/Basics/HTTP_SubtypesAndCoercion.pod',
    'lib/Moose/Cookbook/Basics/Immutable.pod',
    'lib/Moose/Cookbook/Basics/Person_BUILDARGSAndBUILD.pod',
    'lib/Moose/Cookbook/Basics/Point_AttributesAndSubclassing.pod',
    'lib/Moose/Cookbook/Extending/Debugging_BaseClassRole.pod',
    'lib/Moose/Cookbook/Extending/ExtensionOverview.pod',
    'lib/Moose/Cookbook/Extending/Mooseish_MooseSugar.pod',
    'lib/Moose/Cookbook/Legacy/Debugging_BaseClassReplacement.pod',
    'lib/Moose/Cookbook/Legacy/Labeled_AttributeMetaclass.pod',
    'lib/Moose/Cookbook/Legacy/Table_ClassMetaclass.pod',
    'lib/Moose/Cookbook/Meta/GlobRef_InstanceMetaclass.pod',
    'lib/Moose/Cookbook/Meta/Labeled_AttributeTrait.pod',
    'lib/Moose/Cookbook/Meta/PrivateOrPublic_MethodMetaclass.pod',
    'lib/Moose/Cookbook/Meta/Table_MetaclassTrait.pod',
    'lib/Moose/Cookbook/Meta/WhyMeta.pod',
    'lib/Moose/Cookbook/Roles/ApplicationToInstance.pod',
    'lib/Moose/Cookbook/Roles/Comparable_CodeReuse.pod',
    'lib/Moose/Cookbook/Roles/Restartable_AdvancedComposition.pod',
    'lib/Moose/Cookbook/Snack/Keywords.pod',
    'lib/Moose/Cookbook/Snack/Types.pod',
    'lib/Moose/Cookbook/Style.pod',
    'lib/Moose/Deprecated.pm',
    'lib/Moose/Exception.pm',
    'lib/Moose/Exception/AccessorMustReadWrite.pm',
    'lib/Moose/Exception/AddParameterizableTypeTakesParameterizableType.pm',
    'lib/Moose/Exception/AddRoleTakesAMooseMetaRoleInstance.pm',
    'lib/Moose/Exception/AddRoleToARoleTakesAMooseMetaRole.pm',
    'lib/Moose/Exception/ApplyTakesABlessedInstance.pm',
    'lib/Moose/Exception/AttachToClassNeedsAClassMOPClassInstanceOrASubclass.pm',
    'lib/Moose/Exception/AttributeConflictInRoles.pm',
    'lib/Moose/Exception/AttributeConflictInSummation.pm',
    'lib/Moose/Exception/AttributeExtensionIsNotSupportedInRoles.pm',
    'lib/Moose/Exception/AttributeIsRequired.pm',
    'lib/Moose/Exception/AttributeMustBeAnClassMOPMixinAttributeCoreOrSubclass.pm',
    'lib/Moose/Exception/AttributeNamesDoNotMatch.pm',
    'lib/Moose/Exception/AttributeValueIsNotAnObject.pm',
    'lib/Moose/Exception/AttributeValueIsNotDefined.pm',
    'lib/Moose/Exception/AutoDeRefNeedsArrayRefOrHashRef.pm',
    'lib/Moose/Exception/BadOptionFormat.pm',
    'lib/Moose/Exception/BothBuilderAndDefaultAreNotAllowed.pm',
    'lib/Moose/Exception/BuilderDoesNotExist.pm',
    'lib/Moose/Exception/BuilderMethodNotSupportedForAttribute.pm',
    'lib/Moose/Exception/BuilderMethodNotSupportedForInlineAttribute.pm',
    'lib/Moose/Exception/BuilderMustBeAMethodName.pm',
    'lib/Moose/Exception/CallingMethodOnAnImmutableInstance.pm',
    'lib/Moose/Exception/CallingReadOnlyMethodOnAnImmutableInstance.pm',
    'lib/Moose/Exception/CanExtendOnlyClasses.pm',
    'lib/Moose/Exception/CanOnlyConsumeRole.pm',
    'lib/Moose/Exception/CanOnlyWrapBlessedCode.pm',
    'lib/Moose/Exception/CanReblessOnlyIntoASubclass.pm',
    'lib/Moose/Exception/CanReblessOnlyIntoASuperclass.pm',
    'lib/Moose/Exception/CannotAddAdditionalTypeCoercionsToUnion.pm',
    'lib/Moose/Exception/CannotAddAsAnAttributeToARole.pm',
    'lib/Moose/Exception/CannotApplyBaseClassRolesToRole.pm',
    'lib/Moose/Exception/CannotAssignValueToReadOnlyAccessor.pm',
    'lib/Moose/Exception/CannotAugmentIfLocalMethodPresent.pm',
    'lib/Moose/Exception/CannotAugmentNoSuperMethod.pm',
    'lib/Moose/Exception/CannotAutoDerefWithoutIsa.pm',
    'lib/Moose/Exception/CannotAutoDereferenceTypeConstraint.pm',
    'lib/Moose/Exception/CannotCalculateNativeType.pm',
    'lib/Moose/Exception/CannotCallAnAbstractBaseMethod.pm',
    'lib/Moose/Exception/CannotCallAnAbstractMethod.pm',
    'lib/Moose/Exception/CannotCoerceAWeakRef.pm',
    'lib/Moose/Exception/CannotCoerceAttributeWhichHasNoCoercion.pm',
    'lib/Moose/Exception/CannotCreateHigherOrderTypeWithoutATypeParameter.pm',
    'lib/Moose/Exception/CannotCreateMethodAliasLocalMethodIsPresent.pm',
    'lib/Moose/Exception/CannotCreateMethodAliasLocalMethodIsPresentInClass.pm',
    'lib/Moose/Exception/CannotDelegateLocalMethodIsPresent.pm',
    'lib/Moose/Exception/CannotDelegateWithoutIsa.pm',
    'lib/Moose/Exception/CannotFindDelegateMetaclass.pm',
    'lib/Moose/Exception/CannotFindType.pm',
    'lib/Moose/Exception/CannotFindTypeGivenToMatchOnType.pm',
    'lib/Moose/Exception/CannotFixMetaclassCompatibility.pm',
    'lib/Moose/Exception/CannotGenerateInlineConstraint.pm',
    'lib/Moose/Exception/CannotInitializeMooseMetaRoleComposite.pm',
    'lib/Moose/Exception/CannotInlineTypeConstraintCheck.pm',
    'lib/Moose/Exception/CannotLocatePackageInINC.pm',
    'lib/Moose/Exception/CannotMakeMetaclassCompatible.pm',
    'lib/Moose/Exception/CannotOverrideALocalMethod.pm',
    'lib/Moose/Exception/CannotOverrideBodyOfMetaMethods.pm',
    'lib/Moose/Exception/CannotOverrideLocalMethodIsPresent.pm',
    'lib/Moose/Exception/CannotOverrideNoSuperMethod.pm',
    'lib/Moose/Exception/CannotRegisterUnnamedTypeConstraint.pm',
    'lib/Moose/Exception/CannotUseLazyBuildAndDefaultSimultaneously.pm',
    'lib/Moose/Exception/CircularReferenceInAlso.pm',
    'lib/Moose/Exception/ClassDoesNotHaveInitMeta.pm',
    'lib/Moose/Exception/ClassDoesTheExcludedRole.pm',
    'lib/Moose/Exception/ClassNamesDoNotMatch.pm',
    'lib/Moose/Exception/CloneObjectExpectsAnInstanceOfMetaclass.pm',
    'lib/Moose/Exception/CodeBlockMustBeACodeRef.pm',
    'lib/Moose/Exception/CoercingWithoutCoercions.pm',
    'lib/Moose/Exception/CoercionAlreadyExists.pm',
    'lib/Moose/Exception/CoercionNeedsTypeConstraint.pm',
    'lib/Moose/Exception/ConflictDetectedInCheckRoleExclusions.pm',
    'lib/Moose/Exception/ConflictDetectedInCheckRoleExclusionsInToClass.pm',
    'lib/Moose/Exception/ConstructClassInstanceTakesPackageName.pm',
    'lib/Moose/Exception/CouldNotCreateMethod.pm',
    'lib/Moose/Exception/CouldNotCreateWriter.pm',
    'lib/Moose/Exception/CouldNotEvalConstructor.pm',
    'lib/Moose/Exception/CouldNotEvalDestructor.pm',
    'lib/Moose/Exception/CouldNotFindTypeConstraintToCoerceFrom.pm',
    'lib/Moose/Exception/CouldNotGenerateInlineAttributeMethod.pm',
    'lib/Moose/Exception/CouldNotLocateTypeConstraintForUnion.pm',
    'lib/Moose/Exception/CouldNotParseType.pm',
    'lib/Moose/Exception/CreateMOPClassTakesArrayRefOfAttributes.pm',
    'lib/Moose/Exception/CreateMOPClassTakesArrayRefOfSuperclasses.pm',
    'lib/Moose/Exception/CreateMOPClassTakesHashRefOfMethods.pm',
    'lib/Moose/Exception/CreateTakesArrayRefOfRoles.pm',
    'lib/Moose/Exception/CreateTakesHashRefOfAttributes.pm',
    'lib/Moose/Exception/CreateTakesHashRefOfMethods.pm',
    'lib/Moose/Exception/DefaultToMatchOnTypeMustBeCodeRef.pm',
    'lib/Moose/Exception/DelegationToAClassWhichIsNotLoaded.pm',
    'lib/Moose/Exception/DelegationToARoleWhichIsNotLoaded.pm',
    'lib/Moose/Exception/DelegationToATypeWhichIsNotAClass.pm',
    'lib/Moose/Exception/DoesRequiresRoleName.pm',
    'lib/Moose/Exception/EnumCalledWithAnArrayRefAndAdditionalArgs.pm',
    'lib/Moose/Exception/EnumValuesMustBeString.pm',
    'lib/Moose/Exception/ExtendsMissingArgs.pm',
    'lib/Moose/Exception/HandlesMustBeAHashRef.pm',
    'lib/Moose/Exception/IllegalInheritedOptions.pm',
    'lib/Moose/Exception/IllegalMethodTypeToAddMethodModifier.pm',
    'lib/Moose/Exception/IncompatibleMetaclassOfSuperclass.pm',
    'lib/Moose/Exception/InitMetaRequiresClass.pm',
    'lib/Moose/Exception/InitializeTakesUnBlessedPackageName.pm',
    'lib/Moose/Exception/InstanceBlessedIntoWrongClass.pm',
    'lib/Moose/Exception/InstanceMustBeABlessedReference.pm',
    'lib/Moose/Exception/InvalidArgPassedToMooseUtilMetaRole.pm',
    'lib/Moose/Exception/InvalidArgumentToMethod.pm',
    'lib/Moose/Exception/InvalidArgumentsToTraitAliases.pm',
    'lib/Moose/Exception/InvalidBaseTypeGivenToCreateParameterizedTypeConstraint.pm',
    'lib/Moose/Exception/InvalidHandleValue.pm',
    'lib/Moose/Exception/InvalidHasProvidedInARole.pm',
    'lib/Moose/Exception/InvalidNameForType.pm',
    'lib/Moose/Exception/InvalidRoleApplication.pm',
    'lib/Moose/Exception/InvalidTypeConstraint.pm',
    'lib/Moose/Exception/InvalidTypeGivenToCreateParameterizedTypeConstraint.pm',
    'lib/Moose/Exception/InvalidValueForIs.pm',
    'lib/Moose/Exception/IsaDoesNotDoTheRole.pm',
    'lib/Moose/Exception/IsaLacksDoesMethod.pm',
    'lib/Moose/Exception/LazyAttributeNeedsADefault.pm',
    'lib/Moose/Exception/Legacy.pm',
    'lib/Moose/Exception/MOPAttributeNewNeedsAttributeName.pm',
    'lib/Moose/Exception/MatchActionMustBeACodeRef.pm',
    'lib/Moose/Exception/MessageParameterMustBeCodeRef.pm',
    'lib/Moose/Exception/MetaclassIsAClassNotASubclassOfGivenMetaclass.pm',
    'lib/Moose/Exception/MetaclassIsARoleNotASubclassOfGivenMetaclass.pm',
    'lib/Moose/Exception/MetaclassIsNotASubclassOfGivenMetaclass.pm',
    'lib/Moose/Exception/MetaclassMustBeASubclassOfMooseMetaClass.pm',
    'lib/Moose/Exception/MetaclassMustBeASubclassOfMooseMetaRole.pm',
    'lib/Moose/Exception/MetaclassMustBeDerivedFromClassMOPClass.pm',
    'lib/Moose/Exception/MetaclassNotLoaded.pm',
    'lib/Moose/Exception/MetaclassTypeIncompatible.pm',
    'lib/Moose/Exception/MethodExpectedAMetaclassObject.pm',
    'lib/Moose/Exception/MethodExpectsFewerArgs.pm',
    'lib/Moose/Exception/MethodExpectsMoreArgs.pm',
    'lib/Moose/Exception/MethodModifierNeedsMethodName.pm',
    'lib/Moose/Exception/MethodNameConflictInRoles.pm',
    'lib/Moose/Exception/MethodNameNotFoundInInheritanceHierarchy.pm',
    'lib/Moose/Exception/MethodNameNotGiven.pm',
    'lib/Moose/Exception/MustDefineAMethodName.pm',
    'lib/Moose/Exception/MustDefineAnAttributeName.pm',
    'lib/Moose/Exception/MustHaveAtLeastOneValueToEnumerate.pm',
    'lib/Moose/Exception/MustPassAHashOfOptions.pm',
    'lib/Moose/Exception/MustPassAMooseMetaRoleInstanceOrSubclass.pm',
    'lib/Moose/Exception/MustPassAPackageNameOrAnExistingClassMOPPackageInstance.pm',
    'lib/Moose/Exception/MustPassEvenNumberOfArguments.pm',
    'lib/Moose/Exception/MustPassEvenNumberOfAttributeOptions.pm',
    'lib/Moose/Exception/MustProvideANameForTheAttribute.pm',
    'lib/Moose/Exception/MustSpecifyAtleastOneMethod.pm',
    'lib/Moose/Exception/MustSpecifyAtleastOneRole.pm',
    'lib/Moose/Exception/MustSpecifyAtleastOneRoleToApplicant.pm',
    'lib/Moose/Exception/MustSupplyAClassMOPAttributeInstance.pm',
    'lib/Moose/Exception/MustSupplyADelegateToMethod.pm',
    'lib/Moose/Exception/MustSupplyAMetaclass.pm',
    'lib/Moose/Exception/MustSupplyAMooseMetaAttributeInstance.pm',
    'lib/Moose/Exception/MustSupplyAnAccessorTypeToConstructWith.pm',
    'lib/Moose/Exception/MustSupplyAnAttributeToConstructWith.pm',
    'lib/Moose/Exception/MustSupplyArrayRefAsCurriedArguments.pm',
    'lib/Moose/Exception/MustSupplyPackageNameAndName.pm',
    'lib/Moose/Exception/NeedsTypeConstraintUnionForTypeCoercionUnion.pm',
    'lib/Moose/Exception/NeitherAttributeNorAttributeNameIsGiven.pm',
    'lib/Moose/Exception/NeitherClassNorClassNameIsGiven.pm',
    'lib/Moose/Exception/NeitherRoleNorRoleNameIsGiven.pm',
    'lib/Moose/Exception/NeitherTypeNorTypeNameIsGiven.pm',
    'lib/Moose/Exception/NoAttributeFoundInSuperClass.pm',
    'lib/Moose/Exception/NoBodyToInitializeInAnAbstractBaseClass.pm',
    'lib/Moose/Exception/NoCasesMatched.pm',
    'lib/Moose/Exception/NoConstraintCheckForTypeConstraint.pm',
    'lib/Moose/Exception/NoDestructorClassSpecified.pm',
    'lib/Moose/Exception/NoImmutableTraitSpecifiedForClass.pm',
    'lib/Moose/Exception/NoParentGivenToSubtype.pm',
    'lib/Moose/Exception/OnlyInstancesCanBeCloned.pm',
    'lib/Moose/Exception/OperatorIsRequired.pm',
    'lib/Moose/Exception/OverrideConflictInComposition.pm',
    'lib/Moose/Exception/OverrideConflictInSummation.pm',
    'lib/Moose/Exception/PackageDoesNotUseMooseExporter.pm',
    'lib/Moose/Exception/PackageNameAndNameParamsNotGivenToWrap.pm',
    'lib/Moose/Exception/PackagesAndModulesAreNotCachable.pm',
    'lib/Moose/Exception/ParameterIsNotSubtypeOfParent.pm',
    'lib/Moose/Exception/ReferencesAreNotAllowedAsDefault.pm',
    'lib/Moose/Exception/RequiredAttributeLacksInitialization.pm',
    'lib/Moose/Exception/RequiredAttributeNeedsADefault.pm',
    'lib/Moose/Exception/RequiredMethodsImportedByClass.pm',
    'lib/Moose/Exception/RequiredMethodsNotImplementedByClass.pm',
    'lib/Moose/Exception/Role/Attribute.pm',
    'lib/Moose/Exception/Role/AttributeName.pm',
    'lib/Moose/Exception/Role/Class.pm',
    'lib/Moose/Exception/Role/EitherAttributeOrAttributeName.pm',
    'lib/Moose/Exception/Role/Instance.pm',
    'lib/Moose/Exception/Role/InvalidAttributeOptions.pm',
    'lib/Moose/Exception/Role/Method.pm',
    'lib/Moose/Exception/Role/ParamsHash.pm',
    'lib/Moose/Exception/Role/Role.pm',
    'lib/Moose/Exception/Role/RoleForCreate.pm',
    'lib/Moose/Exception/Role/RoleForCreateMOPClass.pm',
    'lib/Moose/Exception/Role/TypeConstraint.pm',
    'lib/Moose/Exception/RoleDoesTheExcludedRole.pm',
    'lib/Moose/Exception/RoleExclusionConflict.pm',
    'lib/Moose/Exception/RoleNameRequired.pm',
    'lib/Moose/Exception/RoleNameRequiredForMooseMetaRole.pm',
    'lib/Moose/Exception/RoleNamesDoNotMatch.pm',
    'lib/Moose/Exception/RolesDoNotSupportAugment.pm',
    'lib/Moose/Exception/RolesDoNotSupportExtends.pm',
    'lib/Moose/Exception/RolesDoNotSupportInner.pm',
    'lib/Moose/Exception/RolesDoNotSupportRegexReferencesForMethodModifiers.pm',
    'lib/Moose/Exception/RolesInCreateTakesAnArrayRef.pm',
    'lib/Moose/Exception/RolesListMustBeInstancesOfMooseMetaRole.pm',
    'lib/Moose/Exception/SingleParamsToNewMustBeHashRef.pm',
    'lib/Moose/Exception/TriggerMustBeACodeRef.pm',
    'lib/Moose/Exception/TypeConstraintCannotBeUsedForAParameterizableType.pm',
    'lib/Moose/Exception/TypeConstraintIsAlreadyCreated.pm',
    'lib/Moose/Exception/TypeNamesDoNotMatch.pm',
    'lib/Moose/Exception/TypeParameterMustBeMooseMetaType.pm',
    'lib/Moose/Exception/UnableToCanonicalizeHandles.pm',
    'lib/Moose/Exception/UnableToCanonicalizeNonRolePackage.pm',
    'lib/Moose/Exception/UnableToRecognizeDelegateMetaclass.pm',
    'lib/Moose/Exception/UndefinedHashKeysPassedToMethod.pm',
    'lib/Moose/Exception/UnionCalledWithAnArrayRefAndAdditionalArgs.pm',
    'lib/Moose/Exception/UnionTakesAtleastTwoTypeNames.pm',
    'lib/Moose/Exception/ValidationFailedForInlineTypeConstraint.pm',
    'lib/Moose/Exception/ValidationFailedForTypeConstraint.pm',
    'lib/Moose/Exception/WrapTakesACodeRefToBless.pm',
    'lib/Moose/Exception/WrongTypeConstraintGiven.pm',
    'lib/Moose/Exporter.pm',
    'lib/Moose/Intro.pod',
    'lib/Moose/Manual.pod',
    'lib/Moose/Manual/Attributes.pod',
    'lib/Moose/Manual/BestPractices.pod',
    'lib/Moose/Manual/Classes.pod',
    'lib/Moose/Manual/Concepts.pod',
    'lib/Moose/Manual/Construction.pod',
    'lib/Moose/Manual/Contributing.pod',
    'lib/Moose/Manual/Delegation.pod',
    'lib/Moose/Manual/Delta.pod',
    'lib/Moose/Manual/Exceptions.pod',
    'lib/Moose/Manual/Exceptions/Manifest.pod',
    'lib/Moose/Manual/FAQ.pod',
    'lib/Moose/Manual/MOP.pod',
    'lib/Moose/Manual/MethodModifiers.pod',
    'lib/Moose/Manual/MooseX.pod',
    'lib/Moose/Manual/Roles.pod',
    'lib/Moose/Manual/Support.pod',
    'lib/Moose/Manual/Types.pod',
    'lib/Moose/Manual/Unsweetened.pod',
    'lib/Moose/Meta/Attribute.pm',
    'lib/Moose/Meta/Attribute/Native.pm',
    'lib/Moose/Meta/Attribute/Native/Trait.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/Array.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/Bool.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/Code.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/Counter.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/Hash.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/Number.pm',
    'lib/Moose/Meta/Attribute/Native/Trait/String.pm',
    'lib/Moose/Meta/Class.pm',
    'lib/Moose/Meta/Class/Immutable/Trait.pm',
    'lib/Moose/Meta/Instance.pm',
    'lib/Moose/Meta/Method.pm',
    'lib/Moose/Meta/Method/Accessor.pm',
    'lib/Moose/Meta/Method/Accessor/Native.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/Writer.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/accessor.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/clear.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/count.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/delete.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/elements.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/first.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/first_index.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/get.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/grep.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/insert.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/is_empty.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/join.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/map.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/natatime.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/pop.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/push.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/reduce.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/set.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/shallow_clone.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/shift.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/shuffle.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/sort.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/sort_in_place.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/splice.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/uniq.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Array/unshift.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Bool/not.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Bool/set.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Bool/toggle.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Bool/unset.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Code/execute.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Code/execute_method.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Collection.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Counter/Writer.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Counter/dec.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Counter/inc.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Counter/reset.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Counter/set.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/Writer.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/accessor.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/clear.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/count.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/defined.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/delete.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/elements.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/exists.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/get.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/is_empty.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/keys.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/kv.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/set.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/shallow_clone.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Hash/values.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/abs.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/add.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/div.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/mod.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/mul.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/set.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Number/sub.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Reader.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/append.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/chomp.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/chop.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/clear.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/inc.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/length.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/match.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/prepend.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/replace.pm',
    'lib/Moose/Meta/Method/Accessor/Native/String/substr.pm',
    'lib/Moose/Meta/Method/Accessor/Native/Writer.pm',
    'lib/Moose/Meta/Method/Augmented.pm',
    'lib/Moose/Meta/Method/Constructor.pm',
    'lib/Moose/Meta/Method/Delegation.pm',
    'lib/Moose/Meta/Method/Destructor.pm',
    'lib/Moose/Meta/Method/Meta.pm',
    'lib/Moose/Meta/Method/Overridden.pm',
    'lib/Moose/Meta/Mixin/AttributeCore.pm',
    'lib/Moose/Meta/Object/Trait.pm',
    'lib/Moose/Meta/Role.pm',
    'lib/Moose/Meta/Role/Application.pm',
    'lib/Moose/Meta/Role/Application/RoleSummation.pm',
    'lib/Moose/Meta/Role/Application/ToClass.pm',
    'lib/Moose/Meta/Role/Application/ToInstance.pm',
    'lib/Moose/Meta/Role/Application/ToRole.pm',
    'lib/Moose/Meta/Role/Attribute.pm',
    'lib/Moose/Meta/Role/Composite.pm',
    'lib/Moose/Meta/Role/Method.pm',
    'lib/Moose/Meta/Role/Method/Conflicting.pm',
    'lib/Moose/Meta/Role/Method/Required.pm',
    'lib/Moose/Meta/TypeCoercion.pm',
    'lib/Moose/Meta/TypeCoercion/Union.pm',
    'lib/Moose/Meta/TypeConstraint.pm',
    'lib/Moose/Meta/TypeConstraint/Class.pm',
    'lib/Moose/Meta/TypeConstraint/DuckType.pm',
    'lib/Moose/Meta/TypeConstraint/Enum.pm',
    'lib/Moose/Meta/TypeConstraint/Parameterizable.pm',
    'lib/Moose/Meta/TypeConstraint/Parameterized.pm',
    'lib/Moose/Meta/TypeConstraint/Registry.pm',
    'lib/Moose/Meta/TypeConstraint/Role.pm',
    'lib/Moose/Meta/TypeConstraint/Union.pm',
    'lib/Moose/Object.pm',
    'lib/Moose/Role.pm',
    'lib/Moose/Spec/Role.pod',
    'lib/Moose/Unsweetened.pod',
    'lib/Moose/Util.pm',
    'lib/Moose/Util/MetaRole.pm',
    'lib/Moose/Util/TypeConstraints.pm',
    'lib/Moose/Util/TypeConstraints/Builtins.pm',
    'lib/Test/Moose.pm',
    'lib/metaclass.pm',
    'lib/oose.pm'
);

notabs_ok($_) foreach @files;
done_testing;
