Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980513C1094;
	Mon,  3 Aug 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748310; cv=none; b=EPTYwFW3yTn2/PTb8NLG6oQauIsJQ2QK/2I8B3hjCVB0NTQmoAQDynfIVXqq1v4/vCovp92NqHvsZE0mwBeBeJlt9jj64sy/9I/5kOCPIYWn3pwmo8HT3QWcRGzf4BzSm3m65ejCLZDOr/bQYqqzwOEly9iJSf8B44wk5AATJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748310; c=relaxed/simple;
	bh=MYCHlNR9mXD9e3RcGWKrzeCumbz9akNULta9EW7tTk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv4vBLibXJ531l0ORoL3TjIYMC95Trrq4BdG/u/c20waDxNiK5McijcbZoib3ECH9vqfZt1/UVLlxNoA56aaOwy/W2HSw9D09Jsw9t/LxUQKn6aAWK/5Shvolri/+h27n/KXAO086OAF1Z0gufQJLFyADm1QxUqXfrYaFt9j6us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=qypj+YqT; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="qypj+YqT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 038A9281793;
	Mon,  3 Aug 2026 11:11:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748306; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jm8oDe1ba7qtkrspo8RF6HoDG04gj5QjwePr4Bf0Hr8=;
	b=qypj+YqTMA1BtMqAih8vfRFw2c3OTsK/KnCOTEczZzoGacBujpR/T8kWjiZbAHQdr+JG+d
	yrjIMejgxqtG+HhACiQM5R0sLGZwGPrKmJdm4/x5dQzBk6K3nZBt/GnOIqBJSAuEqj0Svi
	vgHgouGQcALLlriDpIkXBhR4dGo8SD42IHaYODO1fteUQGC1ojnTbPGphRJ33fIqYnFMlV
	FzQ0oBQs6cgV+ZS8i4bk7nS/+d5TAUgP9lIqBjfcydogcAZ0OyJdwbm3W3XRKVM43s1tQa
	tWi2QNN7wDKSlUHDU4+/TIarMiDqJ5eb9ABzj2MSjegecDfIevxQ5xpH0xSAfg==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] ALSA: hda/realtek: Add ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1
Date: Mon,  3 Aug 2026 16:10:55 +0700
Message-ID: <20260803091102.107570-7-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In preparation for unchaining ALC269_FIXUP_THINKPAD_ACPI from
ALC285_FIXUP_SPEAKER2_TO_DAC1, add
ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1 as a duplicate of
ALC285_FIXUP_SPEAKER2_TO_DAC1.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 473422e236e9..991136bc43ec 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4044,6 +4044,7 @@ enum {
 	ALC225_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC295_FIXUP_DISABLE_DAC3,
 	ALC285_FIXUP_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1,
 	ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1,
 	ALC285_FIXUP_ASUS_HEADSET_MIC,
 	ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS,
@@ -5211,6 +5212,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
 	},
+	[ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
+	},
 	[ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_speaker2_to_dac1,
@@ -8016,7 +8023,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386a, "Lenovo Yoga 7 16IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1),
 	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	HDA_CODEC_QUIRK(0x17aa, 0x38a7, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.55.0
