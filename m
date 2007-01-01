From: Leonard Norrgard <leonard.norrgard@refactor.fi>
Date: Mon, 01 Jan 2007 17:00:54 +0000
Subject: [PATCH] sound: hda: detect ALC883 on MSI K9A Platinum motherboards
Message-Id: <45993E46.7000904@refactor.fi>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Linus Torvalds <torvalds@osdl.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

From: Leonard Norrg=E5rd <leonard.norrgard@refactor.fi>

Recognize the Realtek ALC883 chip on MSI K9A Platinum motherboards
(model no. MS-7280), enabling full sound capabilities.

Signed-off-by: Leonard Norrg=E5rd <leonard.norrgard@refactor.fi>

---
Error messages seen before this patch:

cannot find the slot for index 0 (range 0-0)
hda-intel: Error creating card!
HDA Intel: probe of 0000:00:14.2 failed with error -12
---

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 29e4c48..4e0c3c1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5070,6 +5070,8 @@ static struct hda_board_config alc883_cfg_tbl[] =3D {
     { .modelname =3D "6stack-dig", .config =3D ALC883_6ST_DIG },
     { .pci_subvendor =3D 0x1462, .pci_subdevice =3D 0x6668,
       .config =3D ALC883_6ST_DIG }, /* MSI  */
+    { .pci_subvendor =3D 0x1462, .pci_subdevice =3D 0x7280,
+      .config =3D ALC883_6ST_DIG }, /* MSI K9A Platinum (MS-7280) */
     { .pci_subvendor =3D 0x105b, .pci_subdevice =3D 0x6668,
       .config =3D ALC883_6ST_DIG }, /* Foxconn */
     { .modelname =3D "6stack-dig-demo", .config =3D ALC888_DEMO_BOARD },


