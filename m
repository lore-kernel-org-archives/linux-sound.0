From: Gerald Teschl <gerald@esi.ac.at>
Date: Sat, 24 Aug 2002 21:26:20 +0000
Subject: [PATCH] ad1848 infinite loop fix
Message-Id: <marc-linux-sound-103022452030488@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I think I found the problem which causes the infinite loop
when the activation fails:

--- linux-2.4.19/drivers/sound/ad1848.c.orig    Sat Aug 24 23:19:54 2002
+++ linux-2.4.19/drivers/sound/ad1848.c Sat Aug 24 23:20:58 2002
@@ -3058,7 +3058,7 @@
        else
                printk(KERN_INFO "ad1848: Failed to initialize %s\n", 
devname);

-       return 0;
+       return -ENODEV;
 }

 static int __init ad1848_isapnp_probe(struct address_info *hw_config)


