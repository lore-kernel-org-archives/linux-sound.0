From: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Date: Sun, 09 May 2010 20:10:41 +0000
Subject: [PATCH] snd-hda-intel: add support for Lenovo ThinkPad X100e in conexant
Message-Id: <4BE716C1.3030305@udo.edu>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alex.pototskiy@gmail.com, tiwai@suse.de, tdavis@dsl-only.net, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

Ideapad quirks working for my ThinkPad X100e (microphone is not tested).

Signed-off-by: Andrej Gelenberg <andrej.gelenberg@udo.edu>
---
  sound/pci/hda/patch_conexant.c |    1 +
  1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 56e5207..b56c52a 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -2847,6 +2847,7 @@ static struct snd_pci_quirk cxt5066_cfg_tbl[] = {
         SND_PCI_QUIRK(0x1179, 0xff50, "Toshiba Satellite 
P500-PSPGSC-01800T", CXT5066_OLPC_XO_1_5),
         SND_PCI_QUIRK(0x1179, 0xffe0, "Toshiba Satellite Pro T130-15F", 
CXT5066_OLPC_XO_1_5),
         SND_PCI_QUIRK(0x17aa, 0x3a0d, "ideapad", CXT5066_IDEAPAD),
+       SND_PCI_QUIRK(0x17aa, 0x21b2, "ideapad", CXT5066_IDEAPAD), // X100e
         {}
  };

-- 
1.7.1
