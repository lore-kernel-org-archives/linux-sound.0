From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:53:14 +0000
Subject: [PATCH] oss/cmpci: fix initdata section references
Message-Id: <20050304215314.75614e58.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/cmpci: fix initdata section reference:

Error: ./sound/oss/cmpci.o .text refers to 000000000000418e R_X86_64_32S      .init.data+0x0000000000000004
Error: ./sound/oss/cmpci.o .text refers to 0000000000004196 R_X86_64_32S      .init.data

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/cmpci.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/cmpci.c~oss_cmpci_sections ./sound/oss/cmpci.c
--- ./sound/oss/cmpci.c~oss_cmpci_sections	2005-03-01 23:38:10.000000000 -0800
+++ ./sound/oss/cmpci.c	2005-03-04 21:09:15.000000000 -0800
@@ -2925,7 +2925,7 @@ static /*const*/ struct file_operations 
 static struct initvol {
 	int mixch;
 	int vol;
-} initvol[] __initdata = {
+} initvol[] __devinitdata = {
 	{ SOUND_MIXER_WRITE_CD, 0x4f4f },
 	{ SOUND_MIXER_WRITE_LINE, 0x4f4f },
 	{ SOUND_MIXER_WRITE_MIC, 0x4f4f },


---
---
~Randy
