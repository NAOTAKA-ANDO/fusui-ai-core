Attribute VB_Name = "ModFunction"
Function F_Index(StrSname As String, Str���� As String, Str���� As String, Str�E�� As String, Str�E�� As String, _
                 Val�c�l As Variant, Val���l As Variant, Val�G�� As Variant) As Variant
    Dim Fa As Object
    Dim Fb As Object
    Dim Fc As Object
    Dim Ra As Variant
    Dim Rb As Variant
    Dim Rv As Variant
    Set Fa = Worksheets(StrSname).Range(Str���� + ":" + Str����) '
    Set Fb = Worksheets(StrSname).Range(Str���� + ":" + Str�E��) '
    Ra = Application.Match(Val�c�l, Fa, 0)
    Rb = Application.Match(Val���l, Fb, 0)
    
    Set Fc = Worksheets(StrSname).Range(Str���� + ":" + Str�E��) '
    Rv = Application.Index(Fc, Ra, Rb)
    
    If IsError(Rv) Then
        Rv = Val�G��       '
    End If
    F_Index = Rv
End Function
Function F_Index2(StrSname As String, Str�͈� As String, _
                 Val�l As Variant, _
            Optional ByVal Val�G�� As Variant = "") As Variant
    Dim Fc As Object
    Dim Rv As Variant
    
    Set Fc = Worksheets(StrSname).Range(Str�͈�) '
    Rv = Application.Index(Fc, Val�l)
    If IsError(Rv) Then
        Rv = Val�G��       '
    End If
    F_Index2 = Rv
End Function
Function F_Vlookup(Val�����l As Variant, StrSname As String, Str�͈� As String, Int�Ԗ� As Integer, Bol���@ As Boolean, Val�G�� As Variant) As Variant
    Dim Fa As Object
    Dim Ra As Variant
    Set Fa = Worksheets(StrSname).Range(Str�͈�)  '
    Ra = Application.VLookup(Val�����l, Fa, Int�Ԗ�, Bol���@)
    If IsError(Ra) Then
        Ra = Val�G��       '
    End If
    F_Vlookup = Ra
End Function
Function F_Lookup(Val�����l As Variant, StrSname As String, Str�͈�A As String, Str�͈�B As String, _
     Val�G�� As Variant) As Variant
    Dim Fa As Object
    Dim Fb As Object
    Dim Rv As Variant
    Set Fa = Worksheets(StrSname).Range(Str�͈�A)  '
    Set Fb = Worksheets(StrSname).Range(Str�͈�B)  '
        '=LOOKUP(AP5,�ߓ�!A3:A1682,�ߓ�!B3:B1682)
    Rv = Application.Lookup(Val�����l, Fa, Fb)
    If IsError(Rv) Then
        Rv = Val�G��       '
    End If
    F_Lookup = Rv
End Function

Function F_MATCH(ByVal Val�����l As Variant, _
                 ByVal StrSname As String, _
                 ByVal Str�͈� As String) As Variant
    
    Dim Fa As Object
    Dim Ra As Variant
    Set Fa = Worksheets(StrSname).Range(Str�͈�)  '
    Ra = Application.Match(Val�����l, Fa, 0)
    If IsError(Ra) Then
        Ra = 0
    End If
    F_MATCH = Ra
End Function



