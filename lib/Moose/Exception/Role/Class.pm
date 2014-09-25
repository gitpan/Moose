package Moose::Exception::Role::Class;
$Moose::Exception::Role::Class::VERSION = '2.1304'; # TRIAL
use Moose::Role;

has 'class_name' => (
    is            => 'ro',
    isa           => 'Str',
    required      => 1,
    documentation => "This attribute can be used for fetching metaclass instance:\n".
                     "    my \$metaclass_instance = Moose::Util::find_meta( \$exception->class_name );\n",
);

1;
