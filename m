Received: from mx.brightberry.eu (mx.brightberry.eu [185.229.55.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C27274B3B
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.229.55.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576889; cv=none; b=Myl0dslSxyhHxJqyaRA2v3VKb2puwyJY7axhZpi9mFbQf/fSbKc2r/Q6kmx8qorr5YROaDqTVVVYuZsDRCwPm4PsmOAU4QWjFT5kB+qWzAaImF/uvuxEnqqaDyz9X21NfS94OpqlO8Y9MSYfGr3xEBokBut193Qn4olW0yT4Kik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576889; c=relaxed/simple;
	bh=cle3FIpVj8rMuxtFGWmJq6+qk/rpfD+/VkzLUIDbXRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hcR4nUqTD3Jja6+esqQtdCexkFSAerVhwx3rP/4DAsohheBsjFTxAVnxsw026aSaGmJopGSdT2wN2O2g9IosBpqGMZadv+ktU551RwTHRG2geocJ+Su4SiABCvc33jmjaCSh8Sy0WzjQpmS41DXOWbL1ouNqIxguKkg/VSdeMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanraaij.eu; spf=pass smtp.mailfrom=vanraaij.eu; arc=none smtp.client-ip=185.229.55.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanraaij.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanraaij.eu
Received: from mx.brightberry.eu (localhost [127.0.0.1])
	by mx.brightberry.eu (Proxmox) with ESMTP id AAD803855;
	Thu, 30 Apr 2026 21:14:15 +0200 (CEST)
Received: from yoga9-patch.eml (YST00841.fritz.box [192.168.178.64])
	by mx.brightberry.eu (Proxmox) with ESMTP id 8CF252ED4;
	Thu, 30 Apr 2026 21:14:15 +0200 (CEST)
From: =?UTF-8?q?R=C3=A1mon_van_Raaij?= <ramon@vanraaij.eu>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: hda/realtek: Add codec SSID quirk for Lenovo Yoga Pro 9 16IMH9
Date: Thu, 30 Apr 2026 21:12:24 +0200
Message-Id: <20260430191224.patch1-ramon@vanraaij.eu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Yoga Pro 9 16IMH9 (codec SSID 17aa:38d6) shares PCI audio device
subsystem ID 17aa:3811 with the Legion S7 15IMH05. The existing
SND_PCI_QUIRK entry for the Legion routes both machines to
ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS, which does not bind the TAS2781
smart amplifiers, resulting in near-silent built-in speakers.

Add an HDA_CODEC_QUIRK entry immediately before the conflicting PCI quirk
that matches the Yoga Pro 9's unique codec SSID and routes it to
ALC287_FIXUP_TAS2781_I2C. Codec quirks are evaluated after PCI quirks and
take precedence, leaving the Legion S7 15IMH05 entry unaffected.

This follows the same pattern used to disambiguate PCI SSID 17aa:3847
(shared between Yoga Pro 7 14IMH9 and Legion 7 16ACHG6), where a
HDA_CODEC_QUIRK for codec SSID 17aa:38cf resolves the conflict.

Signed-off-by: Rámon van Raaij <ramon@vanraaij.eu>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ae74e1b69..648051366 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7605,6 +7605,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
+	/* Yoga Pro 9 16IMH9 shares PCI SSID 17aa:3811 with Legion S7 15IMH05;
+	 * use codec SSID to distinguish them
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x38d6, "Lenovo Yoga Pro 9 16IMH9", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3811, "Legion S7 15IMH05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
--
2.54.0


