From: Vinay K Nallamothu <vinay-rc@naturesoft.net>
Date: Sun, 10 Aug 2003 13:50:35 +0000
Subject: [PATCH 2.6.0-test3][OSS] ac97_plugin_ad1980.c: warning fix
Message-Id: <marc-linux-sound-106052343505211@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

sound/oss/ac97_plugin_ad1980.c:
fix ad1980_remove to have correct number of arguments

without the patch the following compilation warning is thrown:

sound/oss/ac97_plugin_ad1980.c:90: warning: initialization from
incompatible pointer type



--- linux-2.6.0-test3/sound/oss/ac97_plugin_ad1980.c	2003-07-28 10:44:11.000000000 +0530
+++ linux-2.6.0-test3-nvk/sound/oss/ac97_plugin_ad1980.c	2003-08-10 19:36:14.000000000 +0530
@@ -28,6 +28,7 @@
 
 */
 
+#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -45,7 +46,7 @@
  *	use of the codec after the probe function.
  */
  
-static void ad1980_remove(struct ac97_codec *codec)
+static void __devexit ad1980_remove(struct ac97_codec *codec, struct ac97_driver *driver)
 {
 	/* Nothing to do in the simple example */
 }

