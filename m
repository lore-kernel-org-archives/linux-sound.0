From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 15 Jan 2008 21:24:59 +0000
Subject: [PATCH 2/5] sound: fix ad1889 section mismatch
Message-Id: <20080115132459.4902cdef.randy.dunlap@oracle.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: perex@perex.cz, akpm <akpm@linux-foundation.org>, samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix section mismatch in ad1889 by renaming the pci_driver variable to a
whitelisted variable name.

WARNING: vmlinux.o(.data+0x2e5ff0): Section mismatch: reference to .init.text:snd_ad1889_probe (between 'ad1889_pci' and 'index')

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/pci/ad1889.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-2.6.24-rc7-git7.orig/sound/pci/ad1889.c
+++ linux-2.6.24-rc7-git7/sound/pci/ad1889.c
@@ -1055,7 +1055,7 @@ static struct pci_device_id snd_ad1889_i
 };
 MODULE_DEVICE_TABLE(pci, snd_ad1889_ids);
 
-static struct pci_driver ad1889_pci = {
+static struct pci_driver ad1889_pci_driver = {
 	.name = "AD1889 Audio",
 	.id_table = snd_ad1889_ids,
 	.probe = snd_ad1889_probe,
@@ -1065,13 +1065,13 @@ static struct pci_driver ad1889_pci = {
 static int __init
 alsa_ad1889_init(void)
 {
-	return pci_register_driver(&ad1889_pci);
+	return pci_register_driver(&ad1889_pci_driver);
 }
 
 static void __exit
 alsa_ad1889_fini(void)
 {
-	pci_unregister_driver(&ad1889_pci);
+	pci_unregister_driver(&ad1889_pci_driver);
 }
 
 module_init(alsa_ad1889_init);
