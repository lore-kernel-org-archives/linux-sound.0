From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 05 Mar 2005 05:56:55 +0000
Subject: [PATCH] oss/nm256: fix section references
Message-Id: <20050304215655.0987a017.rddunlap@osdl.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Cc: torvalds <torvalds@osdl.org>, akpm <akpm@osdl.org>


oss/nm256_audio: fix init text section reference:

Error: ./sound/oss/nm256_audio.o .text refers to 0000000000001847 R_X86_64_PC32     .init.text+0x0000000000000018

Signed-off-by: Randy Dunlap <rddunlap@osdl.org>

diffstat: sound/oss/nm256_audio.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -Naurp ./sound/oss/nm256_audio.c~oss_nm256_sections ./sound/oss/nm256_audio.c
--- ./sound/oss/nm256_audio.c~oss_nm256_sections	2005-03-01 23:38:08.000000000 -0800
+++ ./sound/oss/nm256_audio.c	2005-03-04 21:25:20.000000000 -0800
@@ -1047,7 +1047,7 @@ nm256_peek_for_sig (struct nm256_info *c
  * VERSTR is a human-readable version string.
  */
 
-static int __init
+static int __devinit
 nm256_install(struct pci_dev *pcidev, enum nm256rev rev, char *verstr)
 {
     struct nm256_info *card;


---
