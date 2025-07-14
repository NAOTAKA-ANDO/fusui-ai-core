Attribute VB_Name = "ModCalcSetu"
' 節日を求める
' 引数１＝年（西暦）
' 引数２＝月
'
' 解：日付型
'
Function CalcSetu(ByVal YY As Variant, ByVal MM As Integer) As Double

    Dim IntRootDay As Integer
    Dim IntAngle As Integer
    Select Case MM
    Case 1:         IntRootDay = 5:         IntAngle = 285
    Case 2:         IntRootDay = 4:         IntAngle = 315
    Case 3:         IntRootDay = 5:         IntAngle = 345
    Case 4:         IntRootDay = 5:         IntAngle = 15
    Case 5:         IntRootDay = 5:         IntAngle = 45
    Case 6:         IntRootDay = 5:         IntAngle = 75
    Case 7:         IntRootDay = 7:         IntAngle = 105
    Case 8:         IntRootDay = 7:         IntAngle = 135
    Case 9:         IntRootDay = 7:         IntAngle = 165
    Case 10:        IntRootDay = 8:         IntAngle = 195
    Case 11:        IntRootDay = 7:         IntAngle = 225
    Case 12:        IntRootDay = 6:         IntAngle = 255
    End Select
    
    Dim L0 As Double
    Dim L1 As Double
    Dim L2 As Double
    Dim DL As Double
    Dim LD As Double
    Dim HT   As Double

    L0 = CDbl(IntAngle)
    L1 = CalcKoukei(YY, MM, IntRootDay, 0)
    L2 = CalcKoukei(YY, MM, IntRootDay + 1, 0)
    
    DL = L2 - L1
    LD = L0 - L1
    HT = (LD / DL) * 24
    
    Dim IntAddDD   As Double
    Dim IntAddHH   As Double
    Dim IntAddMM   As Double
'MOD(n,d) = n - d*INT(n/d)  VB とワークシート関数に違いがある mod
    
    IntAddDD = Int(HT / 24)     ' 足す日数
    eee = HT Mod 24
 '   IntAddHH = Int(HT Mod 24)   '足す時間（必ず正数となる）
    
    IntAddHH = Int(HT - 24 * Int(HT / 24)) '足す時間（必ず正数となる）
    
    IntAddMM = Round(((HT - 24 * Int(HT / 24)) - IntAddHH) * 60, 0) ' 足す秒数
    If IntAddMM = 60 Then IntAddMM = 59
CalcSetu = CDbl(DateValue(Format(YY, "0000") & "/" & _
                     Format(MM, "00") & "/" & _
                     Format(IntRootDay + IntAddDD, "00"))) + _
           CDbl(TimeValue(Format(IntAddHH, "00") & ":" & _
                     Format(IntAddMM, "00") & ":00"))

End Function




Function CalcKoukei(ByVal YY As Variant, ByVal MM As Integer, ByVal dd As Integer, ByVal HH As Integer) As Double


'*****************太陽の黄径************************
Dim TA(19) As Double
Dim deg As Double

deg = Application.WorksheetFunction.Pi() / 180

'（１）時刻変数の取得
YY = YY - 2000
If (MM < 3) Then
    MM = MM + 12   '１月２月は１３，１４として計算
    YY = YY - 1     ' 年も前年として

End If
 
'J2000.0からの経過日数
K1 = 365 * YY _
    + 30 * MM _
         + dd _
    - 33.875 _
    + Int(3 * (MM + 1) / 5) _
    + Int(YY / 4)
 
 
 
'ΔTの取得 地球の自転の遅れ

Select Case YY
    Case -18, -19:      DelT = 51
    Case -17:           DelT = 52
    Case -16:           DelT = 53
    Case -15:           DelT = 55
    Case -12, -13, -14: DelT = 56
    Case -9, -10, -11:  DelT = 57
    Case -8:            DelT = 58
    Case -7:            DelT = 59
    Case -6:            DelT = 60
    Case -5:            DelT = 61
    Case -4:            DelT = 62
    Case -2, -3:        DelT = 63
    Case 0, -1:         DelT = 64
    Case Else
        If YY < -19 Then DelT = 51 - (19 + YY) * 0.5    ' １年で約0.5秒
        If 0 < YY Then DelT = 64 + (YY) * 0.5
End Select

t = K1 + (HH / 24) + (DelT / 86400)
t = t / 365.25

TA(0) = 280.4603 + 360.00769 * t
TA(1) = (1.9146 - 0.00005 * t) * Sin(deg * 357.538 + deg * 359.991 * t)
TA(2) = 0.02 * Sin(deg * 355.05 + deg * 719.981 * t)
TA(3) = 0.0048 * Sin(deg * 234.95 + deg * 19.341 * t)
TA(4) = 0.002 * Sin(deg * 247.1 + deg * 329.64 * t)
TA(5) = 0.0018 * Sin(deg * 297.8 + deg * 4452.67 * t)
TA(6) = 0.0018 * Sin(deg * 251.3 + deg * 0.2 * t)
TA(7) = 0.0015 * Sin(deg * 343.2 + deg * 450.37 * t)
TA(8) = 0.0013 * Sin(deg * 81.4 + deg * 225.18 * t)
TA(9) = 0.0008 * Sin(deg * 132.5 + deg * 659.29 * t)
TA(10) = 0.0007 * Sin(deg * 153.3 + deg * 90.38 * t)
TA(11) = 0.0007 * Sin(deg * 206.8 + deg * 30.35 * t)
TA(12) = 0.0006 * Sin(deg * 29.8 + deg * 337.18 * t)
TA(13) = 0.0005 * Sin(deg * 207.4 + deg * 1.5 * t)
TA(14) = 0.0005 * Sin(deg * 291.2 + deg * 22.81 * t)
TA(15) = 0.0004 * Sin(deg * 234.9 + deg * 315.56 * t)
TA(16) = 0.0004 * Sin(deg * 157.3 + deg * 299.3 * t)
TA(17) = 0.0004 * Sin(deg * 21.1 + deg * 720.02 * t)
TA(18) = 0.0003 * Sin(deg * 352.5 + deg * 1079.97 * t)
TA(19) = 0.0003 * Sin(deg * 329.7 + deg * 44.43 * t)

Dim La As Double
La = 0
For i = 0 To 19: La = La + TA(i): Next      '以上の式を集計
CalcKoukei = (La / 360 - Int(La / 360)) * 360

End Function




