From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:58:43 +0000
Subject: [PATCH] oss/sscape: fix section references
Message-Id: <20050304215843.3a111600.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/sscape: fix initdata reference used in exit:

Error: ./sound/oss/sscape.o .exit.text refers to 000000000000007d R_X86_64_PC32     .init.data+0x0000000000000003

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/sscape.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/sscape.c~oss_sscape_sections ./sound/oss/sscape.c
--- ./sound/oss/sscape.c~oss_sscape_sections	2005-03-01 23:38:12.000000000 -0800
+++ ./sound/oss/sscape.c	2005-03-04 21:32:05.000000000 -0800
@@ -1393,7 +1393,7 @@ static struct address_info cfg;
 static struct address_info cfg_mpu;
 
 static int __initdata spea = -1;
-static int __initdata mss = 0;
+static int mss = 0;
 static int __initdata dma = -1;
 static int __initdata irq = -1;
 static int __initdata io = -1;


---
