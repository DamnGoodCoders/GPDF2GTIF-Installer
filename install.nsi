!define APPNAME "GPDF2GTIF"
!define COMPANYNAME "DGC Software"
!define DESCRIPTION "This program converts Geospatial PDFs to Geo TIFFs using GDAL."
!define VERSIONMAJOR 1
!define VERSIONMINOR 1
!define VERSIONBUILD 1
Icon "icon.ico"

!define REGUNINSTKEY "ca1e7f4c-4809-41c9-9340-2a9c8d11ac5e"
!define REGHKEY HKLM
!define REGPATH_WINUNINST "Software\Microsoft\Windows\CurrentVersion\Uninstall"
InstallDir "$PROGRAMFILES\${APPNAME}"
Name "${APPNAME} -- Installer"
OutFile "${APPNAME} Installer.exe"
DirText "This will install GPDF2GTIF on your computer.  Please choose a directory."
RequestExecutionLevel admin
!include LogicLib.nsh
!macro VerifyUserIsAdmin
UserInfo::GetAccountType
pop $0
${If} $0 != "admin" ;Require admin rights on NT4+
        messageBox mb_iconstop "Administrator rights required!"
        setErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
        quit
${EndIf}
!macroend

function .onInit
	setShellVarContext all
	!insertmacro VerifyUserIsAdmin
functionEnd

Section
SetOutPath $INSTDIR
WriteUninstaller "$INSTDIR\uninstaller.exe"
WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "DisplayName" "${APPNAME}"
WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "UninstallString" '"$INSTDIR\uninstaller.exe"'
WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "Publisher" "${COMPANYNAME}"
File /r "Converter\"

CreateShortCut "$SMPROGRAMS\${APPNAME}.lnk" "$INSTDIR\${APPNAME}.exe" "" "$INSTDIR\icon.ico" 0
CreateShortCut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\${APPNAME}.exe" "" "$INSTDIR\icon.ico" 0

SectionEnd

function un.onInit
	SetShellVarContext all
 
	#Verify the uninstaller - last chance to back out
	MessageBox MB_OKCANCEL "Permanantly remove ${APPNAME}?" IDOK next
		Abort
	next:
	!insertmacro VerifyUserIsAdmin
functionEnd

Section "uninstall"
Delete "$INSTDIR\uninstall.exe"
Delete "$SMPROGRAMS\${APPNAME}.lnk"
Delete "$DESKTOP\${APPNAME}.lnk"
rmDir /r $INSTDIR
DeleteRegKey ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}"
SectionEnd