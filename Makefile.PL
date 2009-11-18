use 5.008008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Net::WolframAlpha',
    VERSION_FROM      => 'lib/Net/WolframAlpha.pm', # finds $VERSION
    PREREQ_PM         => {
	'XML::Simple' => 2.18,
	'LWP::UserAgent' => 5.827,
	'URI::Escape' => 3.29,
	'HTTP::Request::Common' => 5.824 
    }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Net/WolframAlpha.pm', # retrieve abstract from module
       AUTHOR         => 'Gabriel Weinberg <yegg@alum.mit.edu>') : ()),
);
