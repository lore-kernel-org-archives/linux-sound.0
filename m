From: Josh Steiner <jsteiner@antioch-college.edu>
Date: Tue, 16 Feb 1999 01:18:34 +0000
Subject: help set up AWE64G isapnp?
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-559023410-851401618-919127914=:16484"
Message-Id: <marc-linux-sound-91915418808497@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---559023410-851401618-919127914=:16484
Content-Type: TEXT/PLAIN; charset=US-ASCII

I've been wrestling with trying to get my AWE64g pnp running on my RedHat 
box, but arn't getting anywhere.  I've followed all the instructions in 
the sound-howto, awe-mini-howto, isapnp-howto, kernel-howto etc.  to no 
avail.

I am running a RedHat 5.2 box that I upgraded from 5.1.  It is now 
running kernel 2.2.1.  I have compiled the sound drivers as modules.

attached is a copy of my isapnp.conf, which has all the settings that 
windows reports should be correct.

here's what happens when I try to load the sound module:

Script started on Mon Feb 15 20:10:26 1999
[root@bw66 .netscape]# modprobe -a sound
/lib/modules/2.2.1/misc/sb.o: too many values for dma (max 1)
sound: Device or resource busy
[root@bw66 .netscape]# 
[root@bw66 .netscape]# exit

Script done on Mon Feb 15 20:10:40 1999

I'm really quite frustrated and confused.  I've tried this from start to 
finish half a dozen times to make sure I wasn't skipping any steps and i 
can't see where I'm going wrong.  Any help would be GREATLY appriciated, 
since my senior project which is due in 2 march is depending on this.  

Thanks in advace,

Josh

---
Joshua W. H. Steiner - joschi@eds.org - http://eds.org/~joschi

"Some scientists claim that hydrogen, because it is so plentyful, is the
basic building block of the universe. I dispute that. I say there is more
stupidity than hydrogen, and that is the basic building block of the
universe." 
   - Frank Zappa


---559023410-851401618-919127914=:16484
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="isapnp.conf"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.SOL.3.91.990215201834.16484C@antioch-college.edu>
Content-Description: 

IyAkSWQ6IHBucGR1bXAuYyx2IDEuMTAgMTk5Ny8wNy8xNCAyMjozMDo0NyBm
b3ggRXhwICQNCiMgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBzZWUgdGhlIHNv
dXJjZXMgZm9yIGRldGFpbHMuDQojIFRoaXMgc29mdHdhcmUgaGFzIE5PIFdB
UlJBTlRZLCB1c2UgYXQgeW91ciBPV04gUklTSw0KIw0KIyBGb3IgZGV0YWls
cyBvZiB0aGlzIGZpbGUgZm9ybWF0LCBzZWUgaXNhcG5wLmNvbmYoNSkNCiMN
CiMgRm9yIGxhdGVzdCBpbmZvcm1hdGlvbiBvbiBpc2FwbnAgYW5kIHBucGR1
bXAgc2VlOg0KIyBodHRwOi8vd3d3LnJvZXN0b2NrLmRlbW9uLmNvLnVrL2lz
YXBucHRvb2xzLw0KIw0KIyBDb21waWxlciBmbGFnczogLURSRUFMVElNRSAt
RE5FRURTRVRTQ0hFRFVMRVINCiMNCiMgVHJ5aW5nIHBvcnQgYWRkcmVzcyAw
MjAzDQojIEJvYXJkIDEgaGFzIHNlcmlhbCBpZGVudGlmaWVyIDQwIDA5IDUz
IDdjIDhmIDllIDAwIDhjIDBlDQoNCiMgKERFQlVHKQ0KKFJFQURQT1JUIDB4
MDIwMykNCihJU09MQVRFKQ0KKElERU5USUZZICopDQoNCiMgQU5TSSBzdHJp
bmcgLS0+Q3JlYXRpdmUgU0IgQVdFNjQgR29sZDwtLQ0KDQooQ09ORklHVVJF
IENUTDAwOWUvMTU2NDY2MzE5IChMRCAwDQojICAgICBBTlNJIHN0cmluZyAt
LT5BdWRpbzwtLQ0KICAgKElOVCAwIChJUlEgIDUgKE1PREUgK0UpKSkNCiAg
IChETUEgMCAoQ0hBTk5FTCAgMSkpDQogICAoRE1BIDEgKENIQU5ORUwgIDUp
KQ0KICAgKElPIDAgKEJBU0UgMHgyMjApKQ0KICAgKElPIDEgKEJBU0UgMHgw
MzMwKSkNCiAgIChJTyAyIChCQVNFIDB4MDM4OCkpDQogICAoQUNUIFkpDQop
KQ0KDQooQ09ORklHVVJFIENUTDAwOWUvMTU2NDY2MzE5IChMRCAxDQojICAg
ICBBTlNJIHN0cmluZyAtLT5HYW1lPC0tDQogICAoSU8gMCAoQkFTRSAweDAy
MDApKQ0KICAgKEFDVCBZKQ0KKSkNCg0KKENPTkZJR1VSRSBDVEwwMDllLzE1
NjQ2NjMxOSAoTEQgMg0KIyAgICAgQU5TSSBzdHJpbmcgLS0+V2F2ZVRhYmxl
PC0tDQoNCiAgIChJTyAwIChCQVNFIDB4MDYyMCkpDQogICAoSU8gMCAoQkFT
RSAweDBBMjApKQ0KICAgKElPIDAgKEJBU0UgMHgwRTIwKSkNCiAgIChBQ1Qg
WSkNCikpDQoNCiMgUmV0dXJucyBhbGwgY2FyZHMgdG8gdGhlICJXYWl0IGZv
ciBLZXkiIHN0YXRlDQooV0FJVEZPUktFWSkNCg==
---559023410-851401618-919127914=:16484--
