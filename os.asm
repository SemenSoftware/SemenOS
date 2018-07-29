; Сегмент данных 
section '.data' data readable writeable 
path db '\\.\E:',0 ; Полное имя CD-ROM 
tmp dd ? ; Временная переменная для DeviceIoControl 

; Константы в FASM не определены, делаем это сами 
IOCTL_DISK_EJECT_MEDIA = 74808h 
IOCTL_DISK_LOAD_MEDIA = 7480Ch 

; Сегмент кода 
section '.code' code readable executable 
... 
; Открыть лоток CD-ROM 
invoke CreateFile,path,GENERIC_READ,FILE_SHARE_READ,\ 
NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL 
mov ebx,eax 
invoke DeviceIoControl,ebx,IOCTL_DISK_EJECT_MEDIA,NULL,\ 
NULL,NULL,NULL,tmp,NULL 
invoke CloseHandle,ebx 
... 
; Закрыть лоток CD-ROM 
invoke CreateFile,path,GENERIC_READ,FILE_SHARE_READ,\ 
NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL 
mov ebx,eax 
invoke DeviceIoControl,ebx,IOCTL_DISK_LOAD_MEDIA,NULL,\ 
NULL,NULL,NULL,tmp,NULL 
invoke CloseHandle,ebx
