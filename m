From: Andrei Darashenka
Date: Wed, 04 Dec 2002 16:57:14 +0000
Subject: 2.5.50 mpu401.h compilation error patches
Message-Id: <marc-linux-sound-103902158510403@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I just tried to compile 2.5.50 and found compilation error on mpu401.c

Following patch syncronize mpu401.c and mpu401.h

diff -ur linux-2.5.50/sound/oss/mpu401.h linux-2.5.50-new/sound/oss/mpu401.h
--- linux-2.5.50/sound/oss/mpu401.h     2002-12-04 18:48:07.000000000 +0200
+++ linux-2.5.50-new/sound/oss/mpu401.h 2002-12-04 18:45:50.000000000 +0200
@@ -7,7 +7,7 @@
 
 /*     From mpu401.c */
 int probe_mpu401(struct address_info *hw_config);
-void attach_mpu401(struct address_info * hw_config, struct module *owner);
+int attach_mpu401(struct address_info * hw_config, struct module *owner);
 void unload_mpu401(struct address_info *hw_info);
 
 int intchk_mpu401(void *dev_id);


-- 

Regards,
Andrei

