From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:54:35 +0000
Subject: [PATCH] oss/es1370: fix initdata section references
Message-Id: <20050304215435.7e18b830.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/es1370: fix initdata section reference:

Error: ./sound/oss/es1370.o .text refers to 00000000000042bd R_X86_64_32S      .init.data+0x0000000000000024
Error: ./sound/oss/es1370.o .text refers to 00000000000042c5 R_X86_64_32S      .init.data+0x0000000000000020

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/es1370.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/es1370.c~oss_es1370_sections ./sound/oss/es1370.c
--- ./sound/oss/es1370.c~oss_es1370_sections	2005-03-01 23:38:33.000000000 -0800
+++ ./sound/oss/es1370.c	2005-03-04 21:17:17.000000000 -0800
@@ -2540,7 +2540,7 @@ MODULE_LICENSE("GPL");
 static struct initvol {
 	int mixch;
 	int vol;
-} initvol[] __initdata = {
+} initvol[] __devinitdata = {
 	{ SOUND_MIXER_WRITE_VOLUME, 0x4040 },
 	{ SOUND_MIXER_WRITE_PCM, 0x4040 },
 	{ SOUND_MIXER_WRITE_SYNTH, 0x4040 },


---
