From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:53:06 +0000
Subject: [PATCH] oss/cs4281: fix initdata section references
Message-Id: <20050304215306.1f92e87b.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/cs4281: fix initdata section references:

Error: ./sound/oss/cs4281/cs4281.o .text refers to 0000000000006dae R_X86_64_32S      .init.data+0x0000000000000004
Error: ./sound/oss/cs4281/cs4281.o .text refers to 0000000000006db6 R_X86_64_32S      .init.data
Error: ./sound/oss/cs4281/cs4281m.o .text refers to 0000000000006dae R_X86_64_32S      .init.data+0x0000000000000004
Error: ./sound/oss/cs4281/cs4281m.o .text refers to 0000000000006db6 R_X86_64_32S      .init.data

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/cs4281/cs4281m.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/cs4281/cs4281m.c~oss_cs4281_sections ./sound/oss/cs4281/cs4281m.c
--- ./sound/oss/cs4281/cs4281m.c~oss_cs4281_sections	2005-03-01 23:38:33.000000000 -0800
+++ ./sound/oss/cs4281/cs4281m.c	2005-03-04 21:35:51.000000000 -0800
@@ -4096,7 +4096,7 @@ static /*const */ struct file_operations
 static struct initvol {
 	int mixch;
 	int vol;
-} initvol[] __initdata = {
+} initvol[] __devinitdata = {
 
 	{
 	SOUND_MIXER_WRITE_VOLUME, 0x4040}, {

---
---
~Randy
