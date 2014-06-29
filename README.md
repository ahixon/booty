booty
=====

Bootkit for Windows 7 x86 and x64.

You should be easily able to adapt this for Windows 8 and up. You might run
into trouble if you're using Secure Boot though (since that's supposed to
verify bootmgr's signing before execution).

Written for COMP9447 at the University of NSW in 2011. I'm releasing it
since it might be useful for somebody else, and also so I don't lose my
own work.

This originally came with a rootkit driver which was meant to do keylogging,
as well as hiding itself and the rootkit installation. However, that code
wasn't written by me so I'm not including it here.

If you're actually making use of the resources here, I would assume you
could come up with one of your own.

License
=======

Released under the MIT license.

Using
=====

Assuming you have any version of Windows 7 x64 SP1 installed (probably works
with-out service pack too, but have not tested), do the following:

1. In Explorer, make sure you can view System and Hidden files.
2. Change ownership from `TrustedInstaller` to `Administrators` group on:
       C:\bootmgr
       C:\WINDOWS\System32\winload.exe
   
   You *also* wanna give yourself (at least) write permissions. Full control
   should do the trick. ;)

3. Overwrite `C:\bootmgr` with `bootmgr-hacks\bootmgr.edited`
4. Overwrite `C:\Windows\System32\winload.exe` with `winload-hacks\winload.exe`
5. Reboot, and cross your fingers!

As mentioned in the report (and inside `payload/install.bat`) this _could_ all
be done automatically.

Getting the driver running on boot
----------------------------------

Copy your rootkit driver into the payload folder as `NPFROOTY.sys`, and run
`payload/install.bat.`

Then just reboot. You should be able to see the driver printing messages
if you run DebugView as Administrator and check all the boxes (ie show kernel
messages etc). You may need to turn on Show boot log and reboot for anything
to come up. DebugView is in winload-hacks\tools if you need it.
