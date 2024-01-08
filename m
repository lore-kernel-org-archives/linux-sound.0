Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D846537
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="b9moJa7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1704722771; bh=nL2PXAxj8xHVjZ3jSu0Wl7vn8SurAzbW8nQ2lwaG+rE=;
	h=From:To:Cc:Subject:Date;
	b=b9moJa7y+ANhvcDvag1VbSa8yDQg8rYVO+xSdDF5ANwrguHJkGqbotDrAAfGiynG+
	 QzzaxmSYINbjYFbxrdf8hJ1UThSScH9SozmC/KOCSn4k7YghOUaYwlIKAJ7dQz88WQ
	 v5G5u0Z8nz/ZbYgp2XiDaXc+uD8ESUA3wjAhEaUo=
Received: from levi-pc.. ([61.186.21.12])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 18886C56; Mon, 08 Jan 2024 22:06:08 +0800
X-QQ-mid: xmsmtpt1704722768tooggr5s4
Message-ID: <tencent_BADE40D9A6A1C82B21811A844E5FE3881D06@qq.com>
X-QQ-XMAILINFO: NSmesZGuqQTYRdmtLS77e9DzwLt2CGz7FliX5IdDF8bDD9imGNMIxF30QJkyR7
	 6RAA+4KpUHVoBE/SagbsC3cRyKhU7kgYeTXPGIX0o+cuDBsAxg2amt8coqPgqx2CWGYFMbmKZFT3
	 MtRxTRL9YgZVMqLCSGYMX30xXkBsACOIZ9P5PEnpyzt9NsuqndBwU37EnmuNydKhTxjNLkRAyPPb
	 sr0pa4fUGTHvDkSDIpF2BkQV/fRbi34f9gBs8JCA+3j4DqiAwjZNrg5Rjqr50f0OlmYtP8ZqimU6
	 KmTirnXVGZUTmRECxF6eR+aw3THavqTHHkty/b572jv0/VQ7ADDDuBmbaL1J60kVO+YztMSHWAvS
	 KXv803DgYLFUVNknxe8YxxhDatZ2bM6zNaM5VCaQEZb0gOS6oRLcrBQyCEOeOCGdJ7Lq+zHtR5BK
	 PkzM29bt/KAFiXWCRMuvwL/f7J8hB91Pn3plnpuI+NaINvsQkkQHjd2PGUWHda94qp9sDbvnW2xl
	 9MgCq8M3QoNwdRCa05U0QBYi8Q+Rch1xygt4r+b5kKZXcpFHm12x3rXnJqUl0nOt6I3TNS5XaLGH
	 HhUobZ94WHiq9iUt0nT2lt24uQDW8agzMnUGsMDbnYiGEpYxAQD/ZcOZOtx08PBeqLiBj8cwkJfe
	 Fs265xRgEBJO7Qg2wj/SaGuHE7jzLxx48n78cgeQaYLFGQgDF5Ft5RY2hLs5YKuigdwcXhGW0Tt/
	 NNtn1YZisgWJV6uxBSDN/BWD4i1kdvNO0Cup9LY1bTGdqluYP0n8F4m35yAEMf7I6X5sklJcRUBa
	 4KqA/BOsmTYvLBWda4s2pIJTZu+Jy6h9KRSOnJm4LK0V6EsvcDGvRTXLjCXevukhh/hqWRGX7vHU
	 3rv4xCrsfGF0aGVuxUOMyDCY45dvRO95vEbeKCOUgqlNG4CdAsmac7FhJ7M0wwRV0pUx1POgE5Su
	 ZIMIhJyoLaNa/qRvfFtCoAqooi+hQRrgRutisKgc5bGsEmvt0qIFjTXjGXJzM9KQMU4CBPiYU=
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
Subject: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9.
Date: Mon,  8 Jan 2024 22:04:46 +0800
X-OQ-MSGID: <20240108140446.20418-1-932367230@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9
because those info are missing in the ACPI table.

Before applying the changes: the laptop only have very poor and low
volumn with only up facing builtin speakers (down facing have no sound
at all).

After applying: both down facing (bass) and up facing bultin speakers
will have sound in a reasonable level.

But the behavior of volumn control is actually changing the frequency division: adjust to louder
(which supposed to make overall louder) only makes the up facing bultin speakers louder and downfacing gradually
lower its volumn at the meantime.

Wondering if this is related to ALSA or should make further changes on
the AMP settings?

Signed-off-by: Huayu Zhang <932367230@qq.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 sound/pci/hda/patch_realtek.c        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 35277ce890a4..b1844224123f 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -93,6 +93,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
@@ -427,6 +428,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
+	{ "CSC3551", "17AA38A9", generic_dsd_config },
 	{ "CSC3551", "17AA38B4", generic_dsd_config },
 	{ "CSC3551", "17AA38B5", generic_dsd_config },
 	{ "CSC3551", "17AA38B6", generic_dsd_config },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1dcfba27e075..3eae1a5d9bcd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10256,6 +10256,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38a9, "ThinkBook 16p G4 IRH", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

