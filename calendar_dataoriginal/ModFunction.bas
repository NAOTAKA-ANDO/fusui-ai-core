Attribute VB_Name = "ModFunction"
Function F_Index(StrSname As String, Str左上 As String, Str左下 As String, Str右上 As String, Str右下 As String, _
                 Val縦値 As Variant, Val横値 As Variant, Valエラ As Variant) As Variant
    Dim Fa As Object
    Dim Fb As Object
    Dim Fc As Object
    Dim Ra As Variant
    Dim Rb As Variant
    Dim Rv As Variant
    Set Fa = Worksheets(StrSname).Range(Str左上 + ":" + Str左下) '
    Set Fb = Worksheets(StrSname).Range(Str左上 + ":" + Str右上) '
    Ra = Application.Match(Val縦値, Fa, 0)
    Rb = Application.Match(Val横値, Fb, 0)
    
    Set Fc = Worksheets(StrSname).Range(Str左上 + ":" + Str右下) '
    Rv = Application.Index(Fc, Ra, Rb)
    
    If IsError(Rv) Then
        Rv = Valエラ       '
    End If
    F_Index = Rv
End Function
Function F_Index2(StrSname As String, Str範囲 As String, _
                 Val値 As Variant, _
            Optional ByVal Valエラ As Variant = "") As Variant
    Dim Fc As Object
    Dim Rv As Variant
    
    Set Fc = Worksheets(StrSname).Range(Str範囲) '
    Rv = Application.Index(Fc, Val値)
    If IsError(Rv) Then
        Rv = Valエラ       '
    End If
    F_Index2 = Rv
End Function
Function F_Vlookup(Val検索値 As Variant, StrSname As String, Str範囲 As String, Int番目 As Integer, Bol方法 As Boolean, Valエラ As Variant) As Variant
    Dim Fa As Object
    Dim Ra As Variant
    Set Fa = Worksheets(StrSname).Range(Str範囲)  '
    Ra = Application.VLookup(Val検索値, Fa, Int番目, Bol方法)
    If IsError(Ra) Then
        Ra = Valエラ       '
    End If
    F_Vlookup = Ra
End Function
Function F_Lookup(Val検索値 As Variant, StrSname As String, Str範囲A As String, Str範囲B As String, _
     Valエラ As Variant) As Variant
    Dim Fa As Object
    Dim Fb As Object
    Dim Rv As Variant
    Set Fa = Worksheets(StrSname).Range(Str範囲A)  '
    Set Fb = Worksheets(StrSname).Range(Str範囲B)  '
        '=LOOKUP(AP5,節入!A3:A1682,節入!B3:B1682)
    Rv = Application.Lookup(Val検索値, Fa, Fb)
    If IsError(Rv) Then
        Rv = Valエラ       '
    End If
    F_Lookup = Rv
End Function

Function F_MATCH(ByVal Val検索値 As Variant, _
                 ByVal StrSname As String, _
                 ByVal Str範囲 As String) As Variant
    
    Dim Fa As Object
    Dim Ra As Variant
    Set Fa = Worksheets(StrSname).Range(Str範囲)  '
    Ra = Application.Match(Val検索値, Fa, 0)
    If IsError(Ra) Then
        Ra = 0
    End If
    F_MATCH = Ra
End Function



