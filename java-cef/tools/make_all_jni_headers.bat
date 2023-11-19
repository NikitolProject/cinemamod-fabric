@echo off
:: Copyright (c) 2013 The Chromium Embedded Framework Authors. All rights
:: reserved. Use of this source code is governed by a BSD-style license
:: that can be found in the LICENSE file.

set RETURNCODE=
setlocal

if "%1" == "" (
echo ERROR: Please specify a target platform: win32 or win64
set ERRORLEVEL=1
goto end
)

:: Make sure the source files have been compiled.
call compile.bat %1

call make_jni_header.bat %1 org.org.cef.CefApp
call make_jni_header.bat %1 org.browser.org.cef.CefBrowser_N
call make_jni_header.bat %1 org.browser.org.cef.CefFrame_N
call make_jni_header.bat %1 org.browser.org.cef.CefMessageRouter_N
call make_jni_header.bat %1 org.browser.org.cef.CefRequestContext_N
call make_jni_header.bat %1 org.callback.org.cef.CefAuthCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefBeforeDownloadCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefCommandLine_N
call make_jni_header.bat %1 org.callback.org.cef.CefCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefContextMenuParams_N
call make_jni_header.bat %1 org.callback.org.cef.CefDownloadItem_N
call make_jni_header.bat %1 org.callback.org.cef.CefDownloadItemCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefDragData_N
call make_jni_header.bat %1 org.callback.org.cef.CefFileDialogCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefJSDialogCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefMenuModel_N
call make_jni_header.bat %1 org.callback.org.cef.CefPrintDialogCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefPrintJobCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefQueryCallback_N
call make_jni_header.bat %1 org.callback.org.cef.CefSchemeRegistrar_N
call make_jni_header.bat %1 org.handler.org.cef.CefClientHandler
call make_jni_header.bat %1 org.misc.org.cef.CefPrintSettings_N
call make_jni_header.bat %1 org.network.org.cef.CefCookieManager_N
call make_jni_header.bat %1 org.network.org.cef.CefPostData_N
call make_jni_header.bat %1 org.network.org.cef.CefPostDataElement_N
call make_jni_header.bat %1 org.network.org.cef.CefRequest_N
call make_jni_header.bat %1 org.network.org.cef.CefResponse_N
call make_jni_header.bat %1 org.network.org.cef.CefURLRequest_N

:end
endlocal & set RETURNCODE=%ERRORLEVEL%
goto omega

:returncode
exit /B %RETURNCODE%

:omega
call :returncode %RETURNCODE%
