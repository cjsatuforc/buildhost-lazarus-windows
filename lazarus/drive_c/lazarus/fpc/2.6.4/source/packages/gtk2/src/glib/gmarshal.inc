// included by glib2.pas

{$IFDEF read_forward_definitions}
{$ENDIF read_forward_definitions}

//------------------------------------------------------------------------------

{$IFDEF read_interface_types}
{$ENDIF read_interface_types}

//------------------------------------------------------------------------------

{$IFDEF read_interface_rest}
procedure g_cclosure_marshal_VOID__VOID(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__BOOLEAN(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__CHAR(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__UCHAR(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__INT(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__UINT(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__LONG(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__ULONG(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__ENUM(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__FLAGS(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__FLOAT(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__DOUBLE(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__STRING(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__PARAM(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__BOXED(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__POINTER(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__OBJECT(closure:PGClosure; return_value:PGValue;
  n_param_values:GUInt; param_values:PGValue; invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_STRING__OBJECT_POINTER(closure:PGClosure;
  return_value:PGValue; n_param_values:GUInt; param_values:PGValue;
  invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_VOID__UINT_POINTER(closure:PGClosure;
  return_value:PGValue; n_param_values:GUInt; param_values:PGValue;
  invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;
procedure g_cclosure_marshal_BOOLEAN__FLAGS(closure:PGClosure;
  return_value:PGValue; n_param_values:GUInt; param_values:PGValue;
  invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gobjectlib;

procedure g_cclosure_marshal_BOOL__FLAGS(closure:PGClosure;
  return_value:PGValue; n_param_values:GUInt; param_values:PGValue;
  invocation_hint:GPointer;
  marshal_data:GPointer);cdecl;external gliblib name 'g_cclosure_marshal_BOOLEAN__FLAGS';
{$ENDIF read_interface_rest}
// included by glib2.pas

