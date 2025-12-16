Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188A2673B0;
	Tue, 16 Dec 2025 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765920169; cv=none; b=DWDuefPz5hjYCLv+QH63uQcRxvi5bSYDaNqk90ETh4Tnawm2Kb0YvQ71k8p1jeQrQmAXCFVxgE3qatXxgQZyTTk909d9sTsq3FL/dLpfb9VVxsQKuknfivkllkF0WPNssxCm7iqDIT3M0DyL4D/YAQsKzT6k8PcCd+i6A/CoisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765920169; c=relaxed/simple;
	bh=RBYGtTm3amflln63YEHsVFZVFwxxfexl+z8dJiDry1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZ3V09DhLgapkOC0PeVfeM8KPziJXuUi3g29ngIJFpfBlzGmrgyZxY9Fb329bA/s5TnsSwpcsR6BAaUSC9s1JfnYdx5R7e7L0wXmPRZ3FJay+5KYUItprbiuuwDTBemFPajiIx2EXWVYgS3rdazkvAqCmQmNptd2LDg5omC5orw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BLFBzMbk; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BLFBzMbk"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 495E8C685E;
	Tue, 16 Dec 2025 23:17:18 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id A0BFFC676F;
	Tue, 16 Dec 2025 23:17:17 +0200 (EET)
Received: from antheas-z13 (adsl-99.79.107.40.tellas.gr [79.107.40.99])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 03BED1FCE22;
	Tue, 16 Dec 2025 23:17:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1765919837;
	bh=kDVF7TchhkZbdqat7XUbOb6j5G523NDr1vtTcYKQ12I=; h=From:To:Subject;
	b=BLFBzMbkH4u6PdgFa/BHvW6TNrD4TT0PrnyoEZ4pX0POWeRCJ29P9K9+y77t5KwCz
	 eL0XWTXlWGadybtCYgLfjnmewwO08KC9qx6eFOASRfzY5buDk76ANR37OYTMJuznqm
	 QxI+ruiCccklPqnozEM4n03xJNRbTh+POHg6yEMvx64F6+0wO9J14iuDj2+CfPIJFl
	 pCGLqk4x4AZhX+IsIP7V2DfdD5mdiQPdyTRum6NI7vSf4Bc4AmNONnS9CSYT8xccGD
	 PJ2lCBhErvrkVoUvaiTis2pPFuCN5YnKj3DWK9INYYhc6iphePDsfYmU85jQ6s8AZ1
	 KQ3iYjBa8jUpA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 79.107.40.99) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	matthew.schwartz@linux.dev,
	Antheas Kapenekakis <lkml@antheas.dev>,
	stable@kernel.org
Subject: [PATCH v1] ALSA: hda/realtek: Add Asus quirk for TAS amplifiers
Date: Tue, 16 Dec 2025 22:17:14 +0100
Message-ID: <20251216211714.1116898-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176591983714.3600275.9087171459208310693@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

By default, these devices use the quirk ALC294_FIXUP_ASUS_SPK. Not
using it causes the headphone jack to stop working. Therefore,
introduce a new quirk ALC287_FIXUP_TXNW2781_I2C_ASUS that binds
to the TAS amplifier while using that quirk.

Cc: stable@kernel.org
Fixes: 18a4895370a7 ("ALSA: hda/realtek: Add match for ASUS Xbox Ally projects")
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
I was pretty busy the last few weeks. Now that the initial quirk is
merged, we should try to get this to fixes as well to prevent this
small regression.

It turns out that when not using a quirk, the fallback is
ALC294_FIXUP_ASUS_SPK and with the quirk optimized for lenovo devices
this causes the audio jack to not work. Other than that, the previous
quirk worked fine.

This was tested on both devices.

@Matt you might want to add a tested-by, since you were the one to test
on Xbox Ally X.

Matt also figured out that the firmware issue on XAX is not related to
the quirks, but to incorrect configuration loading by TAS for dual
amplifiers, which would be a separate patch.

Thanks
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 171a71457ec3..9ad8b6676910 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3753,6 +3753,7 @@ enum {
 	ALC295_FIXUP_DELL_TAS2781_I2C,
 	ALC245_FIXUP_TAS2781_SPI_2,
 	ALC287_FIXUP_TXNW2781_I2C,
+	ALC287_FIXUP_TXNW2781_I2C_ASUS,
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 	ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
@@ -6053,6 +6054,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_TXNW2781_I2C_ASUS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_txnw_i2c,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_SPK,
+	},
 	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = yoga7_14arb7_fixup_i2c,
@@ -6827,8 +6834,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1314, "ASUS GA605K", ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1043, 0x1384, "ASUS RC73XA", ALC287_FIXUP_TXNW2781_I2C),
-	SND_PCI_QUIRK(0x1043, 0x1394, "ASUS RC73YA", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x1384, "ASUS RC73XA", ALC287_FIXUP_TXNW2781_I2C_ASUS),
+	SND_PCI_QUIRK(0x1043, 0x1394, "ASUS RC73YA", ALC287_FIXUP_TXNW2781_I2C_ASUS),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0


