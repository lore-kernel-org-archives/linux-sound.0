From: "Joey Lee" <jlee@novell.com>
Date: Sat, 29 May 2010 01:23:50 +0000
Subject: [PATCH] Add 92HD81B1X5 to stac92hd83xxx_cfg_tbl[] for mute LED
Message-Id: <4C00F946020000230001A3FC@novprvlin0050.provo.novell.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=__PartFED3BFB6.0__="
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__PartFED3BFB6.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Takashi,=20

The attached is my patch to=20

Add 92HD81B1X5 subsystem id 0x103c1584 to stac92hd83xxx_cfg_tbl[] for
mute LED support on HP mini.

Please kindly help review it.


Thank's a lot!
Joey Lee


Add 92HD81B1X5 subsystem id 0x103c1584 to stac92hd83xxx_cfg_tbl[] for
mute LED support on HP mini.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 sound/pci/hda/patch_sigmatel.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/sound/pci/hda/patch_sigmatel.c
b/sound/pci/hda/patch_sigmatel.c
index f1e7bab..18b75bd 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -1655,6 +1655,8 @@ static struct snd_pci_quirk
stac92hd83xxx_cfg_tbl[] =3D {
                      "unknown Dell", STAC_DELL_S14),
        SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x3600,
                      "HP", STAC_92HD83XXX_HP),
+       SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x1500,
+                       "HP", STAC_92HD83XXX_HP),
        {} /* terminator */
 };

--=20
1.6.0.2


--=__PartFED3BFB6.0__=
Content-Type: text/plain; name="Add-92HD81B1X5-to-stac92hd83xxx_cfg_tbl-for-mute-L.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="Add-92HD81B1X5-to-stac92hd83xxx_cfg_tbl-for-mute-L.patch"

From e32ef26f88d2a2217ce70e5a04bf5c1d9973649e Mon Sep 17 00:00:00 =
2001=0AFrom: Lee, Chun-Yi <jlee@novell.com>=0ADate: Thu, 27 May 2010 =
19:52:47 +0800=0ASubject: [PATCH] Add 92HD81B1X5 to stac92hd83xxx_cfg_tbl[]=
 for mute LED support on HP mini=0A=0AAdd 92HD81B1X5 subsystem id =
0x103c1584 to stac92hd83xxx_cfg_tbl[] for=0Amute LED support on HP =
mini.=0A=0ASigned-off-by: Lee, Chun-Yi <jlee@novell.com>=0A---=0A =
sound/pci/hda/patch_sigmatel.c |    2 ++=0A 1 files changed, 2 insertions(+=
), 0 deletions(-)=0A=0Adiff --git a/sound/pci/hda/patch_sigmatel.c =
b/sound/pci/hda/patch_sigmatel.c=0Aindex f1e7bab..18b75bd 100644=0A--- =
a/sound/pci/hda/patch_sigmatel.c=0A+++ b/sound/pci/hda/patch_sigmatel.c=0A@=
@ -1655,6 +1655,8 @@ static struct snd_pci_quirk stac92hd83xxx_cfg_tbl[] =
=3D {=0A 		      "unknown Dell", STAC_DELL_S14),=0A 	=
SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x3600,=0A 		   =
   "HP", STAC_92HD83XXX_HP),=0A+	SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP=
, 0xff00, 0x1500,=0A+			"HP", STAC_92HD83XXX_HP),=0A 	{} =
/* terminator */=0A };=0A =0A-- =0A1.6.0.2=0A=0A
--=__PartFED3BFB6.0__=--
