From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:55:49 +0000
Subject: [PATCH] oss/esssolo1: fix initdata section references
Message-Id: <20050304215549.776833e2.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/esssolo1: fix initdata section reference:

Error: ./sound/oss/esssolo1.o .text refers to 0000000000000bab R_X86_64_32S      .init.data+0x0000000000000004
Error: ./sound/oss/esssolo1.o .text refers to 0000000000000bb2 R_X86_64_32S      .init.data

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/esssolo1.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/esssolo1.c~oss_esssolo1_sections ./sound/oss/esssolo1.c
--- ./sound/oss/esssolo1.c~oss_esssolo1_sections	2005-03-01 23:37:48.000000000 -0800
+++ ./sound/oss/esssolo1.c	2005-03-04 21:19:59.000000000 -0800
@@ -2193,7 +2193,7 @@ static /*const*/ struct file_operations 
 static struct initvol {
 	int mixch;
 	int vol;
-} initvol[] __initdata = {
+} initvol[] __devinitdata = {
 	{ SOUND_MIXER_WRITE_VOLUME, 0x4040 },
 	{ SOUND_MIXER_WRITE_PCM, 0x4040 },
 	{ SOUND_MIXER_WRITE_SYNTH, 0x4040 },


---
