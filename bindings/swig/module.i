%module module

%begin %{
#define SWIG_PYTHON_2_UNICODE
%}

#define DEPRECATED(x)

%include <std_map.i>
%include <std_vector.i>
%include <std_string.i>

%import(module="libdnf.common_types") "common_types.i"

%include "catch_error.i"

typedef int Id;

%{
    // make SWIG wrap following headers
    #include "libdnf/module/ModulePackageContainer.hpp"
%}

%inline %{
    typedef libdnf::ModuleDependencies ModuleDependencies;
    typedef libdnf::ModuleProfile ModuleProfile;
%}

%extend libdnf::ModulePackage {
    long __hash__()
    {
        return $self->getId();
    }
}

%template(VectorModulePackagePtr) std::vector<libdnf::ModulePackage *>;
%template(VectorVectorVectorModulePackagePtr) std::vector<std::vector<std::vector<libdnf::ModulePackage *>>>;
%template(VectorModuleProfile) std::vector<libdnf::ModuleProfile>;
%template(VectorModuleDependencies) std::vector<ModuleDependencies>;

%include <std_vector_ext.i>

// this must follow std_vector_ext.i include, otherwise it returns garbage instead of list of strings
%template(MapStringVectorString) std::map<std::string, std::vector<std::string>>;
%template(VectorMapStringVectorString) std::vector<std::map<std::string, std::vector<std::string>>>;

// make SWIG wrap following headers
%nodefaultctor libdnf::ModulePackage;
%nodefaultctor libdnf::ModuleProfile;
%nodefaultctor libdnf::ModuleDependencies;

%include "libdnf/module/modulemd/ModulePackage.hpp"
%ignore libdnf::ModulePackageContainer::Exception;
%ignore libdnf::ModulePackageContainer::NoModuleException;
%ignore libdnf::ModulePackageContainer::NoStreamException;
%ignore libdnf::ModulePackageContainer::EnabledStreamException;
%ignore libdnf::ModulePackageContainer::EnableMultipleStreamsException;
%include "libdnf/module/ModulePackageContainer.hpp"
%include "libdnf/module/modulemd/ModuleProfile.hpp"
%include "libdnf/module/modulemd/ModuleDependencies.hpp"
