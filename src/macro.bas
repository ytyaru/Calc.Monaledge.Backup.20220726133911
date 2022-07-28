' 記事IDとタイトルのTSVファイルを出力したい
Option VBASupport 1
Sub Export()
	Dim row as integer
	Dim col as integer
	row = 1
	text = ""
	Do
		id = ThisComponent.Sheets(0).getCellByPosition(0,row).String
		title = ThisComponent.Sheets(0).getCellByPosition(2,row).String
		If 0 < Len(id) Then
			text = text & id & Chr(9) & title & Chr(10)
			md = ThisComponent.Sheets(0).getCellByPosition(3,row).String
			WriteArticles id, title, md
		Else
			Exit Do
		End If
		row = row + 1
	Loop While 0 < Len(id)
	WriteList(Trim(text))
	Msgbox("処理完了") 
End Sub

Sub WriteList(strData as String)
	Dim strFileName As String
	Dim intFileNo As Integer
	strFileName = DirPath & "/list.tsv"
	intFileNo = FreeFile() 
	Open strFileName For Output As #intFileNo
	Print #intFileNo, strData
	Close #intFileNo
End Sub

Sub WriteArticles(id as String, title as String, md as String)
	Dim strFileName As String
	Dim intFileNo As Integer
	strFileName = DirPath & "/" & id & ".md"
	intFileNo = FreeFile() 
	Open strFileName For Output As #intFileNo
	Print #intFileNo, title & Chr(10) & Chr(10) & md
	Close #intFileNo
End Sub

Function DirPath() as String
	strDirPath = ThisComponent.Sheets(0).getCellByPosition(8,0).String
	If 0 < Len(Trim(strDirPath)) < 1 Then
		strDirPath = "/tmp/work/monaledge/backup"
	End If
	DirPath = strDirPath
End Function

