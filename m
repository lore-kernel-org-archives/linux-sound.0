Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6116235EEF
	for <linux-sound@vger.kernel.org>; Tue,  9 Jan 2024 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OoFaelhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1704794839; bh=bHXwR8o2dkkh8awSFr8AeZ50naD8NyRwqBsajlWt8SA=;
	h=From:To:Cc:Subject:Date;
	b=OoFaelhGGssCZZlSQwIVSPcgrbJlUH+Cu/rKVIwWxG4/JelYu5AkzTb3USj0Xh7d3
	 8sTqYzEnEZ0IGmDD5KeGD0l7W0jD2TqjNH2zg5KZUk3uZ8zHXx4WSgEiDzXUFW0dCl
	 vn5T2Lc2lz4odKa4APHf/+eizIV9JM0PXgGbAHHM=
Received: from levi-pc.. ([61.186.21.12])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 1D09469E; Tue, 09 Jan 2024 18:07:16 +0800
X-QQ-mid: xmsmtpt1704794836tbdgp73kj
Message-ID: <tencent_2A38F0B4CB780C595FFF086421BAFA064609@qq.com>
X-QQ-XMAILINFO: NsLYjltVP0elhX48sOhc0KXwUU3R1RzQh1HxJkALdcO1vOHMEJHNMcFP8khzKu
	 F+/L501fPZL/8MPdilv4SLgABsRUxTHVVyfuF21VjJXMW64mGErBNvp2YJjh2Vdn8gFLEcr3JyKN
	 T+FaK2HTBHUhQfLsFl9x1WfgWROLXS2+0zSFgjd+YGPlgI0sNtzfXRIIGXxbS77qlBqLBGsE8dQ6
	 FDpdGdNVM4nH9UzI5LnmLYykcVzCT0/PUEmCRmvwLAZuxan1xGki8wf5rVtz5DNp/laK2d2Xbco4
	 eB6L8/KkE5PIl9RDeqMvKdfJB7r5X1gE9Rm8pXayUGcREgnkr07xR3F8H4sTtImJ1c4pJYGVDfgJ
	 OEos4oEzTv6CeGxhVH4f7vM4e67ddUgLMyoOw9gnBU0uYc/fyB+i89Q+wgSx8QbD37NDh5Lhd7l/
	 luJzLLZF4yQSroxTdCkgRFc/GKti/ErAppC4jphz2V6ul/ADt7M0Q5l8khblxEzuN4AIRQOtdKah
	 bymsv1EjZ9ZaOhiJN5tfwscESxoEjXXfIuoR4Rkuz87LYivDgB+GMuz8aw9nqnpoWnYiUnL9BCId
	 2G3glC7B6SmUuPHV0XOnapsvzqaFTlBQlXMKti5k9uZEOiwaC/GeMKUdipdyqjf/W9zSJSwFkL4p
	 QK0ZlmD/FY1AaFQZWJBTcWCf+ZtEmAS8KF9tsIa312vF9iEZQiCDr9BuGYFKYF+IlQ3iI50R0VFS
	 dCOFwXrB9/Yy1JHP80ALpkSmIv0HNwyiDxauMO+s2YhISg/sYUff3tBNouvXozEreHBpGO/O9341
	 W/4k1FdXQ1vezzsXHxAMwmCSud9lwKyyO5Wy/awNFSiQk7hNXku3tz4fmQAvJC2ZVDvpFx2iGHSk
	 w3AbcFMFlBWIHQGy1VqWe9n4pwsvbgvjYgGwpjvbbT6M/wtJQpdkJVABjOPj9araaWh00rFbsGRO
	 5SOF4MtyebQykrjgHsqx8wRNG1IasYdTYMgNQEXP6H6cIjktoMCgwsNbZAqkeM4PNDp+we99LBMZ
	 kbaz2ZtQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Huayu Zhang <932367230@qq.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	zhanghuayu.dev@gmail.com,
	Huayu Zhang <932367230@qq.com>
Subject: [PATCH 2/2] fix SPKID for ssid 0x17aa38a9 and 38ab
Date: Tue,  9 Jan 2024 18:06:57 +0800
X-OQ-MSGID: <20240109100657.8437-1-932367230@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the dmseg has following output after patching:

[    4.401426] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L41 (35a40), Revision: B2
[    4.455038] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L41 (35a40), Revision: B2
[    6.362589] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 17AA38A9, BST: 1, VSPK: 1, CH: L, FW EN: 1, SPKID: 0
[    6.862707] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 17AA38A9, BST: 1, VSPK: 1, CH: R, FW EN: 1, SPKID: 0

And the system volumn control only affect the upfacing speakers nor the
downfacing bass speakers.

Signed-off-by: Huayu Zhang <932367230@qq.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 +++-
 sound/pci/hda/patch_realtek.c        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index b1844224123f..30fb638f5240 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -93,7 +93,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
-	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
+	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
+	{ "17AA38AB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
@@ -429,6 +430,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
 	{ "CSC3551", "17AA38A9", generic_dsd_config },
+	{ "CSC3551", "17AA38AB", generic_dsd_config },
 	{ "CSC3551", "17AA38B4", generic_dsd_config },
 	{ "CSC3551", "17AA38B5", generic_dsd_config },
 	{ "CSC3551", "17AA38B6", generic_dsd_config },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3eae1a5d9bcd..97388c170837 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10257,6 +10257,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a9, "ThinkBook 16p G4 IRH", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38ab, "ThinkBook 16p G4 IRH", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

