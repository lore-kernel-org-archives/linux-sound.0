From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:57:52 +0000
Subject: [PATCH] oss/pss: fix section references
Message-Id: <20050304215752.64b6a481.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/pss: fix initdata reference used in exit:

Error: ./sound/oss/pss.o .exit.text refers to 000000000000003f R_X86_64_PC32     .init.data+0x0000000000000003

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/pss.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/pss.c~oss_pss_sections ./sound/oss/pss.c
--- ./sound/oss/pss.c~oss_pss_sections	2005-03-01 23:38:33.000000000 -0800
+++ ./sound/oss/pss.c	2005-03-04 21:29:26.000000000 -0800
@@ -1149,7 +1149,7 @@ static int mss_irq __initdata	= -1;
 static int mss_dma __initdata	= -1;
 static int mpu_io __initdata	= -1;
 static int mpu_irq __initdata	= -1;
-static int pss_no_sound __initdata = 0;	/* Just configure non-sound components */
+static int pss_no_sound = 0;	/* Just configure non-sound components */
 static int pss_keep_settings  = 1;	/* Keep hardware settings at module exit */
 static char *pss_firmware = "/etc/sound/pss_synth";
 


---
