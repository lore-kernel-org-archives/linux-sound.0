From: Cemil Degirmenci <cd@deltaweb.de>
Date: Thu, 31 Jul 2003 18:37:18 +0000
Subject: Problems in cs66xx.c with undefined int long and gcc 3.3.1 Kernel
Message-Id: <marc-linux-sound-105967664909490@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello, 

Hello,

this is my first bugreport Ever for the Linux-Kernel so don't blame me :)  

There is a problem compiling the cs46xx.c with gcc 3.3.1 in 2.4.20 and 2.4.21
int long is undefined, so the compiler crashed. A Workarround is here in this patch.

--- cs46-oldxx.c        2003-07-31 20:28:35.000000000 +0200
+++ cs46xx.c    2003-07-28 00:21:11.000000000 +0200
@@ -947,8 +947,8 @@
 
 struct InitStruct
 {
-    u32 long off;
-    u32 long val;
+    u32 off;
+    u32 val;
 } InitArray[] = { {0x00000040, 0x3fc0000f},
                   {0x0000004c, 0x04800000},
 



-- 
Mit freundlichen Gruessen,

Cemil Degirmenci
cd@deltaweb.de



